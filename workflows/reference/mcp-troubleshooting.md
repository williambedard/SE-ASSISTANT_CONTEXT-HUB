# MCP Troubleshooting Guide

**Last Updated:** November 3, 2025  
**Version:** 1.1

---

## Quick Reference

| Issue | Solution | Time |
|-------|----------|------|
| PII permission errors after CloudDo permit claimed | Kill MCP processes + Restart MCP server | 2 min |
| "Not connected" errors | Restart specific MCP server in Cursor | 30 sec |
| OAuth/authentication failures | Full Cursor restart + MCP server restart | 2 min |
| Stale cached tokens | Kill processes + Clear keychain (rare) | 3 min |
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
- ✅ Claiming the permit from CloudDo (https://clouddo.shopify.io/permits)
- ✅ Restarting Cursor completely
- ✅ Restarting MCP servers via Command Palette

### Root Cause
The `shopify-mcp-bridge` process continues running with the **old OAuth token** (from before you claimed the permit). Simply restarting Cursor doesn't kill this background process - it persists across Cursor sessions.

### Solution (Proven Fix)

**Step 1: Kill Running MCP Bridge Processes**
```bash
ps aux | grep -i "[s]hopify-mcp-bridge\|[u]vx.*shopify" | awk '{print $2}' | xargs kill -9 2>/dev/null
```

This kills all shopify-mcp-bridge processes that are holding old tokens.

**Step 2: Restart the MCP Server in Cursor**
1. Open Command Palette: `Cmd+Shift+P`
2. Type: "MCP: Restart Server"
3. Select: `mcp_revenue-mcp` (or whichever MCP you're troubleshooting)

**Step 3: Test Immediately**
Try your query again. The MCP server will:
- Start fresh with a new process
- Initiate a new OAuth flow
- Pick up your new CloudDo permit
- Cache the new token with proper permissions

### Why This Works
- `shopify-mcp-bridge` uses OAuth tokens cached in macOS Keychain
- The running process holds the token in memory
- Killing the process forces a fresh OAuth flow
- The new flow sees your updated CloudDo permits
- New token is cached with correct permissions

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
1. `Cmd+Shift+P` → "MCP: Restart Server"
2. Select the affected MCP server
3. Wait 5-10 seconds
4. Retry your query

**If that fails:**
- Full Cursor restart (`Cmd+Q` → Reopen)
- Check MCP server logs in Cursor's Output panel

---

## Issue 3: OAuth/Authentication Failures

### Symptoms
- "Authentication failed" errors
- "Invalid token" errors
- OAuth redirect loops

### Solution
**Full Reset:**
1. Quit Cursor completely (`Cmd+Q`)
2. Kill MCP processes (see Step 1 above)
3. Reopen Cursor
4. Restart affected MCP servers
5. If prompted, complete OAuth flow in browser

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

# Kill all processes
ps aux | grep -i "[s]hopify-mcp-bridge" | awk '{print $2}' | xargs kill -9 2>/dev/null

# Restart Cursor
# Then restart MCP servers via Command Palette
```

---

## MCP-Specific Troubleshooting

### revenue-mcp (Salesforce, Company Enrichment)
- **Auth**: Minerva OAuth via CloudDo permits
- **Required Permit**: `sdp-pii` for Salesforce queries
- **Client ID**: `0oa1ao6npm85AT2Hr0x8`
- **Config**: `~/.cursor/mcp.json` → `mcp_revenue-mcp`

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
   - Always kill MCP processes before testing
   - Don't assume Cursor restart is enough

2. **Before Important Work:**
   - Test MCP connectivity with simple queries
   - Verify permissions are working

3. **Regular Maintenance:**
   - Clear `/tmp/shopify-mcp-bridge-*.lock` files weekly
   - Monitor MCP server logs in Cursor Output panel

---

## Emergency Checklist

When MCPs completely stop working:

- [ ] Quit Cursor (`Cmd+Q`)
- [ ] Kill all MCP processes: `killall -9 uvx node npx 2>/dev/null`
- [ ] Clear lock files: `rm -f /tmp/shopify-mcp-bridge-*.lock`
- [ ] Reopen Cursor
- [ ] Restart all MCP servers: `Cmd+Shift+P` → "MCP: Restart All Servers"
- [ ] Wait 30 seconds
- [ ] Test with simple query
- [ ] If still failing: Check CloudDo permit status
- [ ] If still failing: Re-authenticate Google OAuth for gworkspace-mcp

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
- **Solution**: Re-authenticate specific MCP in Cursor
- **Steps**:
  1. `Cmd+Shift+P` → "MCP: Restart Server"
  2. Select failing MCP (gworkspace-mcp, slack-mcp, etc.)
  3. Complete OAuth flow if prompted

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

**See:** `workflows/reference/gumloop-validation-protocol.md` for complete validation workflow.

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
- **Onboarding Setup**: `workflows/core/onboarding-setup.md`
- **SE Assistant Rules**: `.cursor/rules/se-assistant.mdc` (Section 0.4 - MCP Environment)

---

## Version History

**v1.1 (Nov 3, 2025)**
- Added Issue 5: Merchant Sync Troubleshooting (moved from se-assistant.mdc Section 11.10)
- Added Issue 6: Salesforce Write Operations troubleshooting (moved from se-assistant.mdc Section 12)
- Updated Quick Reference table with all 6 issue categories
- Consolidated all troubleshooting content into single reference doc

**v1.0 (Nov 3, 2025)**
- Initial documentation based on real troubleshooting session
- Added PII permit fix (kill processes + restart MCP)
- Documented token storage architecture
- Added emergency checklist

