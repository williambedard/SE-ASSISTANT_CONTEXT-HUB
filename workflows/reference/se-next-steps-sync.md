# SE Next Steps Sync Workflow

**Purpose:** Update SE_Next_Steps__c field in Salesforce via Gumloop webhook (single or batch).

---

## Webhook Body Format

**Structure:**
```javascript
{
  "records": [
    {
      "record_id": "006OG00000HPXGkYAP",
      "se_next_steps_value": "Next Steps\n\nNov 3, 2025 - Update text",
      "object_type": "Opportunity"
    }
  ]
}
```

**Key Points:**
- Always pass `records` as an array (even for single updates)
- Each record object contains: `record_id`, `se_next_steps_value`, `object_type`
- Gumloop flow handles looping internally
- Supports batch updates: Multiple records in single webhook call

---

## Execution Examples

**Single Update:**
```javascript
start_flow(
  flowId: "6XyrReHhKyXrvLDaaTPNcF",
  inputs: {
    "records": [
      {
        "record_id": "006OG00000HPXGkYAP",
        "se_next_steps_value": "Next Steps\n\nNov 3, 2025 - Completed discovery",
        "object_type": "Opportunity"
      }
    ]
  }
)
```

**Batch Update:**
```javascript
start_flow(
  flowId: "6XyrReHhKyXrvLDaaTPNcF",
  inputs: {
    "records": [
      {
        "record_id": "006OG00000HPXGkYAP",
        "se_next_steps_value": "Next Steps\n\nNov 3, 2025 - Demo scheduled",
        "object_type": "Opportunity"
      },
      {
        "record_id": "006OG00000HPXGkYBQ",
        "se_next_steps_value": "Next Steps\n\nNov 3, 2025 - Technical review",
        "object_type": "Opportunity"
      },
      {
        "record_id": "006OG00000HPXGkYCR",
        "se_next_steps_value": "Next Steps\n\nNov 3, 2025 - Pricing discussion",
        "object_type": "Opportunity"
      }
    ]
  }
)
```

---

## Field Content Format

**Template:**
```
Next Steps: [current actionable items - LIVING, replace when complete]

MMM D, YYYY: [merchant interaction - log entry]
MMM D, YYYY: [merchant interaction - log entry]
```

**Formatting Rules:**
- `\n\n` for empty line between header and dates
- `\n` for line return between date entries
- Date format: `MMM D, YYYY` (e.g., Nov 3, 2025)
- Most recent entries at top (reverse chronological)

**Content Rules:**
- **"Next Steps:" line** = Current action items (replace when completed)
- **Date entries** = Merchant-facing activity log (add at top, never delete)
- **Include:** Meetings, merchant emails, AE updates, decisions, timeline changes
- **Exclude:** Internal process, "no activity", stage changes, sync results

---

## Workflow Steps

1. **Pull Current Values:** Query Salesforce for SE_Next_Steps__c field
2. **Generate Proposed Values:** Based on local updates/merchant context
3. **Validate:** Show comparison and get confirmation (see `gumloop-validation-protocol.md`)
4. **Execute:** Call `start_flow()` with `records` array
5. **Validate Write:** Re-query Salesforce to confirm all updates succeeded

---

## Error Handling

See `mcp-troubleshooting.md` → Issue 6 for diagnostic steps.

**Common Issues:**
- Flow execution errors → Check Gumloop monitor URL
- Format errors → Validate `\n` and `\n\n` escaping
- Missing Opp IDs → Check `raw-files/config.md`
- Validation mismatches → Re-query Salesforce, update local files

---

## Integration Points

**Referenced by:**
- `.cursor/rules/se-assistant.mdc` → Section 12.3
- `gumloop-validation-protocol.md` → Pre-execution validation
- `mcp-troubleshooting.md` → Issue 6 (Gumloop failures)
- `personal-config.md` → Gumloop configuration section

