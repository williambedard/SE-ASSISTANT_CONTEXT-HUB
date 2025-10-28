# Personal Context Configuration (LLM-Optimized) - TEMPLATE

**Owner:** [Your Name]  
**Role:** Solutions Engineer (Mid-Market)  
**Last Updated:** [Date]  
**Version:** 2.0 (Optimized for LLM parsing)

---

## 🔑 IDENTITY & CONTEXT (Facts)

### Salesforce Identity
```yaml
email: [your.email@shopify.com]
salesforce_user_id: [Get from: @revenue-mcp SELECT Id, Email FROM User WHERE Email = 'your.email@shopify.com']
role: Solutions Engineer
```

**Critical for queries:** Always filter `OpportunityTeamMember` by `UserId = '[YOUR_USER_ID]'`

### Current Quarter
```yaml
quarter: [Q# YYYY, e.g., Q4 2025]
start_date: [YYYY-MM-DD, e.g., 2025-10-01]
end_date: [YYYY-MM-DD, e.g., 2025-12-31]
```

**Shopify Fiscal Quarters:**
- Q1: Jan 1 - Mar 31
- Q2: Apr 1 - Jun 30
- Q3: Jul 1 - Sep 30
- Q4: Oct 1 - Dec 31

### Google Drive (Optional)
```yaml
opportunities_folder: [e.g., "Your Name SE - Opportunities"]
folder_id: [Get from Drive search]
structure: "[Opportunity Name]/" subfolder per opportunity
```

### Account Executives
```yaml
primary_ae_1: [Full Name of AE 1]
primary_ae_2: [Full Name of AE 2, or remove if N/A]
```

### Work Schedule
```yaml
timezone: [e.g., EDT, PST, GMT]
typical_hours: [e.g., 9am-5pm]
work_location: [e.g., Home (Monday-Friday), Hybrid, Office]
```

---

## 📋 CALENDAR MANAGEMENT RULES (Actions)

### 🚨 HARD BOUNDARIES (Never Violate Without Explicit Permission)

| Rule ID | Condition | Action | Parameters |
|---------|-----------|--------|------------|
| **HB-1** | Meeting scheduled before work hours | **FLAG** as boundary violation + suggest reschedule | `time < [YOUR_START_TIME]` |
| **HB-2** | Meeting scheduled after work hours | **FLAG** as boundary violation + suggest reschedule | `time > [YOUR_END_TIME]` |
| **HB-3** | Meeting scheduled over morning planning block (optional) | **FLAG** as critical violation + **NEVER** suggest this time | `[YOUR_MORNING_BLOCK_TIME, if you have one]` |
| **HB-4** | Attempting to schedule over "Focus time" blocks | **PROTECT** + treat as unavailable time | `event.title contains "Focus time"` |

**Example values to fill in:**
- `[YOUR_START_TIME]`: e.g., `09:00`
- `[YOUR_END_TIME]`: e.g., `16:00` or `17:00`
- `[YOUR_MORNING_BLOCK_TIME]`: e.g., `09:00-10:00 every weekday` (optional - remove HB-3 if not applicable)

---

### 🎯 STRONG PREFERENCES (Enforce Unless Critical Need)

| Rule ID | Condition | Action | Parameters |
|---------|-----------|--------|------------|
| **SP-1** | Meeting during lunch hour | **FLAG** as suboptimal + suggest alternative | `[YOUR_LUNCH_TIME, e.g., 12:00-13:00]` |
| **SP-2** | Tentative optional meeting | **IGNORE** in meeting count + assume NOT attending | `event.responseStatus == "tentative" AND event.title contains ["L&L", "Office Hours", "Optional"]` |
| **SP-3** | Missing prep block before critical demo | **FLAG** + suggest adding prep block | If `demo_duration >= 60min` and no buffer >= 30min before |
| **SP-4** | Back-to-back meetings exceeding threshold | **WARN** + suggest break | If continuous meetings > [YOUR_THRESHOLD, e.g., 120min] |
| **SP-5** | Recurring merchant touchbase | **PROTECT** + never suggest rescheduling | `event.summary contains ["Weekly Touch base", "Weekly sync", etc.]` |

---

