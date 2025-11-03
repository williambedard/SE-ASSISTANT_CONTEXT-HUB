# Gumloop Validation Protocol

**Purpose:** Prevent unintended Salesforce data modifications via mandatory pre-execution validation.

---

## 🚨 MANDATORY: User Validation Before Execution

**BEFORE any Gumloop MCP execution, SE Assistant MUST:**
1. Display current Salesforce field value
2. Display proposed new field value
3. Request explicit user confirmation
4. Only execute after user approves

**This applies to ALL Gumloop operations:**
- SE Next Steps field updates
- Any Salesforce field modifications  
- Any data writes via Gumloop webhooks

---

## User Communication Template

```markdown
📋 Proposed Salesforce Update

**Current Value (Salesforce):**
```
[Display current SE_Next_Steps__c content]
```

**Proposed New Value:**
```
[Display proposed SE_Next_Steps__c content]
```

**Changes:**
- [Summarize what will be added/modified/removed]

Should I proceed with this update? (yes/no)
```

---

## Workflow Steps

1. **Pull Current Value:** Query Salesforce for current field content
2. **Generate Proposed Value:** Based on local updates/merchant context
3. **Show Comparison:** Display both values side-by-side
4. **Wait for Confirmation:** User must explicitly approve ("yes") or reject ("no")
5. **Execute (if approved):** Call `start_flow()` with validated content
6. **Validate Write:** Re-query Salesforce to confirm update succeeded

---

## Why This Matters

**Without validation:**
- Risk of overwriting important historical data
- No visibility into what's being changed
- Can't catch formatting errors before write
- Difficult to debug if something goes wrong

**With validation:**
- User sees exactly what will change
- Catch mistakes before they hit Salesforce
- Build trust in automated workflows
- Easy to audit what was changed and why

---

## Integration Points

**Referenced in:**
- `.cursor/rules/se-assistant.mdc` → Section 12.3 (SE Next Steps workflow)
- `.cursor/rules/se-assistant.mdc` → Section 5.5 (MCP Quick Reference)
- `workflows/reference/mcp-troubleshooting.md` → Issue 6 (Gumloop failures)

**Related workflows:**
- Section 12: Salesforce Write Operations (complete SE Next Steps workflow)
- Section 2.1: Post-Meeting Auto-Processing (drafts SE Next Steps for approval)

---

**Last Updated:** November 3, 2025

