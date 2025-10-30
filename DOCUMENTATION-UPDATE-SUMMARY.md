# Launch Case Status Documentation Update
**Date:** October 30, 2025  
**Updated By:** SE Assistant (QA Mode)

---

## 📋 UPDATE SUMMARY

**Purpose:** Updated all Launch Case status references across documentation to match actual Salesforce picklist values.

**Trigger:** User has 13 active Launch Cases with statuses not documented in current rules:
- Explore (1)
- Build (10)
- Test (2)

**Old Status Flow (Documented):**
```
New → Build → Test → Launch → Closed
```

**New Status Flow (Actual Salesforce):**
```
Awaiting Handover → Explore → Build → Test → Launch → Closed
(On Hold can occur at any stage)
```

---

## ✅ FILES UPDATED

### 1. Core Rules
**File:** `.cursor/rules/se-assistant.mdc`  
**Lines Updated:** 98-100  
**Change:** Updated Launch Case priority logic with correct statuses

**Old:**
```
- **High Priority**: Status = "Launch" (go-live imminent)
- **Active**: Status = "Build" or "Test" (implementation ongoing)
- **New**: Status = "New" (kickoff pending)
```

**New:**
```
- **High Priority**: Status = "Launch" or "Test" (go-live imminent or validation phase)
- **Active**: Status = "Build" or "Explore" (implementation ongoing)
- **Lower Priority**: Status = "Awaiting Handover" or "On Hold" (pending or paused)
```

---

### 2. Launch Case Management Workflow
**File:** `workflows/core/launch-case-management.md`  
**Sections Updated:** 5 major updates

**Changes:**
1. **Common Case Statuses** (lines 30-37): Added all 7 statuses
2. **Status Progression** (lines 113-157): Complete status flow with definitions
3. **Case Prioritization** (lines 186-207): Three-tier priority system
4. **Revenue MCP Examples** (line 280): Added high-priority status query example

**Added Status Definitions:**
- **Awaiting Handover:** Case created but not yet assigned to SE
- **Explore:** Initial discovery and scoping phase
- **On Hold:** Implementation paused temporarily

---

### 3. SE Role Definition
**File:** `workflows/reference/se-role-definition.md`  
**Lines Updated:** 84-91  

**Change:** Expanded status list from 5 to 7 with accurate descriptions matching implementation phases

---

### 4. Quick Start Guide
**File:** `workflows/core/quick-start.md`  
**Lines Updated:** 275-279  

**Change:** Added status comment to example query and listed all valid statuses for reference

---

### 5. Personal Config Template
**File:** `templates/personal-config-template.md`  
**Lines Updated:** 223-226  

**Changes:**
1. Updated "Common Case Statuses" list with all 7 statuses
2. Added note about no date filter on Launch Cases (continuous work)

---

### 6. Personal Config (William Bedard)
**File:** `personal-config.md`  
**Lines Updated:** 191-212  

**Changes:**
1. Added complete "Salesforce Launch Case Query Template" section
2. Included all status values and note about no date filtering
3. Positioned between Opportunity template and Calendar template for consistency

---

## 📊 VALIDATION

**Test Query Run:**
```soql
SELECT Status, COUNT(Id) CaseCount
FROM Case 
WHERE RecordType.Name = 'Launch' 
  AND OwnerId = '0058V00000DjUuaQAF'
  AND IsClosed = false
GROUP BY Status
```

**Results:**
- Explore: 1 ✅
- Build: 10 ✅
- Test: 2 ✅
- **TOTAL: 13** ✅ (matches user's count)

**Filter Validation:** ✅ `OwnerId` filter working correctly

---

## 🎯 NEXT STEP: AWAITING USER APPROVAL

**Ready to Execute:**
Query all 13 active Launch Cases and create/update merchant folders locally:

**Will Execute:**
1. Query Salesforce for all 13 Launch Case details (Account, Status, Type, Created Date, etc.)
2. For each Launch Case:
   - Check if merchant folder exists
   - Create `post-sales/` directory if missing
   - Create or update `post-sales/launch-plan.md` from template
   - Update `raw-files/config.md` with Case details
   - Create `raw-files/case-notes/` and `raw-files/handoff-docs/` subdirectories
   - Check for related Closed Won Opportunities (backfill pre-sales context if missing)

**Current Merchant Status:**
- 5 merchants with post-sales folders (already backfilled with pre-sales context)
- 8 merchants potentially missing (need to identify and create)

---

## 🚦 STATUS: AWAITING GREEN LIGHT

**User Instruction:** "Wait for my green light to actually pull information and create/update folders on these missing merchants locally."

**Ready to proceed when approved.**

---

## 📝 GIT STATUS

**Files Modified:** 87 files (documentation updates + merchant folder cleanup from previous work)

**Key Documentation Updates:**
- `.cursor/rules/se-assistant.mdc` ✅
- `workflows/core/launch-case-management.md` ✅
- `workflows/reference/se-role-definition.md` ✅
- `workflows/core/quick-start.md` ✅
- `templates/personal-config-template.md` ✅
- `personal-config.md` ✅

**All files updated with accurate Launch Case status values matching Salesforce picklist.**

