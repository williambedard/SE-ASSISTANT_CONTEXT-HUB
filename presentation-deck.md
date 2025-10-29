# SE-NTRAL: Your AI Research Partner
## Context Engineering, MCPs, and the Future of SE Work

*Presentation for SE Team*  
*Duration: 20-30 minutes*

---

# SLIDE 1: Title Slide

**SE-NTRAL: Your AI Research Partner**

*Context Engineering, MCPs, and the Future of SE Work*

Presented by: William Bédard

---

# ACT 1: THE PROBLEM (Why Bother?)

---

# SLIDE 2: A Day in the Life

**Your Morning Routine:**

- 9:00 AM: Open laptop, check calendar
- 9:15 AM: First call with Mixbook
  - *"Wait, where did I leave off with them?"*
  - Hunt through Salesforce notes
  - Search Gmail for last email thread
  - Check Slack for recent conversations
  - Find that Google Doc from last week
  - **15 minutes gone** just to restore context

**This happens 5 times a day.**

---

# SLIDE 3: The Hidden Tax

**The Math of Context Switching:**

```
18 active merchants
× 15 minutes to restore context per merchant
= 4.5 hours per week
= 234 hours per year
```

**That's 6 full work weeks** just remembering what you already knew.

**Plus:**
- Manual research across 7 different tools
- Duplicate work (solving the same problem twice)
- Missed details (that email you forgot about)
- Forgotten commitments (what did I promise the AE?)

---

# SLIDE 4: What If?

**Imagine a different reality:**

- ✅ Your AI knows everything about your merchants
- ✅ It can pull Salesforce data on command
- ✅ It writes your briefing docs for you
- ✅ Context switching takes 30 seconds instead of 15 minutes
- ✅ You never forget a commitment or miss a detail

**This isn't science fiction. This is SE-NTRAL.**

---

# ACT 2: THE SOLUTION PARADIGM

---

# SLIDE 5: Context Engineering 101

**What is Context Engineering?**

> "The practice of giving AI the right information to make intelligent decisions"

**This isn't about better prompts—it's about better context.**

**Three Pillars:**

1. **Structured Knowledge**
   - Files, folders, templates
   - Organized merchant information
   - Persistent across sessions

2. **Live Data Access**
   - MCPs to internal systems
   - Real-time Salesforce queries
   - Gmail, Slack, Drive integration

3. **Persistent Memory**
   - Context that survives sessions
   - No re-explaining every time
   - AI that actually knows your work

---

# SLIDE 6: The Context Stack

**How It All Fits Together:**

```
┌─────────────────────────────────────────┐
│   AI Reasoning Layer (Cursor + Claude)  │  ← Makes intelligent decisions
├─────────────────────────────────────────┤
│      MCP Connections (Live Data)        │  ← Salesforce, Gmail, Slack, Drive
├─────────────────────────────────────────┤
│   Your Merchant Files (Local Context)   │  ← Structured knowledge base
└─────────────────────────────────────────┘
```

**Each layer feeds the next.**

Bottom layer: Your organized knowledge  
Middle layer: Live access to internal systems  
Top layer: AI that understands it all

---

# SLIDE 7: What Are MCPs?

**MCP = Model Context Protocol**

**Think: "APIs for AI"**

Traditional AI is blind to your systems. MCPs give AI superpowers:

| Superpower | What It Does |
|------------|--------------|
| 📧 Search Gmail | Find email threads by merchant name |
| 🔍 Query Salesforce | Pull opportunity data, account info |
| 📄 Read Google Docs | Access presentations, competitive docs |
| 🎫 Pull Support Tickets | Find merchant frustrations and issues |
| 📚 Access Vault | Internal knowledge base, RFP responses |
| 💬 Search Slack | Team conversations and merchant mentions |

**MCPs let AI access the same data you do—instantly.**

---

# SLIDE 8: MCPs We Use

**Our MCP Arsenal:**

