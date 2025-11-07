#!/bin/bash
# MCP Speed Aliases - Add these to your ~/.zshrc (or ~/.bashrc)
# 
# Quick setup:
# 1. Run: cat ~/Documents/GitHub\ Repos/SE-ASSISTANT_HUB/workflows/reference/mcp-speed-aliases.sh >> ~/.zshrc
# 2. Then: source ~/.zshrc
#
# Or manually copy the aliases below into your shell config

# ============================================
# MCP Process Management Aliases
# ============================================

# Quick refresh - kills shopify-mcp-bridge (revenue-mcp, scout, support-core)
# Use this after claiming new CloudDo permits
alias mcp-refresh='pkill -9 -f "shopify-mcp-bridge" && echo "✓ MCP processes killed - fresh auth on next use"'

# Full nuclear option - kills ALL MCP-related processes + clears lock files
# Use this when MCPs completely stop working
alias mcp-full='pkill -9 -f "shopify-mcp-bridge|uvx|node.*mcp" && rm -f /tmp/shopify-mcp-bridge-*.lock && echo "✓ Full MCP reset complete - restart Cursor if needed"'

# Check what MCP processes are running
alias mcp-status='ps aux | grep -i "[m]cp\|[s]hopify-mcp\|[u]vx.*shopify" | grep -v grep'

# Clear just the lock files (rarely needed)
alias mcp-clean-locks='rm -f /tmp/shopify-mcp-bridge-*.lock && echo "✓ Lock files cleared"'

# ============================================
# Quick PII Permit Workflow (OFFICIAL)
# ============================================

# After claiming PII permit at https://clouddo.shopify.io/permits:
# 1. WAIT 5 MINUTES - authorization layer has ~300 second cache TTL
#    This is NOT optional - no workaround exists to speed this up
#    (CloudDo updates instantly, but auth cache needs to expire)
# 2. Run: mcp-refresh
# 3. Use revenue-mcp in Cursor - it will auto-restart with fresh auth
# 4. Done! No Cursor restart needed.
#
# Why the wait? Auth layer caches entitlements for ~5 min. New OAuth tokens
# won't include new permits until that cache expires. Confirmed by Revenue team.
#
# ⚠️  IMPORTANT: Permit expires every 6 hours!
# You'll need to re-claim multiple times per day (e.g., 8am, 2pm).
#
# AUTOMATION TIP (Credit: Boris Jovic):
# Set up Apple Shortcuts to auto-open CloudDo claim URL at 8am daily:
# 1. Create Shortcut: Open https://clouddo.shopify.io/permits?claim=sdp-pii
# 2. Set automation: Run at 8am (+ optional 2pm for renewal)
# 3. Add desktop widget for quick re-claiming

# ============================================
# Troubleshooting Workflow
# ============================================

# Problem: "You do not have access to PII tools"
# Solution: mcp-refresh

# Problem: {"error":"Not connected"}
# Solution: mcp-refresh

# Problem: Everything broken
# Solution: mcp-full (then restart Cursor if still broken)

