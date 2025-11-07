# MCP Troubleshooting Guide

**Last Updated:** November 7, 2025  
**Version:** 1.3

---

## Quick Reference

| Issue | Solution | Time |
|-------|----------|------|
| PII permission errors after CloudDo permit claimed | Wait 5 min (auth cache TTL) → `mcp-refresh` → retry | 5 min |
| "Not connected" errors | `mcp-refresh` then retry query | 10 sec |
| OAuth/authentication failures | `mcp-refresh` + Cursor restart if needed | 30 sec |
| Stale cached tokens | `mcp-full` (kills all + clears locks) | 15 sec |
| Merchant sync failures | Check auth, try alternate spellings, expand date range | 1-5 min |
| Gumloop/Salesforce write failures | Check Opp ID, validate format, re-query Salesforce | 2 min |

---

## Issue 1: PII Permission Errors After Claiming CloudDo Permit

### Symptoms
```
Error: You do not have access to PII tools.
To access PII tools, you need the 'sdp-pii' CloudDo permit
```

**Even after:**
- ✅ Claiming the permit from CloudDo (https://clouddo.shopify.io/permits?claim=sdp-pii)
- ✅ Restarting Cursor completely
- ✅ Restarting MCP servers via Command Palette

**⚠️ IMPORTANT: Permit expires every 6 hours**
You'll need to re-claim the permit multiple times per day. If you claimed it in the morning, expect to claim again in the afternoon.

**💡 Pro Tip:** [Automate daily claims with Apple Shortcuts](https://shopify.slack.com/archives/C087X4TK5DJ/p1760540597748919?thread_ts=1760527490.088809&cid=C087X4TK5DJ) to save time (setup takes 2 minutes, saves 10+ min/day)

### Root Cause (Confirmed by Revenue Team)

**1. Authorization Layer Cache (~5 minute TTL)**
- CloudDo updates permits immediately, but the **authorization layer** keeps a short cache of entitlements
- Cache TTL: **~300 seconds (5 minutes)**, sometimes up to 10 minutes
- New OAuth tokens minted during this window won't include the new permits until cache refreshes
- **No self-serve cache invalidation endpoint exists** - you must wait for cache to expire

**Architecture:**
```
CloudDo (permits) → Auth Layer (cached ~5 min) → Minerva OAuth (token minting)
                         ↑ THIS IS THE BOTTLENECK
```

**2. Local Token Cache (MCP process)**
- The `shopify-mcp-bridge` process holds the OAuth token in memory
- Simply restarting Cursor doesn't kill this process - it persists
- Must kill process to force fresh OAuth, but **only helps after upstream cache expires**

**Why both matter:**
- Kill process **before** cache expires → still get old permissions
- Wait 5+ minutes but **don't** kill process → still using old cached token
- **Best practice:** Wait 5 minutes after claiming permit, THEN run `mcp-refresh`

### Solution (Proven Fix)

**Official Workflow (Based on Revenue Team Guidance)**

```bash
# Step 1: Claim permit at https://clouddo.shopify.io/permits

# Step 2: WAIT ~5 MINUTES for authorization cache to expire
# This is NOT optional - there's a ~300 second cache TTL on the auth layer
# No workaround exists to speed this up

# Step 3: Kill the old MCP process to force fresh OAuth
pkill -9 -f "shopify-mcp-bridge"

# Or use the alias:
mcp-refresh
```

**What happens:**
- CloudDo updates permit instantly ✅
- Authorization layer cache expires after ~5 min ✅
- Kill MCP process to force new OAuth token request ✅
- New token is minted with updated permits ✅

**Why you can't skip the wait:**
- Killing the process immediately doesn't help - the upstream auth cache still has old permits
- The only guaranteed fix is: **wait for cache expiry + obtain brand new token**
- Platform teams can force refresh in urgent cases, but it's not scalable/standard

### Why This Works
- **Authorization cache TTL**: Auth layer refreshes entitlements every ~300 seconds (5 min)
- **Token caching**: `shopify-mcp-bridge` holds OAuth tokens in memory + macOS Keychain
- **Process persistence**: Running process persists across Cursor restarts
- **Fresh OAuth required**: Must obtain brand new token after cache expiry
- **No shortcuts**: No self-serve cache invalidation endpoint exists

### Why Multiple Cursor Restarts Don't Work
People restart Cursor multiple times because:
1. Cursor restart doesn't kill the MCP process ❌
2. Process still has old token cached ❌
3. Authorization layer cache hasn't expired yet (still ~5 min) ❌
4. Eventually cache expires (5 min) ✅ + some restart kills process ✅
5. Looks like "Cursor fixed it" but was actually **waiting for auth cache TTL**

### Future Improvements (Per Revenue Team)
Potential fixes being considered:
- Lower cache TTL for dev/SE clients
- Event-driven push/refresh of entitlements to auth layer
- Controlled "refresh entitlements" endpoint or UI action
- No ETA yet, but this is known friction

### Historical Context (From Slack)
- **Sept 25, 2025**: Keji (Revenue team) confirmed "5-7 mins before permit kicks in"
- **Oct 17, 2025**: Multiple users (Rohan, Andy, Mary) reported same "CloudDo shows permit but revenue-mcp doesn't see it" issue
- **Common pattern**: People restart Cursor multiple times, doesn't help until cache expires
- **This troubleshooting guide**: Documents the confirmed root cause and optimal workflow

### Verification
After the fix, you should see successful queries instead of permission errors.

---

## Issue 2: "Not Connected" Errors

### Symptoms
```
{"error":"Not connected"}
```

### Solution
**Quick Fix:**
```bash
pkill -9 -f "shopify-mcp-bridge"
```
Then retry your query - the MCP will auto-restart with fresh connection.

**If that fails:**
- Full Cursor restart (`Cmd+Q` → Reopen)
- Check Cursor's Output panel for MCP error logs

---

## Issue 3: OAuth/Authentication Failures

### Symptoms
- "Authentication failed" errors
- "Invalid token" errors
- OAuth redirect loops

### Solution
**Full Reset:**
1. Kill MCP processes: `pkill -9 -f "shopify-mcp-bridge"`
2. Quit Cursor completely (`Cmd+Q`)
3. Reopen Cursor
4. Use any MCP tool - it will auto-restart and prompt for OAuth if needed

**Manual Token Clearing (Advanced):**
```bash
# Check for cached tokens (usually none, managed by keychain)
~/.local/share/uv/tools/shopify-mcp-bridge/bin/python3 -c "
import keyring
client_id = '0oa1ao6npm85AT2Hr0x8'  # revenue-mcp client ID
service = f'shopify-mcp-bridge-{client_id}'
token = keyring.get_password(service, 'token')
if token:
    keyring.delete_password(service, 'token')
    print('Token cleared')
else:
    print('No token found')
"
```

---

## Issue 4: Stale Cached Tokens (Rare)

### When to Use This
Only if the above solutions don't work and you suspect corrupted cache.

### Token Storage Architecture
`shopify-mcp-bridge` stores OAuth tokens via:
- **Storage**: Python `keyring` library → macOS Keychain
- **Cache Key**: `shopify-mcp-bridge-{CLIENT_ID}`
- **Location**: System keychain (no files)
- **Lock Files**: `/tmp/shopify-mcp-bridge-*.lock`

### Full Cache Clear
```bash
# Clear lock files
rm -f /tmp/shopify-mcp-bridge-*.lock

# Kill all processes (use alias if configured)
pkill -9 -f "shopify-mcp-bridge"

# Restart Cursor
# MCPs will auto-restart on next use with fresh auth
```

---

## MCP-Specific Troubleshooting

### revenue-mcp (Salesforce, Company Enrichment)
- **Auth**: Minerva OAuth via CloudDo permits
- **Required Permit**: `sdp-pii` for Salesforce queries
- **Client ID**: `0oa1ao6npm85AT2Hr0x8`
- **Config**: `~/.cursor/mcp.json` → `revenue-mcp`

### support-core (Help Center, Zendesk)
- **Auth**: Minerva OAuth
- **Client ID**: `0oa1bpdvm5ia0Zzhs0x8`
- **No Special Permits**: Works with standard Shopify auth

### data-portal-mcp (BigQuery)
- **Auth**: Google Cloud credentials
- **Permit**: Standard BigQuery access
- **Different auth flow**: Not affected by shopify-mcp-bridge

### gworkspace-mcp (Gmail, Drive, Docs)
- **Auth**: Google OAuth (separate from Minerva)
- **Token Storage**: `~/.gworkspace_mcp/oauth_token.pickle`
- **Different auth system**: Not affected by Minerva permits

---

## Diagnostic Commands

### Check Running MCP Processes
```bash
ps aux | grep -i mcp | grep -v grep
```

### Check MCP Configuration
```bash
cat ~/.cursor/mcp.json | jq '.mcpServers | keys'
```

### Test Specific MCP
In Cursor, run a simple query for the MCP you're testing:
- `revenue-mcp`: Query a known Salesforce record
- `gworkspace-mcp`: Search Drive for a known file
- `support-core`: Search help center

---

## Prevention Tips

1. **After Claiming New CloudDo Permits:**
   - **Wait ~5 minutes** for authorization cache to expire (NOT optional - no workaround)
   - Run: `mcp-refresh` (or `pkill -9 -f "shopify-mcp-bridge"`)
   - Don't assume Cursor restart is enough - must kill process AND wait
   - If still getting errors, wait full 10 minutes (worst case cache TTL)

2. **Before Important Work:**
   - Test MCP connectivity with simple queries
   - Verify permissions are working

3. **Regular Maintenance:**
   - Clear `/tmp/shopify-mcp-bridge-*.lock` files weekly
   - If MCPs feel slow, run `mcp-refresh` to clear stale processes

4. **Shell Aliases for Speed:**
   Add to `~/.zshrc` (or `~/.bashrc`):
   ```bash
   alias mcp-refresh='pkill -9 -f "shopify-mcp-bridge" && echo "✓ MCP refresh complete"'
   alias mcp-full='pkill -9 -f "shopify-mcp-bridge|uvx|node.*mcp" && rm -f /tmp/shopify-mcp-bridge-*.lock && echo "✓ Full MCP reset complete"'
   ```
   Then reload: `source ~/.zshrc`

5. **Reduce Permit Toggling Friction:**
   - **💡 Automate daily claims with Apple Shortcuts** ([see Boris Jovic's setup](https://shopify.slack.com/archives/C087X4TK5DJ/p1760540597748919?thread_ts=1760527490.088809&cid=C087X4TK5DJ)):
     - Create Shortcut: Open `https://clouddo.shopify.io/permits?claim=sdp-pii`
     - Set automation: Run at 8am daily (+ optional 2pm renewal)
     - Add desktop widget for quick re-claiming
     - **This saves 10+ minutes per day** of manual permit claiming
   - Consider a dedicated sandbox user with stable superset role for testing
   - Separate Cursor profiles for PII vs non-PII work (keeps one "warmed up")
   - Claim permits at start of day, not mid-workflow

---

## Emergency Checklist

When MCPs completely stop working:

- [ ] Kill all MCP processes: `pkill -9 -f "shopify-mcp-bridge|uvx|node.*mcp"`
- [ ] Clear lock files: `rm -f /tmp/shopify-mcp-bridge-*.lock`
- [ ] Quit Cursor (`Cmd+Q`)
- [ ] Reopen Cursor
- [ ] Test with simple query (MCPs auto-restart)
- [ ] If still failing: Check CloudDo permit status at https://clouddo.shopify.io/permits
- [ ] If still failing: Re-authenticate Google OAuth (for gworkspace-mcp issues)

---

## Issue 5: Merchant Sync Troubleshooting

### Symptoms
Problems during merchant context synchronization (Gmail, Slack, Drive).

### Common Issues & Solutions

**No sync evidence found**
- **Symptom**: Can't determine last sync date
- **Solution**: This is normal for first sync - SE Assistant will ask for appropriate lookback period
- **Action**: Specify date range (7, 14, or 30 days) based on merchant engagement

**Auth failures during sync**
- **Symptom**: "Authentication failed" or "Not authorized" errors
- **Solution**: Kill and restart MCP process
- **Steps**:
  1. Run: `pkill -9 -f "shopify-mcp-bridge"` (or `mcp-refresh` if alias configured)
  2. Retry the failing operation - MCP will auto-restart
  3. Complete OAuth flow if prompted in browser

**Email previews only (no full content)**
- **Symptom**: Gmail search returns truncated emails
- **Solution**: Use more specific queries or document IDs
- **Workaround**: If critical email, fetch manually from Gmail

**No merchant results found**
- **Symptom**: Search returns 0 results for known merchant
- **Solutions**:
  - Try alternate spellings (e.g., "Mixbook" vs "Mix Book")
  - Expand date range (try 30 days vs 7 days)
  - Check merchant name variations in email domains

**Document not accessible**
- **Symptom**: Drive document shows as restricted or deleted
- **Solution**: Note in sync summary, request manual access if critical
- **Action**: User may need to request Drive folder access from merchant/AE

**No Slack results**
- **Symptom**: 0 Slack messages found for merchant
- **Note**: This is **NORMAL** - not all merchants have Slack channels or activity
- **No action needed**: Skip Slack section if no results

---

## Issue 6: Salesforce Write Operations (Gumloop)

### Symptoms
Failures when updating SE Next Steps field via Gumloop webhook.

### 🚨 MANDATORY VALIDATION PROTOCOL

**Validation:** Cursor will show current vs proposed changes and ask for confirmation before any Salesforce write.

**Quick summary:** MUST show current → proposed → get confirmation → execute.

This prevents unintended data modifications and ensures data integrity.

### Common Issues & Solutions

**Gumloop flow fails**
- **Symptom**: Flow execution error, 500 error, timeout
- **Solution**: Report error to user, skip local timestamp update
- **Debug**:
  - Check Gumloop monitor URL for detailed error
  - Verify `record_id` is valid Opportunity ID
  - Confirm `object_type` is "Opportunity"
  - Check Gumloop flow configuration (savedItemId)

**Validation mismatch**
- **Symptom**: Local content doesn't match Salesforce after write
- **Solution**: Flag discrepancy for manual review
- **Action**:
  - User should check Salesforce UI directly
  - Re-query Salesforce to get actual field value
  - Update local files with Salesforce version (source of truth)

**Missing Opportunity ID**
- **Symptom**: Can't find Opp ID to update
- **Solution**: Check `raw-files/config.md` for Opportunity ID
- **If still missing**: Abort operation, request user to provide Opp ID
- **Prevention**: Always pull Opp ID during "New Opportunity" creation

**SE Next Steps format errors**
- **Symptom**: Field update succeeds but formatting is wrong
- **Root cause**: Incorrect chronological format or missing "Next Steps:" line
- **Format required**:
  ```
  Next Steps: [current actionable items - LIVING, replace when complete]
  
  DD/MM/YYYY: [merchant interaction - log entry]
  DD/MM/YYYY: [merchant interaction - log entry]
  ```
- **Solution**: Validate format before sending to Gumloop

---

## Related Documentation

- **MCP Configuration**: `~/.cursor/mcp.json`
- **CloudDo Permits**: https://clouddo.shopify.io/permits
- **Apple Shortcuts Automation**: [Boris Jovic's setup for daily permit claims](https://shopify.slack.com/archives/C087X4TK5DJ/p1760540597748919?thread_ts=1760527490.088809&cid=C087X4TK5DJ)
- **Setup & Commands**: Type `@se-assistant` in Cursor for full reference

---

## Version History

**v1.2 (Nov 6, 2025)**
- **OFFICIAL CONFIRMATION**: Revenue team confirmed ~300 second auth cache TTL causes 5-10 min delay
- **No workaround**: No self-serve cache invalidation endpoint exists (must wait for cache expiry)
- **Root cause clarified**: CloudDo → Auth Layer (cached ~5 min) → Minerva OAuth → revenue-mcp
- **Updated workflow**: Wait 5 min (not optional) → `mcp-refresh` → retry
- **CRITICAL**: Added permit expiry info (6 hours) - must re-claim multiple times per day
- **Slack insights**: Added historical context from #help-revenue-funnel conversations
- **Automation**: Added Boris Jovic's Apple Shortcuts automation for daily claims
- Removed non-existent "MCP: Restart Server" command references
- Added future improvement notes from Revenue team (lower TTL, event-driven refresh)
- Confirmed why multiple Cursor restarts appear to work (time + lucky process refresh)

**v1.1 (Nov 3, 2025)**
- Added Issue 5: Merchant Sync Troubleshooting (moved from se-assistant.mdc Section 11.10)
- Added Issue 6: Salesforce Write Operations troubleshooting (moved from se-assistant.mdc Section 12)
- Updated Quick Reference table with all issue categories
- Consolidated all troubleshooting content into single reference doc

**v1.0 (Nov 3, 2025)**
- Initial documentation based on real troubleshooting session
- Added PII permit fix (kill processes + restart MCP)
- Documented token storage architecture
- Added emergency checklist