| MCP | Purpose | Example Use |
|-----|---------|-------------|
| **revenue-mcp** | Salesforce + company enrichment | "Get account details for Mixbook" |
| **gworkspace-mcp** | Gmail, Drive, Calendar | "Search Drive for Mixbook documents" |
| **slack-mcp** | Team conversations | "Find Slack mentions of Mixbook" |
| **shopify-dev-mcp** | API docs, GraphQL validation | "Validate this GraphQL query" |
| **vault-mcp** | Internal knowledge base | "Find RFP response for PCI compliance" |
| **scout-mcp** | Merchant feedback, support tickets | "Show support tickets for Retail merchants" |
| **support-core-mcp** | Help docs, Zendesk | "How do I set up B2B company locations?" |

**7 MCPs = 7 superpowers**

---

# SLIDE 9: Context Engineering in Action

**Example: "What should I focus on this week?"**

**Behind the Scenes (5 seconds):**

1. 📖 Read `personal-config.md` → Knows your Salesforce UserId
2. 🔍 Query Salesforce via `revenue-mcp` → Your opportunities only (not other SEs')
3. 🧮 Calculate priority scores → Revenue + Probability + Urgency formula
4. 📊 Generate tiered dashboard → Tier 1/2/3 classification with focus recommendations

**You See:**
```
🔥 TIER 1: HOT (Focus 60% Time)
1. Mixbook - $6.2M (Score: 15) ⚡ CLOSES THIS MONTH
2. Cueros Velez - $1.3M (Score: 13)
...

🟡 TIER 2: WARM (Focus 30% Time)
...
```

**Time: 5 seconds instead of 30 minutes of manual Salesforce analysis**

---

# SLIDE 10: Why This Matters

**Traditional AI:**
- Limited to what you tell it in each prompt
- No memory between sessions
- No access to your systems
- You're the research assistant

**Context-Engineered AI:**
- Knows your full context automatically
- Accesses live data from internal systems
- Remembers everything across sessions
- It's YOUR research assistant

**Result: AI that actually understands your work**

---

# ACT 3: SE-NTRAL IMPLEMENTATION

---

# SLIDE 11: Enter SE-NTRAL

**SE-NTRAL = Context Engineering + MCPs + SE Workflows**

**Purpose:**
Make context engineering practical for SE work

**The Vision:**
- One Cursor workspace
- All your merchants
- Infinite memory
- Instant access to everything

**The Reality:**
- It works. Today. Right now.
- Real merchants. Real data. Real time savings.

---

# SLIDE 12: The Architecture

**Visual: Your Workspace Structure**

```
SE-NTRAL/
├── merchants/                         ← One folder per merchant
│   ├── Mixbook/
│   │   ├── briefing-document.md       ← Executive summary, always current
│   │   ├── discovery-assessment.md    ← 5Cs framework, EPoV readiness
│   │   ├── technical-assessment.md    ← Solution architecture
│   │   └── raw-files/                 ← All supporting context
│   │       ├── emails/                ← Gmail threads (last 30 days)
│   │       ├── meeting-notes/         ← Call transcripts
│   │       ├── documents/             ← Drive docs, presentations
│   │       ├── additional-context/    ← Research, competitive analysis
│   │       └── config.md              ← Links to Salesforce, Slack, Drive
│   │
│   ├── Cueros-Velez/                  ← Complete context isolation
│   └── [17 more merchants...]
│
├── workflows/                         ← Your playbooks
└── Current-Q-Priority-Dashboard.md    ← Auto-generated focus list
```

**Each merchant = Complete context capsule (no cross-contamination)**

---

# SLIDE 13: What SE-NTRAL Does

**Automated Workflows:**

✅ **Merchant Folder Creation**
- One command: `"New Opportunity: Acme Corp"`
- Auto-creates folder structure
- Scrapes Salesforce, Gmail, Slack, Drive
- Generates initial briefing document
- Takes 2-3 minutes

✅ **Context Scraping**
- Pulls emails, Slack messages, Drive docs
- Stores locally for instant access
- Smart caching (emails <30 days, Slack <60 days)
- Reads document contents (not just file lists)

✅ **Auto-Generated Documentation**
- Briefing documents with stakeholders, timelines
- Discovery assessments with 5Cs framework
- Technical assessments with solution architecture
- Priority dashboards with scoring

✅ **Priority Management**
- Scores all opportunities (Revenue + Probability + Urgency)
- Tier 1/2/3 classification (🔥/🟡/👀)
- 60/30/10 time allocation guidance
- Risk flags for at-risk deals

✅ **Intelligence Integration**
- Competitive analysis from Klue/Drive docs
- External company research via web + enrichment
- Internal knowledge from Vault
- Support patterns from Scout

---

# SLIDE 14: Live Demo Walkthrough (Conceptual)

**Command 1: Create New Merchant**

```
@se-assistant "New Opportunity: Acme Corp"
```

**What Happens (2-3 minutes):**
1. ✅ Creates folder structure
2. ✅ Queries Salesforce for opportunity + account data
3. ✅ Searches Gmail for email threads
4. ✅ Searches Slack for conversations
5. ✅ Searches Google Drive for documents
6. ✅ Runs external company research
7. ✅ Generates briefing-document.md
8. ✅ Stores all context in raw-files/

**Result: Complete merchant context, ready for discovery call**

---

**Command 2: Update Priority Dashboard**

```
@se-assistant "Update my priority dashboard"
```

**What Happens (5 seconds):**
1. ✅ Reads your personal-config.md (knows your UserId)
2. ✅ Queries Salesforce for YOUR opportunities only
3. ✅ Calculates priority scores for each
4. ✅ Classifies into Tier 1/2/3
5. ✅ Generates Current-Q-Priority-Dashboard.md

**Result: Instant focus list with time allocation guidance**

---

# SLIDE 15: Real Output - Priority Dashboard

**Generated in 5 seconds:**

```markdown
# SE-NTRAL: Opportunity Update Summary
Last Updated: October 27, 2025

## 📊 Executive Summary

Total Opportunities Tracked: 18
High Priority (Active Engagement): 6
Medium Priority (Recent Activity): 5
Low Priority (Minimal Activity): 7

---

## TIER 1: HIGH PRIORITY - Active Engagement 🔥

### 1. Mixbook - $6.2M (Deal Craft) 🔥
Last Activity: October 22, 2025
Priority Score: ⭐⭐⭐⭐⭐ HIGHEST
Close Target: November 21, 2025

Why High Priority:
- Largest deal in pipeline ($6.2M)
- Weekly touchbase calls with CMO
- MVF submitted Oct 6
- Strong executive alignment

Next Steps:
- API docs from Anatoli (first week of Nov)
- Weekly touchbase continues
```

**This dashboard updates itself. You just focus on the work.**

---

# SLIDE 16: Real Output - Merchant Folder

**Mixbook folder structure:**

```
Mixbook/
├── briefing-document.md           ← 4,200 words, always current
│   ├── Executive Summary
│   ├── Merchant Overview (GMV, locations, challenges)
│   ├── Stakeholders (O'Neal, Anatoli, partners)
│   ├── Timelines & Next Steps
│   └── Outstanding Actions
│
├── discovery-assessment.md        ← 5Cs framework, gaps flagged
├── technical-assessment.md        ← Solution architecture (when needed)
│
└── raw-files/
    ├── emails/                    ← 23 email threads
    ├── meeting-notes/             ← 8 call transcripts
    ├── documents/                 ← 5 Drive docs (MVF, tech specs)
    ├── additional-context/
    │   ├── business-intelligence.md
    │   └── competitive-analysis.md
    └── config.md                  ← Links to Salesforce, Slack, Drive
```

**All context in one place. Zero mental overhead.**

---

# SLIDE 17: The Magic Moment

**Before SE-NTRAL:**

*"What did we discuss with Acme last week?"*

1. Open Salesforce → Read last activity note
2. Search Gmail → Find email thread
3. Check Slack → Look for mentions
4. Open Drive → Find meeting notes
5. Try to remember → What was the outcome?

**Time: 10-15 minutes**  
**Mental load: High**  
**Accuracy: Maybe 80%**

---

**With SE-NTRAL:**

*"@se-assistant Show me latest context for Acme"*

→ Instant summary from all sources  
→ Stakeholders, timeline, outstanding actions  
→ Recent emails and Slack conversations  
→ Next steps and blockers

**Time: 10 seconds**  
**Mental load: Zero**  
**Accuracy: 100%**

**90x faster. Zero effort. Perfect recall.**

---

# SLIDE 18: The Compound Effect

**Time Savings (Conservative Estimate):**

| Activity | Before | After | Savings |
|----------|--------|-------|---------|
| Context restoration (per merchant) | 15 min | 30 sec | 14.5 min |
| Priority dashboard generation | 30 min | 5 sec | 30 min |
| Research across multiple systems | 20 min | 2 min | 18 min |
| Briefing document creation | 60 min | 3 min | 57 min |

**Per Week:**
- 18 merchants × 14.5 min saved = 4.5 hours/week
- Plus research, docs, dashboards = **6-8 hours/week**

**Per Year:**
- **260+ hours saved** = 6.5 work weeks
- **Worth ~$40-50K in SE capacity**

**Plus Intangibles:**
- Better context = better solutions = faster closes
- No forgotten commitments = stronger relationships
- Less stress, more focus = happier SEs

---

# SLIDE 19: Team Intelligence Layer

**SE-NTRAL isn't just local—it's collaborative.**

**The SE-NTRAL Platform:**
- Sync your workspace to team knowledge base
- Semantic search across all SE work
- Find solutions others have built
- Share competitive intelligence
- Reuse proven approaches

**Example Scenarios:**

1. **Magento Migration:**
   - Your solution to Magento data sync?
   - Other SEs can find and reuse it

2. **Competitive Objection:**
   - Your response to "BigCommerce is cheaper"?
   - Team benefits, not siloed knowledge

3. **B2B + International:**
   - Your architecture for multi-entity B2B?
   - Discoverable, not lost in your Drive

**Individual brilliance → Team intelligence**

---

# SLIDE 20: Short Demo (If Time)

**Live Demo Elements:**

1. **Show Cursor Workspace**
   - merchants/ folder with 18 merchant folders
   - Open one merchant folder to show structure
   - Open briefing-document.md to show content

2. **Show @se-assistant Command**
   - Type: `@se-assistant "What should I focus on this week?"`
   - Show response with Tier 1/2/3 classification
   - Highlight speed (5 seconds)

3. **Show Generated Dashboard**
   - Open Current-Q-Priority-Dashboard.md
   - Point out scoring, tier classification, next steps
   - Emphasize: "This was auto-generated"

**Keep it tight: 3-5 minutes max**

---

# ACT 4: CALL TO ACTION

---

# SLIDE 21: What You Get

**Your Personal AI Research Partner:**

✅ **Never Forgets**
- Perfect recall of every merchant interaction
- Complete context across all sources
- Zero mental overhead

✅ **Always Available**
- 24/7 access to your merchant context
- Works offline with local files
- Fast (most queries <5 seconds)

✅ **Continuously Learning**
- Auto-syncs from Gmail, Slack, Drive
- Updates briefing docs automatically
- Keeps context fresh and current

**Plus:**
- 🚀 Instant context switching (30 sec vs 15 min)
- 📄 Auto-generated documentation
- 🔗 Live data access (Salesforce, Gmail, etc.)
- 🌐 Team intelligence sharing
- ⏱️ 200+ hours saved per year

---

# SLIDE 22: Getting Started

**Total Setup Time: 10 minutes**

**Step 1: Clone the Repo** (5 min)
```bash
git clone [repo-url]
cd SE-NTRAL
```

**Step 2: Run Setup** (2 min)
```
@se-assistant "Set up SE-NTRAL for me"
```
- Auto-fetches your Salesforce UserId
- Configures quarter dates
- Creates personal-config.md (gitignored)

**Step 3: Create First Merchant** (3 min)
```
@se-assistant "New Opportunity: [Company Name]"
```
- Auto-scrapes context from all sources
- Generates briefing document
- You're ready for discovery call

**That's it. You're done.**

---

# SLIDE 23: Your First Week

**Day 1: Setup + First Merchant**
- Clone repo, run setup (10 min)
- Create one merchant folder (3 min)
- Review generated briefing doc
- **Time invested: 15 minutes**

**Day 2-3: Add More Merchants**
- Create 2-3 more merchant folders
- See the pattern emerge
- Start trusting the system
- **Time invested: 10 min/day**

**Day 4: Generate Priority Dashboard**
```
@se-assistant "Update my priority dashboard"
```
- See all your deals in one view
- Tier 1/2/3 classification
- Time allocation guidance
- **Time invested: 5 seconds**

**Day 5: The Realization**
- "I can't go back to the old way"
- Context switching is now effortless
- You have 2+ hours back this week

**Week 2: Sync to SE-NTRAL Platform**
- Share your knowledge with the team
- Search other SEs' solutions
- Compound the benefits

---

# SLIDE 24: Let's Do This

**Questions?**

**Who's ready to try it this week?**

**Support:**
- 📚 Documentation: `workflows/core/onboarding-setup.md`
- 💬 Questions: Ask Will or check `README.md`
- 🔗 Repo: [link]

**Your First Action:**
```bash
git clone [repo-url]
cd SE-NTRAL
# Open in Cursor
@se-assistant "Set up SE-NTRAL for me"
```

---

**Welcome to the cult.** 🎉

*(But seriously, this will change how you work. Try it for one week.)*

---

# BACKUP SLIDES

---

# BACKUP: Detailed MCP Examples

**revenue-mcp:**
```
"Get account details for Mixbook"
"Search Salesforce for opportunities closing this month"
"Generate company enrichment for domain mixbook.com"
```

**gworkspace-mcp:**
```
"Search Drive for Mixbook documents"
"Read the MVF document for Mixbook"
"Find emails from o'neal@mixbook.com"
```

**shopify-dev-mcp:**
```
"How do I validate orders with GraphQL?"
"Show me the Admin API docs for B2B"
"Validate this GraphQL query"
```

**vault-mcp:**
```
"Find RFP response for PCI compliance"
"What's our position on POS hardware in Canada?"
"Search for Magento migration case studies"
```

---

# BACKUP: Technical Architecture

**The Full Stack:**

```
┌────────────────────────────────────────────┐
│        User Interface (Cursor IDE)         │
├────────────────────────────────────────────┤
│       AI Agent (Claude Sonnet 4.5)         │
├────────────────────────────────────────────┤
│          SE-NTRAL Rules Engine             │
│  (1738 lines of SE workflows & protocols)  │
├────────────────────────────────────────────┤
│          MCP Integration Layer             │
│  ┌─────────────────────────────────────┐  │
│  │  revenue-mcp  │  gworkspace-mcp     │  │
│  │  slack-mcp    │  shopify-dev-mcp    │  │
│  │  vault-mcp    │  scout-mcp          │  │
│  └─────────────────────────────────────┘  │
├────────────────────────────────────────────┤
│        Local Merchant Files (Markdown)     │
│         (Structured Context Storage)       │
└────────────────────────────────────────────┘
```

---

# BACKUP: Troubleshooting Common Issues

**"Returns other SEs' opportunities"**
- Check personal-config.md has correct UserId
- File must be in workspace root
- Run: `@se-assistant "Get my Salesforce UserId"`

**"Queries return too many results"**
- Update quarter dates in personal-config.md
- Ensure dates match Shopify fiscal quarters

**"Can't find merchant context"**
- Run: `@se-assistant "Sync merchant context for [Name]"`
- Check merchant folder exists in merchants/

**"MCP not working"**
- Verify MCPs configured in Cursor settings
- Check authentication status (may need re-auth)
- See .cursor/rules/se-assistant.mdc Section 0.4

---

# BACKUP: Advanced Features

**Competitive Intelligence:**
- Auto-searches Klue extracts and battle cards
- Generates competitive analysis documents
- Objection handling from proven responses

**Sync Protocols:**
- Smart caching (emails <30 days, Slack <60 days)
- Incremental updates (only new content)
- Size optimization (~105KB per merchant)

**Discovery Frameworks:**
- 5Cs: Circumstance → Challenge → Consequence → Change → Closing
- 6-Box Value Framework
- EPoV readiness assessment
- Challenger methodology integration

**Technical Assessments:**
- POS hardware validation by country
- Integration blueprint generation
- Risk assessment automation
- Phased implementation roadmaps

---

# END OF DECK