### 💡 NICE-TO-HAVE (Suggestions, Not Requirements)

| Rule ID | Condition | Action | Parameters |
|---------|-----------|--------|------------|
| **NH-1** | Multiple merchant meetings in one day | **NOTE** heavy meeting load | Count meetings with external attendees >= [YOUR_LIMIT, e.g., 4] |
| **NH-2** | Total meeting hours exceeds threshold | **WARN** + suggest declining optional meetings | Sum meeting duration >= [YOUR_LIMIT, e.g., 360min] |
| **NH-3** | Protected recurring block has meetings | **FLAG** as flex-but-suboptimal + suggest alternatives | `day == [YOUR_DAY] AND time == [YOUR_BLOCK]` |
| **NH-4** | Weekly ritual disrupted | **FLAG** + note disrupts important routine | `day == [YOUR_DAY] AND time == [YOUR_RITUAL_TIME]` |

**Customize these rules based on your work style:**
- Adjust meeting thresholds based on your capacity
- Add/remove rules as needed for your scheduling preferences
- Make rules stricter (move to STRONG PREFERENCES) if they're critical for you

---

## 🧠 TIME BLOCKING INTERPRETATION

### Calendar Event Classification

```yaml
# Events that are NOT meetings (don't count in meeting load)
protected_time_blocks:
  - title_contains: ["Focus time", "demo prep", "Block", "Planning", "L&D Time", "[YOUR_BLOCK_NAMES]"]
  - treatment: PROTECTED (treat as unavailable, don't count as meetings)
  
# Meetings to ignore (assume NOT attending)
ignored_meetings:
  - responseStatus: "declined"
  - responseStatus: "tentative" AND title_contains: ["L&L", "Office Hours", "Optional", "[YOUR_OPTIONAL_KEYWORDS]"]
  
# Merchant meetings (count toward meeting load)
merchant_meetings:
  - has_external_attendees: true
  - OR title_contains: [merchant_name, "Demo", "Discovery", "Touch base"]
  
# Internal meetings (lower priority)
internal_meetings:
  - all_attendees_domain: "shopify.com"
```

---

## 🤖 LLM EXECUTION INSTRUCTIONS

### Priority Update Workflow

```
STEP 1: Query Google Calendar
  - time_range: current_week + next_week (7-14 days)
  - include_attendees: true
  - max_results: 100

STEP 2: Classify Events
  - Separate: protected_time_blocks vs meetings vs ignored
  - Categorize meetings: merchant vs internal
  - Extract: Focus time blocks, demo prep blocks, recurring blocks

STEP 3: Apply Rules (in order)
  a) Check HARD BOUNDARIES (HB-1 through HB-4)
     - Flag ALL violations
  b) Check STRONG PREFERENCES (SP-1 through SP-5)
     - Flag violations with severity
  c) Check NICE-TO-HAVE (NH-1 through NH-4)
     - Note patterns, provide suggestions

STEP 4: Calculate Metrics
  - merchant_meeting_count (per day)
  - total_meeting_hours (per day, excluding protected blocks)
  - missing_prep_blocks (count and list)

STEP 5: Generate Output
  - Priority-ranked calendar analysis by day
  - Specific actionable suggestions with Rule IDs
  - Meeting load warnings with thresholds
  - Boundary violations with severity levels
```

### Example Output Format

```markdown
## [Day of Week] - Calendar Analysis

**Metrics:**
- Merchant meetings: X (✅/⚠️ NH-1: threshold status)
- Total meeting hours: X (✅/⚠️ Under/over threshold)
- Protected time: X hours (Focus blocks)
- Missing prep blocks: X

**Rule Violations:**
- ⚠️ [RULE-ID]: [Description of violation]
  - Action: [Specific suggestion]

**Suggestions:**
- 💡 [RULE-ID]: [Pattern or concern]
  - Suggestion: [Specific action]
```

---

## 📊 QUERY PATTERNS

