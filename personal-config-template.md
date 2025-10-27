# Personal Context Configuration - TEMPLATE

**Owner:** [Your Full Name]  
**Role:** Solutions Engineer (Mid-Market)  
**Last Updated:** [Today's Date]

---

## 🔑 Salesforce Identity

**Email:** [your.email@shopify.com]  
**Salesforce User ID:** [Get this from step below]

**How to get your Salesforce User ID:**
```
@revenue-mcp SELECT Id, Email FROM User WHERE Email = 'your.email@shopify.com'
```

**Why this matters:**
- When querying OpportunityTeamMember, ALWAYS filter by `UserId = '[YOUR_USER_ID]'`
- This ensures queries only return YOUR opportunities (not other SEs)
- Critical for accurate pipeline dashboards and priority calculations
- Prevents accidentally including opportunities you're not assigned to

**Example Query Pattern:**
```soql
SELECT OpportunityId, Opportunity.Name, Opportunity.Total_Revenue__c 
FROM OpportunityTeamMember 
WHERE UserId = '[YOUR_USER_ID]'
  AND TeamMemberRole = 'Solutions Engineer' 
  AND Primary__c = true
  AND Opportunity.IsClosed = false
  AND Opportunity.StageName != 'Closed Lost'
  AND Opportunity.StageName != 'Pre-Qualified'
```

---

## 📅 Current Quarter (Update Each Quarter!)

**Quarter:** [e.g., Q1 2025, Q2 2025, Q3 2025, Q4 2025]  
**Start Date:** [YYYY-MM-DD, e.g., 2025-01-01]  
**End Date:** [YYYY-MM-DD, e.g., 2025-03-31]

**Why this matters:**
- Default queries filter to current quarter (focuses on actionable opportunities)
- Without quarter filter, queries return too many opps (includes future quarters)
- Update these dates at the start of each new quarter

**SOQL Filter Pattern:**
```soql
AND Opportunity.CloseDate >= [Start Date]
AND Opportunity.CloseDate <= [End Date]
```

**Shopify Fiscal Quarters:**
- Q1: Jan 1 - Mar 31
- Q2: Apr 1 - Jun 30
- Q3: Jul 1 - Sep 30
- Q4: Oct 1 - Dec 31

---

## 📁 Google Drive (OPTIONAL)

**Opportunities Folder:** [Your folder name, e.g., "Will SE - Opportunities"]  
**Folder ID:** [Run command below to get this]  
**Direct Link:** [Full Google Drive URL]

**Structure:**
```
Will SE - Opportunities/
├── Mixbook/
├── DAZ Productions/
├── Injectors Direct/
└── [Other Merchant Names]/
```

Each merchant has a subfolder named after the Salesforce Opportunity. Model can navigate from your root folder to find merchant-specific documents.

**How to get your Folder ID:**
```
@gworkspace Search for folder "Will SE - Opportunities"
```
Copy the folder ID from results (long alphanumeric string after `/folders/`)

**Why this matters:**
- Model can navigate directly to your opportunities folder
- Finds merchant-specific subfolders automatically  
- Fetches documents without searching Drive each time
- Used for context sync and document discovery

---

## 👥 Account Executives (AEs)

List the AEs you work closely with. These names are used in "potential assignments" queries.

**Primary AE #1:** [Full Name of AE 1]  
**Primary AE #2:** [Full Name of AE 2]  
**Additional AEs (optional):** [Other AEs if applicable]

---

## 🔍 How to Use This File

**When you see placeholders in queries:**
- `[Your AE 1]` → Replace with **[AE 1's Full Name]**
- `[Your AE 2]` → Replace with **[AE 2's Full Name]**

**Example Query Pattern:**
```
@revenue-mcp Show open opportunities where (Owner is [AE 1 Name] OR Owner is [AE 2 Name]) AND no Solutions Engineer assigned to team
```

---

## 📊 Pod/Team Information

**SE Pod:** [Your pod name, e.g., "America Mid-Market DTC"]  
**Manager:** [Your manager's name]  
**Region:** [Your region, e.g., "North America", "EMEA"]  

---

## ⚙️ Personal Preferences

**Preferred Slack Status Duration:** [e.g., 60 minutes]  
**Typical Work Hours:** [e.g., 9am-5pm EST]  
**Time Zone:** [e.g., EST, PST, GMT]

---

## 📝 Notes for LLMs

**When generating queries or prompts:**
1. Read this file for personal context
2. Replace `[Your AE 1]` with the actual AE name from this file
3. Replace `[Your AE 2]` with the actual AE name from this file
4. Use this as the single source of truth for personalization

**Example:**
```
User: "Show me potential assignments from my AEs"

LLM should read personal-config.md and generate:
@revenue-mcp Show opportunities where (Owner is [AE 1] OR [AE 2]) AND no SE assigned
```

---

## 🔒 Privacy Note

This file contains personal work context. It's in `.gitignore` by default, so it won't be committed unless you explicitly force-add it.

---

## ✅ Setup Checklist

After copying this template to `personal-config.md`:

### 🚨 Critical (Required for Accurate Queries)
- [ ] **Got my Salesforce User ID** → Run: `@se-assistant "Get my Salesforce UserId"`
- [ ] Added my Shopify email: [your.email@shopify.com]
- [ ] **Set current quarter dates** (Q1: Jan-Mar, Q2: Apr-Jun, Q3: Jul-Sep, Q4: Oct-Dec)
  - Current quarter: [Q# YYYY]
  - Start date: [YYYY-MM-DD]
  - End date: [YYYY-MM-DD]

### ⭐ Important (Improves Functionality)
- [ ] Filled in Primary AE #1 name: [Full Name]
- [ ] Filled in Primary AE #2 name: [Full Name] (or removed if N/A)
- [ ] **Got Google Drive Folder ID** → Run: `@se-assistant "Find my Google Drive opportunities folder"`
- [ ] Added Google Drive Folder Name: [e.g., "Will SE - Opportunities"]
- [ ] **Verified filtering works** → Run: `@se-assistant "Show my open SE opportunities"`

### 💡 Optional (Nice to Have)
- [ ] Added my name as Owner
- [ ] Updated date to today
- [ ] Added Pod/Team information
- [ ] Set personal preferences (Slack status duration, work hours, timezone)
- [ ] Tested AE query: `@se-assistant "Find opportunities where my AEs have no SE assigned"`

---

**Ready!** SE-Assistant can now:
- ✅ Filter queries to YOUR opportunities only (prevents seeing other SEs' deals)
- ✅ Auto-apply current quarter date filters (focuses on actionable deals)
- ✅ Navigate your Google Drive structure (faster context gathering)
- ✅ Personalize queries with your AE names (finds assignment opportunities)

**Troubleshooting:** See `README.md` troubleshooting section if queries return unexpected results.

