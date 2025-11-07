# SE-ASSISTANT_CONTEXT-HUB Setup - Interactive Onboarding

**Purpose:** ONE-TIME setup to create your personal-config.md

**This guide:** How to configure your Salesforce UserId, quarter dates, and preferences  
**After setup:** See `quick-start.md` for daily workflows and merchant folder creation

**Estimated time:** 2 minutes

---

## Setup Workflow (Automated)

When a user triggers setup, SE-ASSISTANT_CONTEXT-HUB should:

### Step 1: Check Existing Setup
```bash
# Check if personal-config.md exists
if [ -f "personal-config.md" ]; then
  echo "✅ personal-config.md exists"
  # Validate it has required fields
else
  echo "⚠️  personal-config.md not found - starting setup"
fi
```

### Step 2: Copy Template
```bash
cp templates/personal-config-template.md personal-config.md
```

### Step 3: Get Salesforce UserId
Use Revenue MCP to fetch the user's Salesforce UserId:
```
@revenue-mcp SELECT Id, Email, Name FROM User WHERE Email = '[user.email@shopify.com]'
```

### Step 4: Interactive Form Fill
Prompt the user for:
1. **Salesforce UserId** (auto-populated from Step 3, user confirms)
2. **Current Quarter** (auto-detect based on today's date, user confirms)
   - Q1: Jan 1 - Mar 31
   - Q2: Apr 1 - Jun 30
   - Q3: Jul 1 - Sep 30
   - Q4: Oct 1 - Dec 31
3. **Primary AE #1 Name** (user provides)
4. **Primary AE #2 Name** (optional, user provides)
5. **Timezone** (auto-detect from system, user confirms)
6. **Work Hours** (default: 9am-5pm, user can customize)

### Step 5: Write personal-config.md
Auto-fill the template with collected information.

### Step 6: Validate Setup
Test the configuration:
```
@se-assistant "Show my open SE opportunities"
```

Expected result: Returns ONLY opportunities where user is Primary SE.

### Step 7: Success Confirmation
```
✅ Setup Complete!

Your SE-ASSISTANT_CONTEXT-HUB workspace is ready. Here's what you can do now:

📋 Essential Commands:
- "New Opportunity: [Company Name]" - Create merchant folder with auto-context
- "Update my priority dashboard" - Generate tiered opportunity list
- "Sync merchant context for [Name]" - Pull latest emails/Slack/Drive

📚 Learn More:
- workflows/core/quick-start.md - Full workflow guide
- workflows/reference/opportunity-prioritization.md - Priority scoring
- README.md - Complete feature documentation

🎯 Try This Now:
@se-assistant "Show me my top 3 priority opportunities this week"
```

---

## Manual Setup (Fallback)

If automated setup fails, provide these steps:

```bash
# 1. Copy template
cp templates/personal-config-template.md personal-config.md

# 2. Get your Salesforce UserId
@se-assistant "Get my Salesforce UserId"

# 3. Open personal-config.md and fill in:
#    - salesforce_user_id: [YOUR_ID]
#    - quarter: [Current Q# YYYY]
#    - start_date: [YYYY-MM-DD]
#    - end_date: [YYYY-MM-DD]
#    - primary_ae_1: [AE Name]
#    - timezone: [Your timezone]

# 4. Test it
@se-assistant "Show my open SE opportunities"
```

---

## Validation Checklist

After setup, verify:
- ✅ `personal-config.md` exists in workspace root
- ✅ Salesforce UserId is populated (format: 18-character ID starting with `005`)
- ✅ Quarter dates match current Shopify fiscal quarter
- ✅ Query returns ONLY your opportunities (not other SEs')
- ✅ merchants/ folder exists (empty until first opportunity created)

---

## Common Setup Issues

### "Can't find personal-config.md"
→ File must be in workspace root: `/Users/[you]/SE-ASSISTANT_CONTEXT-HUB/personal-config.md`  
→ Not in merchants/ or workflows/ subfolders

### "Query returns other SEs' opportunities"
→ Check `salesforce_user_id` field in personal-config.md  
→ Must match YOUR UserId exactly (case-sensitive)

### "Quarter dates are wrong"
→ Update `start_date` and `end_date` in personal-config.md  
→ Use Shopify fiscal quarters (not calendar quarters)

---

## What Happens After Setup?

**Your workspace is now personalized:**
- All Salesforce queries filter by YOUR UserId
- Priority dashboard shows YOUR opportunities
- Quarter filters focus on YOUR current Q deals
- Calendar rules reflect YOUR work preferences

**Start working:**
```
@se-assistant "New Opportunity: [First Company Name]"
@se-assistant "New Launch Case: [First Company Name]"
```

This creates your first merchant folder with auto-populated context from:
- Salesforce (opportunity/case data)
- Gmail (email threads)
- Slack (conversations)
- Google Drive (documents)
- Web research (company intelligence)

**Note:** Use "New Opportunity" for pre-sales work, "New Launch Case" for post-sales implementation advisory.

---

## ✅ Setup Complete! What's Next?

Your personal-config.md is configured. Now start using it:

**👉 Next Step:** Type `@se-assistant "New Opportunity: [Company Name]"` to create your first merchant folder.

That guide covers:
- Creating your first merchant folder
- Daily workflow patterns (start day, during work, end session)
- Switching between merchants
- Common scenarios and troubleshooting

**Quick commands to try:**
```
@se-assistant "New Opportunity: [Company Name]"
@se-assistant "Update my priority dashboard"  
@se-assistant "What should I focus on this week?"
```

