# Quick Start Guide

**Purpose:** Get up and running with the SE Merchant Framework in minutes. This is your "just tell me what to do" guide.

---

## New to This Framework?

**Read This First:** This framework organizes all your SE work in a merchant-centric structure with templates, MCP integration, and clear workflows. Everything you need is in one place per merchant.

**Time Investment:**
- Setup: 5 minutes per new merchant
- Learning curve: 2-3 merchants to feel fluent
- Daily overhead: 4 minutes per merchant to maintain
- Payoff: Massive time savings on context switching

**Philosophy:** Invest a little structure upfront, save hours of confusion later.

---

## Setup: First Time Using This Framework

**If you just created this framework structure, you're ready to go! Skip to "Starting a New Engagement" below.**

**If you're setting this up from scratch:**
1. Create the directory structure (already done if you're reading this)
2. Verify these folders exist:
   - `merchants/`
   - `templates/`
   - `workflows/`
   - `mcp-integration/`
3. You're ready!

---

## Starting a New Engagement

**You've been assigned a new opportunity. Now what?**

### Step 1: Let SE-Assistant Create Everything (2 minutes)

**RECOMMENDED:** Use SE-Assistant's automated merchant creation:

```
@se-assistant "New Opportunity: [Company Name]"
```

**This automatically:**
1. ✅ Creates merchant folder with correct structure (per `.cursor/rules/se-assistant.mdc` Section 1.1)
2. ✅ Queries Salesforce for account/opportunity data (Revenue MCP)
3. ✅ Searches Gmail, Slack, Drive for existing context (GWorkspace/Slack MCPs)
4. ✅ Runs external company research (web search + company enrichment)
5. ✅ Populates initial `briefing-document.md`, `discovery-assessment.md`, and `raw-files/config.md`
6. ✅ Saves all discovered context to appropriate folders

**Result:** Complete merchant folder with pre-populated context in 2-5 minutes.

**Folder structure created:**
```
merchants/[Company-Name]/
├── briefing-document.md          # Auto-populated from MCP data
├── discovery-assessment.md       # Initial 5Cs framework
├── technical-assessment.md       # Created when needed
└── raw-files/
    ├── config.md                 # Salesforce/Slack/Drive links
    ├── slack.md                  # Slack conversation summaries
    ├── meeting-notes/
    ├── emails/                   # Gmail threads
    ├── documents/                # Drive documents
    ├── key-resources/
    └── additional-context/
        └── business-intelligence.md  # External research
```

---

### Step 2: Review Generated Context (5 minutes)

**Action:**
1. Open `merchants/[Company-Name]/briefing-document.md`
2. Review auto-populated sections:
   - **Merchant Overview** (from external research + Salesforce)
   - **Stakeholders** (from emails + Salesforce)
   - **Timelines & Next Steps** (from Salesforce opportunity data)
3. Check `raw-files/` for discovered context:
   - Gmail threads in `emails/`
   - Drive documents in `documents/`
   - Slack conversations in `slack.md`
4. Note any gaps in `discovery-assessment.md`

**Result:** You know what context exists and what you need to discover.

---

### Step 3: Manual Updates (If Needed)

**If SE-Assistant didn't find everything:**

```
@se-assistant "Sync merchant context for [Company Name]"
```

This re-searches Gmail, Slack, and Drive with expanded date ranges.

**Manual MCP queries (if needed):**
```
@se-assistant "Get account information for [Company Name]"
@se-assistant "Search support tickets for [merchant name]"
@se-assistant "Find competitive intelligence for [competitor name]"
```

**See rules file Section 5 for complete MCP usage patterns.**

---

### Step 4: Prepare for Discovery Call (5 minutes)

**Action:**
1. Review `briefing-document.md` for context
2. Review `discovery-assessment.md` for gaps (marked `[NEEDS INFO]`)
3. Prepare 3-5 discovery questions targeting gaps
4. Have `briefing-document.md` open during the call
5. Take notes directly in the document during the call

**During the call:**
- Fill gaps in **Merchant Overview** section (briefing-document.md)
- Add contacts to **Stakeholders** section (briefing-document.md)
- Update **5Cs framework** sections (discovery-assessment.md)
- Note technical details for future technical-assessment.md

**After call:**
```
@se-assistant "Update briefing-document.md and discovery-assessment.md with today's discovery call notes"
```

SE-Assistant can help structure your notes into the proper sections.

---

### Step 5: Continue Building Context (Ongoing)

**As engagement progresses:**

```
@se-assistant "Create technical assessment for [Company Name]"
@se-assistant "Update discovery-assessment.md with new challenge information"
@se-assistant "Sync merchant context for [Company Name]"  # Before important meetings
```

**Files auto-update as you add information:**
- `briefing-document.md` → Executive summary, always current
- `discovery-assessment.md` → 5Cs framework, EPoV readiness
- `technical-assessment.md` → Full technical solution (created on demand)
- `raw-files/` → All supporting context automatically organized

**See rules file Section 2 for file templates and auto-update protocols.**

---

## Quick Reference: Which Document When?

**SE-NTRAL Core Documents (Rules File Sections 1.1.1 & 2.1):**

| Activity | Document to Use | Location | Rules Reference |
|----------|----------------|----------|-----------------|
| **Executive summary** | Briefing Document | `briefing-document.md` | Section 2.1 |
| **Discovery & 5Cs** | Discovery Assessment | `discovery-assessment.md` | Sections 7.1-7.3 |
| **Technical solution** | Technical Assessment | `technical-assessment.md` | Sections 2.1, 3.1 |
| **Internal tool links** | Config | `raw-files/config.md` | Section 1.1.1 |
| **Slack conversations** | Slack Summary | `raw-files/slack.md` | Section 1.1.1 |
| **Meeting transcripts** | Meeting Notes | `raw-files/meeting-notes/[date]-[type].md` | Section 2.1 |
| **Email threads** | Emails | `raw-files/emails/[subject].md` | Section 2.1 |
| **External research** | Business Intelligence | `raw-files/additional-context/business-intelligence.md` | Section 10 |
| **Competitive analysis** | Competitive Analysis | `raw-files/additional-context/competitive-analysis.md` | Section 9 |
| **Workshop agendas** | Documents | `raw-files/documents/workshop-agenda.md` | Section 1.1.1 |
| **Demo guides** | Documents | `raw-files/documents/demo-user-journeys.md` | Section 1.1.1 |
| **Handover content** | Documents | `raw-files/documents/handover-content.md` | Section 1.1.1 |

**Golden Rule:** Start with `briefing-document.md` - it's your executive summary and current status. See `.cursor/rules/se-assistant.mdc` Section 2.1 for complete file descriptions.

---

## Daily Workflow

### Starting Your Day (5 minutes)

**For each merchant you'll work with today:**

1. **Open `briefing-document.md`**
2. **Read Current Status** from **Timelines & Next Steps** section (30 seconds)
3. **Review Outstanding Actions** section (30 seconds)
4. **Check `discovery-assessment.md`** for any `[NEEDS INFO]` gaps (15 seconds)
5. **You're ready to work**

**Total:** ~90 seconds per merchant, so 5 merchants = 7.5 minutes

**Tip:** Run before starting work:
```
@se-assistant "What should I focus on this week?"
```
This generates your priority dashboard showing Tier 1 deals (see `workflows/reference/opportunity-prioritization.md`).

---

### During Work (Real-time)

**While working on a merchant:**

1. **Keep `briefing-document.md` open** in a split view
2. **Take notes in real-time** in the relevant document
3. **Update as you go** - don't wait until later
4. **Use SE-Assistant to help structure:**
   ```
   @se-assistant "Update briefing-document.md with these notes: [paste notes]"
   ```

**Examples:**
- In a call? Type notes directly in `briefing-document.md` during call
- Designing solution? Ask: `@se-assistant "Create technical assessment based on current discovery"`
- Need competitive intel? Ask: `@se-assistant "Find competitive analysis for [competitor]"`

**See rules file Section 6.1 for research workflows.**

---

### Ending a Work Session (2 minutes per merchant)

**Before switching to a different merchant or ending the day:**

1. **Update `briefing-document.md`:**
   - Update **Timelines & Next Steps** with current status (1 min)
   - Update **Outstanding Actions** with specific next steps (1 min)
2. **Save and close all files** for that merchant

**Why:** This 2 minutes saves 15+ minutes of context restoration later.

**Automation:**
```
@se-assistant "Update briefing-document status: [brief summary of what was accomplished]"
```

---

### Switching Between Merchants

**SE-NTRAL enforces context isolation (rules file Section 1):**

1. **Close all files** for current merchant
2. **Open new merchant's folder**
3. **Read `briefing-document.md` Timelines & Next Steps** (1 min)
4. **Resume work** with full context

**Total switch time:** ~2 minutes (no cross-contamination between merchants)

---

## Working in Cursor Agent Mode

**Best practice for using Cursor's Agent within this framework:**

### 1. Work in Merchant Context

**Do:**
```
cd merchants/Acme-Corp/
# Now open Cursor, or set this as workspace root
```

**Why:** Cursor's context is scoped to your merchant. Agent mode will reference the right files.

---

### 2. Reference the Merchant Profile

**In your prompts to Agent:**
```
"Read briefing-document.md and technical-assessment.md for context on this merchant's requirements, 
then help me design the ERP integration workflow."
```

**Why:** Gives the Agent full context without you re-explaining everything.

---

### 3. Update Documents Through Agent

**You can ask Agent to:**
```
"Update briefing-document.md with today's status: 
we completed discovery and are moving to solution design. 
Next action is to update technical-assessment.md with architecture."
```

**Why:** Agent maintains your documentation discipline for you.

---

### 4. Use MCPs Through Agent

**If MCPs are configured:**
```
"Use Revenue MCP to get shop data for shop_id 12345, 
then add the relevant details to briefing-document.md"
```

**Why:** Agent can fetch and document MCP data for you.

---

### 5. Generate Deliverables

**When creating documents:**
```
"Create a solution design document for this merchant using the 
solution-design-template.md. Reference the requirements.md we created 
for the technical requirements."
```

**Why:** Agent uses your templates and maintains consistency.

---

## Common Scenarios

### Scenario 1: "I just got assigned a new opportunity and have a call tomorrow"

**Fast Track (30 minutes):**
1. Create merchant folder and copy merchant profile template (3 min)
2. Run MCP queries if possible (10 min)
3. Review any existing context (Salesforce, emails) (10 min)
4. Prepare 5 discovery questions (5 min)
5. Be ready with briefing-document.md open during call (2 min)

**During call:**
- Take notes directly in briefing-document.md
- Save detailed meeting notes to raw-files/meeting-notes/
- Focus on business overview and key contacts

**After call:**
- Spend 15 minutes filling in requirements template with what you learned
- Log all open questions

---

### Scenario 2: "I need to design a technical solution"

**Workflow:**
1. Open `technical-assessment.md` - review current requirements
2. Use Shopify Dev MCP to research API capabilities
3. Use Vault MCP to find architecture patterns
4. Update `technical-assessment.md` with:
   - Solution architecture
   - Integration requirements
   - Migration strategy
   - Risk mitigation
5. Use Shopify Dev MCP to validate code examples
6. Document architecture decisions
7. Update briefing-document.md with status and next steps

---

### Scenario 3: "I haven't touched this merchant in 2 weeks"

**Fast Context Restoration (5 minutes):**
1. Open `briefing-document.md`
2. Read Executive Summary (1 min)
3. Read Current Status & Next Steps (1 min)
4. Scan Timelines & Outstanding Actions (2 min)
5. Review any new files in raw-files/ (1 min)

**You're caught up, start working.**

---

### Scenario 4: "I need to hand this off to someone else"

**Handoff Checklist:**
1. **Ensure briefing-document.md is current:**
   - Executive Summary updated
   - Current Status accurate
   - Next Actions clear
   - All stakeholders listed
   
2. **Ensure core documents are complete:**
   - briefing-document.md (executive summary)
   - discovery-assessment.md (5Cs framework)
   - technical-assessment.md (solution architecture)
   - raw-files/ organized (meeting notes, key resources)
   
3. **Update with handoff context:**
   ```markdown
   ## Handoff Notes
   **Date:** [Date]
   **From:** [Your name]
   **To:** [New person/CSM/Partner]
   **Context:** [Signature completed / handoff to implementation partner / moving to CSM]
   **Key things to know:**
   - [Important context point]
   - [Blocker or sensitivity to flag]
   ```

4. **Have 30-minute handoff call:**
   - Walk through briefing-document.md
   - Review technical-assessment.md if implementation starting
   - Share access to merchant folder
   - Answer questions

**Result:** New person can continue seamlessly.

**Note:** SE role typically ends at signature/handoff. See `workflows/reference/se-role-definition.md` for scope boundaries.

---

## Tips for Success

### 1. **Always Start with Briefing Document**
- It's your executive summary and current status
- Contains stakeholders, timelines, and next steps
- Links to discovery-assessment.md and technical-assessment.md
- Update it after every session

### 2. **Follow SE-NTRAL Structure**
- briefing-document.md = executive summary, always up-to-date
- discovery-assessment.md = 5Cs framework, EPoV readiness
- technical-assessment.md = solution architecture, migration strategy
- raw-files/ = all supporting content organized by type
- This structure is optimized for MCP integration

### 3. **Document in Real-Time**
- Don't "take notes to transfer later"
- Type directly into the markdown files
- During calls, after decisions, immediately
- "Later" never comes

### 4. **Link Everything**
- Use markdown links: `[Link text](./relative/path.md)`
- Cross-reference between documents
- Build a web of knowledge
- Makes navigation instant

### 5. **MCPs Are Your Superpower**
- Front-load MCP research (30 min before first call)
- You'll ask better questions
- You'll seem more prepared
- You'll design better solutions

### 6. **Keep Next Actions Updated**
- After every work session
- Make them specific and actionable
- Assign dates
- This is your "resume here" list

### 7. **One Merchant, One Folder**
- All context in one place
- Easy to search
- Easy to share
- Easy to archive

---

## Troubleshooting

### "This feels like too much overhead"

**Response:** It's only overhead if you don't maintain it. The 4 minutes per session to update briefing-document.md saves 15+ minutes every time you return to that merchant. Over a 4-month engagement, that's hours saved.

---

### "I don't have time to fill out all these templates"

**Response:** Start minimal - SE-NTRAL core structure:
1. Always do: briefing-document.md (executive summary, status, next steps)
2. Discovery: discovery-assessment.md (5Cs framework)
3. Technical: technical-assessment.md (solution architecture)
4. Supporting: raw-files/ (meeting notes, key resources)

That's 3 core documents + supporting files. Simple, structured, MCP-optimized.

---

### "My merchant doesn't fit the template"

**Response:** Templates are flexible:
- Skip sections that don't apply (mark N/A)
- Add custom sections if needed
- Adapt the structure to your needs
- But try to maintain the core flow

---

### "I forget to update documents"

**Response:** Build a habit:
1. Set a calendar reminder for end-of-day updates (5 min)
2. Make it part of your workflow: "work → update → switch"
3. Use SE-Assistant to help: "@se-assistant Update briefing-document with status"
4. After 2-3 merchants, it becomes automatic

---

### "How do I know if I'm doing this right?"

**Measure these:**
- Can you resume work in < 5 minutes after time away? ✅
- Do you have to ask merchants questions twice? ❌
- Can someone else read your docs and understand the project? ✅
- Do you forget commitments or next actions? ❌

If checks pass, you're doing it right.

---

## Next Steps

**You're ready to start!** Here's your first action:

1. **If you have a current opportunity:**
   - Create their folder right now (5 min)
   - Copy merchant profile template
   - Fill in what you know
   - Run MCP queries if available
   
2. **If you don't have an active opportunity:**
   - Wait for next assignment
   - When it comes, follow "Starting a New Engagement" above
   - You'll be ready from day one

**Learn more:**
- Review `.cursor/rules/se-assistant.mdc` for complete SE-NTRAL rules and workflows
- See `workflows/reference/opportunity-prioritization.md` for priority scoring methodology
- Check `README.md` troubleshooting section for common issues

**Questions?**
- Check workflow documentation in `workflows/` folder
- Reference MCP guide in `mcp-integration/` folder
- Ask fellow SEs who use this framework

---

## Quick Command Reference

**Create new merchant (recommended approach):**
```
@se-assistant "New Opportunity: [Company Name]"
```
This automatically creates the folder structure and populates initial context per rules file Section 1.1.

**Sync merchant context:**
```
@se-assistant "Sync merchant context for [Company Name]"
```
Updates files from Gmail, Slack, and Google Drive per rules file Section 11.

**Update priority dashboard:**
```
@se-assistant "Update my priority dashboard"
```
Generates tiered opportunity list using scoring from `workflows/reference/opportunity-prioritization.md`.

**Create technical assessment:**
```
@se-assistant "Create technical assessment for [Company Name]"
```
Generates clean markdown technical assessment per rules file Section 3.1.

---

**You're all set! The SE-Assistant automation handles folder creation, context gathering, and file management. Just focus on the merchant work.**