### Salesforce Opportunity Query Template
```soql
SELECT OpportunityId, Opportunity.Name, Opportunity.Total_Revenue__c 
FROM OpportunityTeamMember 
WHERE UserId = '[YOUR_SALESFORCE_USER_ID]' 
  AND TeamMemberRole = 'Solutions Engineer' 
  AND Primary__c = true
  AND Opportunity.IsClosed = false
  AND Opportunity.StageName != 'Closed Lost'
  AND Opportunity.StageName != 'Pre-Qualified'
  AND Opportunity.CloseDate >= [QUARTER_START_DATE]
  AND Opportunity.CloseDate <= [QUARTER_END_DATE]
```

### Calendar Query Template
```javascript
mcp_gworkspace-mcp_calendar_events({
  calendar_id: "primary",
  time_min: "YYYY-MM-DDT00:00:00Z",
  time_max: "YYYY-MM-DDT23:59:59Z",
  max_results: 100,
  include_attendees: true
})
```

---

## ✅ SETUP CHECKLIST

After copying this template to `personal-config.md`:

### 🚨 Critical (Required)
- [ ] Set Salesforce User ID
- [ ] Set current quarter dates
- [ ] Set timezone and typical work hours
- [ ] Define hard boundaries (HB-1, HB-2, HB-3)
- [ ] Replace [YOUR_*] placeholders in rules

### ⭐ Important (Recommended)
- [ ] Add primary AE names
- [ ] Set Google Drive folder ID
- [ ] Customize meeting thresholds (NH-2, NH-3, NH-5)
- [ ] Define protected time block names
- [ ] Set energy patterns (NH-4, NH-5)

### 💡 Optional (Nice to Have)
- [ ] Add recurring merchant touchbase keywords (SP-6)
- [ ] Customize ignored meeting keywords
- [ ] Add weekly ritual blocks (NH-7)
- [ ] Adjust cognitive load rules based on your needs

---

## 🎯 QUERY DISAMBIGUATION RULES (AI Response Optimization)

### Decision Logic

```
IF temporal reference (today/tomorrow/this week):
  → Calendar First → Add deal context to meetings
  
ELSE IF deal/pipeline terms (focus/pipeline/quarter):
  → Salesforce First → Add calendar touchpoints if relevant
  
ELSE IF ambiguous:
  → <7 days: Calendar-first
  → 7+ days: Deal-first
```

---

### Response Type Matrix

| Query Pattern | Timeframe | Primary Source | Response Format |
|--------------|-----------|----------------|-----------------|
| **"today"** / **"tomorrow"** | 0-1 days | Calendar + Salesforce (meetings only) | Daily schedule with deal flags (🔥/🟡/👀) |
| **"this week"** | 2-7 days | Calendar + Salesforce (meetings only) | Week view + Top 3 deal actions |
| **"next week"** | 8-14 days | Calendar + Salesforce (all active) | Hybrid: meetings + tier list |
| **"this month"** / **"quarter"** | 15+ days | Salesforce + Calendar (key dates) | Full tier prioritization |
| **"what should I focus on"** | Context-dependent | Salesforce → Calendar (this week) | Tier 1 deals + urgent meetings |
| **"prep me for [merchant]"** | Pre-meeting | Merchant files → Salesforce → Calendar | Briefing doc + deal status |

**Key triggers:**
- Calendar-first: "schedule", "meetings", "booked", "free time"
- Deal-first: "pipeline", "forecast", "quota", "close", "committed", "at risk"
- Hybrid: "priorities for [timeframe]", "what's important", "game plan"

---

### Edge Cases

| Scenario | Behavior |
|----------|----------|
| Empty calendar | Show deal priorities + note "Focus time for [Top 3 deals]" |
| No active deals | Show calendar only + note "Pipeline building mode" |
| Ambiguous timeframe ("soon") | Default to next 7 days (calendar-first) |
| "What should I do NOW?" | Next meeting (if <2hrs away) OR Top Tier 1 action |

---

### Response Requirements

**Every priority/schedule response MUST include:**
1. **TL;DR** - 1-2 sentences summarizing key info
2. **Flag urgent items** - Closing this week (⚡), At risk (⚠️)
3. **Deal tier emojis** - 🔥 Tier 1, 🟡 Tier 2, 👀 Tier 3 (when showing deals)
4. **Actionable next steps** - Specific actions, not generic advice

---

## 🔒 Privacy Note

This file contains personal work context. It's in `.gitignore` by default.
