# Launch Case Management

**Purpose:** Salesforce Case object workflows for SE post-sales Launch Case management

**Last Updated:** October 30, 2025

---

## Overview

Launch Cases are the primary Salesforce object for managing SE post-sales implementation work. Unlike Opportunities (pre-sales), Cases track the implementation journey from contract signing through go-live and CSM handoff.

**Key Distinction:**
- **Opportunity** = Pre-sales (discovery, scoping, closing the deal)
- **Launch Case** = Post-sales (implementation advisory, go-live support)

---

## Launch Case Basics

### Case Object Details

**RecordType:** `Launch`

**Common Case Types:**
- Launch Services - Complimentary
- Launch Services - Paid
- Implementation Advisory

**Common Case Statuses:**
- Awaiting Handover
- Explore
- Build
- Test
- Launch
- On Hold
- Closed

**Key Fields:**
- `CaseNumber` - Unique case identifier (e.g., 00096702)
- `Status` - Current implementation phase
- `Health__c` - Implementation health (Red/Yellow/Green)
- `Type` - Service level/type
- `OwnerId` - SE assigned to the case
- `AccountId` - Linked merchant account
- `Subject` - Case description
- `CreatedDate` - When case was opened
- `ClosedDate` - When case was closed (if applicable)

---

## Querying Your Launch Cases

### Get All Active Launch Cases Assigned to You

```soql
SELECT 
  Id,
  CaseNumber,
  Subject,
  Status,
  Health__c,
  Type,
  RecordType.Name,
  AccountId,
  Account.Name,
  CreatedDate,
  LastModifiedDate,
  ClosedDate
FROM Case
WHERE RecordType.Name = 'Launch'
  AND OwnerId = '[Your Salesforce User ID from personal-config.md]'
  AND IsClosed = false
ORDER BY 
  CASE Health__c WHEN 'Red' THEN 1 WHEN 'Yellow' THEN 2 WHEN 'Green' THEN 3 ELSE 4 END,
  Status,
  CreatedDate DESC
```

### Get Launch Cases by Status

```soql
SELECT 
  Id,
  CaseNumber,
  Subject,
  Status,
  Account.Name
FROM Case
WHERE RecordType.Name = 'Launch'
  AND OwnerId = '[Your Salesforce User ID from personal-config.md]'
  AND Status = 'Build'
ORDER BY LastModifiedDate DESC
```

### Get Recently Closed Launch Cases

```soql
SELECT 
  Id,
  CaseNumber,
  Subject,
  Status,
  Account.Name,
  ClosedDate
FROM Case
WHERE RecordType.Name = 'Launch'
  AND OwnerId = '[Your Salesforce User ID from personal-config.md]'
  AND IsClosed = true
  AND ClosedDate = LAST_N_DAYS:30
ORDER BY ClosedDate DESC
```

---

## Case Status Management

### Status Progression

**Typical Flow:**
```
Awaiting Handover → Explore → Build → Test → Launch → Closed
```

**Note:** "On Hold" can occur at any stage if implementation is paused.

**Status Definitions:**

**Awaiting Handover**
- Case created but not yet assigned to SE
- Waiting for SE assignment or merchant readiness
- No SE engagement yet

**Explore**
- Initial discovery and scoping phase
- SE and merchant/partner aligning on approach
- Implementation planning in progress

**Build**
- Implementation in progress
- Merchant/partner building the solution
- SE available for platform questions

**Test**
- Solution built, entering testing phase
- UAT (User Acceptance Testing) in progress
- Partner/merchant validating solution

**Launch**
- Go-live imminent or recently completed
- SE available for launch day questions if needed
- Partner managing launch execution

**On Hold**
- Implementation paused temporarily
- Waiting on merchant decision, resources, or external dependency
- SE available when merchant is ready to resume

**Closed**
- Implementation complete
- CSM handoff complete (launch + 0-2 weeks)
- SE advisory concluded

---

## Case Activity Tracking

### Adding Case Notes

Case notes document SE advisory checkpoints, blockers, and key decisions.

**Best Practices:**
- Log notes after each milestone checkpoint
- Document blockers and escalations
- Record key technical decisions
- Note CSM handoff details

**Salesforce Location:**
- Case feed/comments
- Case history (tracks all field changes)

### Updating Case Fields

**Common Field Updates:**
- Status changes (as milestones progress)
- Priority changes (if issues arise)
- Close date updates (if timeline shifts)

---

## Case Prioritization

### Health Status (Primary Priority)

**Health Field (`Health__c`):** Tracks implementation progress and partner/merchant performance.

**Priority Order:**
- 🔴 **Red** - Stalled/blocked, needs immediate SE attention
- 🟡 **Yellow** - At risk, monitor closely for blockers
- 🟢 **Green** - On track, progressing normally

**Update frequency:** Partners/SEs update as project status changes.

---

### Combined Prioritization (Health + Status)

**Critical (Address First):**
- 🔴 Red health (any status) - Immediate unblocking needed

**High Priority:**
- 🟡 Yellow health (any status) - Prevent from becoming Red
- 🟢 Green + Status = "Launch" or "Test" - Go-live support

**Active (Standard Work):**
- 🟢 Green + Status = "Build" or "Explore" - Consultative support

**Lower Priority:**
- Status = "Awaiting Handover" or "On Hold" - Paused work

---

## Case-to-Opportunity Linking

Most Launch Cases originate from closed-won Opportunities. Understanding this linkage provides context continuity.

**Finding the Source Opportunity:**
- Check `Account` for related Opportunities
- Review pre-sales merchant folder (`pre-sales/` directory)
- Check raw-files/ for discovery/technical assessments

---

## CSM Handoff Process

**Timing:** Launch + 0-2 weeks

**Handoff Checklist:**
- [ ] Launch complete and stable
- [ ] Post-launch issues resolved
- [ ] Handoff document created (in `raw-files/handoff-docs/`)
- [ ] CSM introduced to merchant
- [ ] Knowledge transfer session complete
- [ ] Case status updated to "Closed"

**Handoff Document Location:**
- `merchants/[Merchant]/raw-files/handoff-docs/csm-handoff.md`

---

## Best Practices

1. **Update Case Status as Implementation Progresses**
   - Change status when partner communicates phase changes
   - Keep status aligned with actual implementation phase

2. **Document Consultations in Salesforce**
   - Add case notes after platform questions/consultations
   - Log blockers if escalating to Shopify support

3. **Maintain Context Continuity**
   - Reference pre-sales discovery work in `pre-sales/` folder
   - Keep raw-files/ updated with relevant emails, meeting notes
   - Log consultation notes in `raw-files/case-notes/`

4. **Plan for CSM Handoff**
   - Start handoff prep at launch
   - Complete handoff within 2 weeks post-launch
   - Document key context for CSM in `raw-files/handoff-docs/`

---

## Related Workflows

- **[SE Role Definition](../reference/se-role-definition.md)** - SE post-sales responsibilities and boundaries

---

## Using the Revenue MCP

Query Launch Cases directly from your workspace:

```
Get my active Launch Cases
```

```
Show Launch Cases in Build status
```

```
Show Launch Cases in Test or Launch status (high priority)
```

```
Find Launch Cases closing this month
```

The Revenue MCP will automatically filter by your Salesforce User ID (from personal-config.md).

