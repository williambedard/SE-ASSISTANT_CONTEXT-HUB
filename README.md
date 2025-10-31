# SE-Assistant: Your AI-Powered Personal Research Genius

## 🎯 What is SE-Assistant?

SE-Assistant is a Cursor-based AI assistant specifically designed for Shopify Solutions Engineers. Built to understand the unique challenges of SE work, it helps you:

- 🔍 **Research merchants** faster than ever before
- 📞 **Prepare for calls** with complete context
- 🎯 **Prioritize work** with smart opportunity scoring and dashboards
- 🛠️ **Analyze technical requirements** across all commerce functions
- 🚀 **Craft solutions** with confidence

Think of it as your tireless research partner who never sleeps and always has the answers ready.

**Here's the magic:** SE-Assistant combines your full merchant context (every file, note, and email in your Cursor workspace) with direct access to Shopify's internal tools via MCPs and LLMs. It's like having a research team that knows everything about your deals and has instant access to every Shopify system.

💡 **The Formula:** Your merchant context + Shopify's internal data universe + MCPs = unstoppable SE efficiency.

---

**Built to feed into the [SE-NTRAL platform](https://se-ntral.quick.shopify.io/)** (kudos to Stephen Brook!) – the semantic search tool that revolutionized how SEs share and discover merchant context across the team.

**SE-Assistant is your personal research genius. SE-NTRAL is the team's collective intelligence network.** Build your context locally with SE-Assistant, sync to SE-NTRAL platform for team-wide sharing.

---

## ⚡ First Time? Start Here (30 seconds)

### Just Cloned This Repo?

**One command to set up:**

```bash
@se-assistant "Set up SE-Assistant for me"
```

This points you to [Onboarding Setup](workflows/core/onboarding-setup.md) which configures:
1. ✅ Your personal-config.md (gitignored)
2. ✅ Salesforce UserId (automatic)
3. ✅ Quarter dates and preferences
4. ✅ Validation that everything works

**Takes 2 minutes. Then see [Quick Start Guide](workflows/core/quick-start.md) for daily workflows.**

---

## 🎓 Already Set Up?

Jump straight to:
- `@se-assistant "New Opportunity: [Company Name]"` - Create merchant folder
- `@se-assistant "Update my priority dashboard"` - See your top deals
- `@se-assistant "What should I focus on this week?"` - Get priorities

**Daily workflows:** [Quick Start Guide](workflows/core/quick-start.md)

---

## 🚀 What Can SE-Assistant Do?

### 🎯 Smart Opportunity & Launch Case Management
- **Create opportunities** with `New Opportunity: [Name]` – auto-builds pre-sales folder structure and context
- **Create launch cases** with `New Launch Case: [Name]` – auto-builds post-sales folder structure
- **Auto-updates** briefings, discovery assessments, technical docs, and launch plans as you learn more
- **Syncs context** from Gmail, Slack, Drive, Salesforce, automatically
- **Context continuity** – `raw-files/` shared between pre-sales and post-sales for seamless handoff

### 🔍 Deep Research Arsenal
- **Shopify Intelligence:** Product docs, API guidance, support tickets, internal knowledge via Vault
- **Competitive Intel:** Klue battle cards and competitive analysis
- **Web Research:** Company enrichment and business intelligence
- **All sources verified** – no hallucinations, only facts

### ⚙️ Technical Superpowers
- **Generate technical assessments** from templates with your merchant context
- **Map tech stacks** to Shopify capabilities across all commerce functions
- **Validate POS hardware** compatibility by country
- **Design integration blueprints** with API strategy and data architecture

### 🎓 Sales & Discovery Frameworks
- **5Cs discovery framework** (Circumstance → Challenge → Consequence → Change → Closing)
- **EPoV readiness assessments** with gap identification
- **Challenger methodology** with reframe insights

### 📊 NEW: Opportunity Prioritization
- **Priority scoring** - Revenue + Probability + Urgency formula
- **Tier classification** - Tier 1/2/3 (Hot 🔥 / Warm 🟡 / Watch 👀)
- **Focus management** - 60/30/10 time allocation guidance
- **Smart dashboards** - Auto-generated with risk alerts
- Ask: `@se-assistant "What should I focus on this week?"`

---

## 💪 Essential Commands

Open a new chat in Cursor and tag `@se-assistant`. Here are the power moves:

### Create & Manage Opportunities (Pre-Sales)
```
@se-assistant
"New Opportunity: Acme Corp"
```
Creates merchant folder with `pre-sales/` structure and automatic context scraping from Gmail, Slack, Drive, Salesforce, and web research.

### Create & Manage Launch Cases (Post-Sales)
```
@se-assistant
"New Launch Case: Acme Corp"
```
Creates or updates merchant folder with `post-sales/` structure, pulls Launch Case details from Salesforce, and links to pre-sales context if available.

### Sync Merchant Context
```
@se-assistant
"Sync merchant context for Acme Corp"
```
Updates all context from Gmail/Slack/Drive with new emails, conversations, and documents. Auto-cleans stale files per cache policy (see rules file Section 0.6).

### Clean Up Stale Files
```
@se-assistant
"Clean up stale files for Acme Corp"
```
Removes emails older than 30 days, archives Slack messages older than 60 days, and checks Drive docs for updates. Keeps merchant folders lightweight (~105KB per merchant).

### Research & Analysis
```
@se-assistant
"Show me latest context for Acme Corp"

@se-assistant
"Give me 5 reasons why this merchant may not choose Shopify"

@se-assistant
"What are the competitive threats for this deal?"
```

### Technical Assessments
```
@se-assistant
"Create technical assessment for Acme Corp"

@se-assistant
"Validate POS hardware compatibility for this merchant"
```

### Query Your Pipeline
```
@se-assistant
"Show my open SE opportunities closing this quarter"

@se-assistant
"Find opportunities where my AEs have no SE assigned"

@se-assistant
"Get account details for [Merchant Name]"
```
Automatically uses your UserId and quarter from `personal-config.md`.

### Generate Priority Dashboard
```
@se-assistant
"Update my priority dashboard"
```
Calculates priority scores using formula from `workflows/reference/opportunity-prioritization.md`, generates tiered dashboard with urgent deals highlighted.

---

## 🤖 Automatic Context Gathering

When you create a new merchant, SE-NTRAL automatically pulls context from everywhere:

✅ **Email threads** from Gmail (via gworkspace MCP)  
✅ **Google Drive** documents and presentations  
✅ **Slack conversations** and shared files  
✅ **Salesforce data** and opportunity details  
✅ **Internal Shopify** resources and knowledge base  
✅ **Web research** for company intelligence  

All of this gets organized into your merchant folder **without you lifting a finger.**

---

## 📎 Manual Context Addition

You can also manually feed the assistant:

- Paste Drive links, email content, process diagrams directly into chat
- Ask: *"Add this to the [merchant] folder"*
- SE-NTRAL automatically updates existing merchant files with new information
- No duplicate data – it intelligently merges context

---

## 🎯 Now the Fun Part

Once your context is loaded, unleash the power:

🎨 **Build slide decks** for upcoming demos using existing context and MCPs  
📄 **Generate Technical Assessment docs** from templates with merchant-specific details  
🧠 **Strategic insights:** "Give me 5 reasons why this merchant may not choose Shopify"  
⚔️ **Competitive prep:** Use insights to prepare for objections in upcoming meetings  
🔬 **Research queries:** Combine merchant context with internal data for deep analysis  

💡 **The more context you feed it, the smarter it gets.** Your merchant folders become living knowledge bases.

---

## 🚨 The Problem SE-Assistant Solves

The SE-Assistant workflow in Cursor is incredible – you're building amazing solutions, crafting brilliant value props, and gathering competitive intelligence like never before.

**But there's a catch:** It's all local. Your genius is trapped on your machine.

Other SEs are solving the same problems, building similar solutions, and researching the same competitors – but they can't access your work. Classic information silo problem.

---

## ✨ The Solution: SE-Assistant + SE-NTRAL

SE-Assistant is your personal research genius. SE-NTRAL bridges local brilliance with team-wide collaboration.

### 🔗 How It Works
1. **You build locally:** Use SE-Assistant in Cursor to create merchant context and solutions
2. **You sync once:** Push your workspace to SE-NTRAL platform in seconds
3. **Team benefits forever:** Every SE can now access your merchant context, solutions, and insights

### 🔍 The Power: AI-Driven Semantic Search

SE-NTRAL doesn't just store files – it makes them discoverable:

🎯 **Search by meaning:** "Find merchants migrating from Magento" – not keyword matching, semantic understanding  
⚔️ **Competitive intelligence:** Discover how other SEs handled similar competitor objections  
💬 **Brilliant value props:** Find proven messaging that worked for similar merchants  
🛠️ **Pre-built solutions:** Don't reinvent the wheel – see what's already been done  

### 🎯 The Workflow
1. **Build in Cursor:** Create opportunities, gather context, craft solutions with SE-Assistant
2. **Sync to SE-NTRAL:** Share your work with the team (visit [SE-NTRAL Sync](https://se-ntral.quick.shopify.io/sync.html))
3. **Search & Discover:** Use semantic search to find relevant context from across all SEs
4. **Repeat:** The more everyone syncs, the smarter the system becomes

💡 **Think of it this way:** SE-Assistant is your personal research genius. SE-NTRAL is the team's collective intelligence network.

---

## 📁 Project Structure

**Note:** SE-Assistant uses a merchant-centric structure optimized for MCP integration and context preservation. See `.cursor/rules/se-assistant.mdc` for complete structural requirements.

```
SE-Assistant/
├── .cursor/rules/se-assistant.mdc    # SE-NTRAL rules (source of truth)
├── templates/                        # Document templates
│   └── personal-config-template.md   # Template for personal setup
├── personal-config.md                # Your config (gitignored)
├── current-q-priorities.md           # Auto-generated priority dashboard
├── workflows/                        # Workflow documentation
│   ├── core/                         # Core workflows
│   └── reference/                    # Reference guides (prioritization, etc.)
└── merchants/                        # One folder per merchant
    └── [Merchant Name]/
        ├── pre-sales/                # PRE-SALES WORK (Opportunities)
        │   ├── briefing-document.md  # Executive summary, stakeholders, timeline
        │   ├── discovery-assessment.md # 5Cs framework, EPoV readiness
        │   └── technical-assessment.md # Technical solution architecture
        ├── post-sales/               # POST-SALES WORK (Launch Cases)
        │   └── launch-plan.md        # Launch Case tracking, SE consultation
        └── raw-files/                # SHARED CONTEXT (continuity)
            ├── config.md             # Internal tool links (Salesforce, Slack, Drive)
            ├── slack.md              # Slack conversation summaries
            ├── meeting-notes/        # Meeting transcripts
            ├── emails/               # Email threads
            ├── case-notes/           # Launch Case specific notes
            ├── handoff-docs/         # CSM handoff materials
            ├── documents/            # Merchant deliverables
            ├── key-resources/        # Received documentation
            └── additional-context/   # Research, competitive analysis
```

**Critical:** Pre-sales files live in `pre-sales/` directory, post-sales files in `post-sales/` directory, and `raw-files/` is shared for context continuity. See rules file Section 1.1.1 for details.

---

## 🛡️ Why Personal Config?

**The Problem:**
- Salesforce queries without proper filtering return **ALL SEs' opportunities** (not just yours)
- This breaks dashboards, priority calculations, and pipeline views
- You get opportunities you're not assigned to

**The Solution:**
Create `personal-config.md` with your Salesforce UserId:

```bash
# 1. Copy template
cp templates/personal-config-template.md personal-config.md

# 2. Get your UserId
@se-assistant "Get my Salesforce UserId"

# 3. Fill in template with:
#    - Your Salesforce UserId
#    - Current quarter dates (Q4 2025 = Oct 1 to Dec 31)
#    - Your AE names
#    - Google Drive folder ID (optional)

# 4. Done! @se-assistant automatically uses your config
```

**What It Does:**
- ✅ Filters queries: `WHERE UserId = '[YOUR_ID]'` (only YOUR opportunities)
- ✅ Current quarter dates (focuses on actionable deals)
- ✅ AE names (for potential assignment queries)
- ✅ Gitignored (private, not committed)

---

## 🎓 For Peer SEs (Team Adoption)

### Prerequisites: Set Up MCP Servers

**Before cloning, ensure your Cursor has MCP servers configured:**

SE-NTRAL relies on Model Context Protocol (MCP) servers to access Shopify's internal tools (Salesforce, Vault, Scout, etc.). Without these, many features won't work.

**Setup guide:** [Shopify MCP Server Documentation](https://vault.shopify.io/ai/mcp_servers)

**Required MCPs:**
- ✅ Revenue MCP (Salesforce data, company enrichment)
- ✅ Vault MCP (internal knowledge base)
- ✅ GWorkspace MCP (Gmail, Drive, Calendar)
- ✅ Slack MCP (conversations, mentions)

**Optional but recommended:**
- Scout MCP (support tickets, merchant frustrations)
- Shopify Dev MCP (API docs, GraphQL validation)

**Already have MCPs configured?** Continue to Step 1 below.

---

### Step 1: Clone the Repo

**If you don't have a folder for projects yet:**
1. Create one
2. Open Cursor → File → Open Folder → Select that folder
3. Open Cursor's terminal (View → Terminal)

**In Cursor's terminal:**
```bash
# Clone the repository into your root projects folder
git clone https://github.com/williambedard/SE-Assistant

```

You're now in the SE-Assistant project folder, good to go.

---

### Step 2: Set Up Your Personal Config (2 minutes)

In Cursor, run:

```bash
@se-assistant "Set up SE-Assistant for me"
```

This will:
- Get your Salesforce UserId automatically
- Configure quarter dates and AE names
- Validate everything works

---

### Step 3: Create Your Merchant Folders

```bash
@se-assistant "generate folders for all my active merchants, place them under a parent 'merchants' folder."
```

This auto-creates the folder structure and pulls context from Salesforce, Gmail, Slack, and Drive.

**Daily workflows:** See [Quick Start Guide](workflows/core/quick-start.md)

---

**Troubleshooting:** See [Onboarding Setup Guide](workflows/core/onboarding-setup.md) if setup fails, or contact @william.bedard in slack

---

## 🔥 Power User Tips

### Merchant Folder Creation
```
@se-assistant "New Opportunity: Acme Corp"
```
Auto-creates folder structure and populates with:
- Salesforce opportunity data
- External company research
- Gmail/Slack/Drive context
- Competitive intelligence

### Context Sync
```
@se-assistant "Sync merchant context for Acme Corp"
```
Pulls latest from Gmail, Slack, Drive and updates local files.

**Sync frequency:**
- Before calls/meetings
- Weekly (3-5 days lookback)
- After key milestones
- On-demand

### Advanced Queries
```
@se-assistant "Build competitive analysis for this merchant migrating from Magento"

@se-assistant "Create discovery questions focused on B2B + International expansion"

@se-assistant "What POS hardware does this merchant need for Canada compliance?"
```

---

## 🎁 Key Features at a Glance

### 🔐 Anti-Hallucination Protocols
- "I don't know" over speculation
- Never synthesizes capabilities or pricing
- References only documented data
- Explicitly states limitations

### 🔌 MCP Integration
- **Revenue MCP:** Salesforce data, account info, company enrichment
- **Scout MCP:** Merchant frustrations, support tickets, sales conversations
- **Shopify Dev MCP:** API docs, GraphQL validation, component validation
- **Vault MCP:** Internal knowledge base, RFP responses, competitive battle cards
- **GWorkspace MCP:** Drive docs, Calendar, Gmail
- **Slack MCP:** Team conversations, merchant mentions

**Setup required:** See [Shopify MCP Server Documentation](https://vault.shopify.io/ai/mcp_servers) for configuration instructions.

### 🗂️ Merchant-Centric Organization
- One folder per merchant with complete engagement history
- No cross-folder information bleed
- Context reset when switching merchants
- Living knowledge bases that grow smarter over time

---

## 🔧 Troubleshooting

### "SE-Assistant returns other SEs' opportunities"
→ Check `personal-config.md` has your correct Salesforce UserId  
→ File must be in workspace root (not in merchants folder)  
→ Run: `@se-assistant "Get my Salesforce UserId"` to verify

### "Queries return too many results"
→ Update quarter dates in `personal-config.md`  
→ Ensure dates match current Shopify fiscal quarter (Q1: Jan-Mar, Q2: Apr-Jun, Q3: Jul-Sep, Q4: Oct-Dec)  
→ SE-Assistant automatically filters by quarter when personal-config exists

### "Can't find merchant context"
→ Run: `@se-assistant "Sync merchant context for [Name]"`  
→ Check merchant folder exists in `merchants/` directory  
→ Verify folder structure matches rules file (see Section 1.1.1 in `.cursor/rules/se-assistant.mdc`)

### "MCP not working"
→ Verify MCP servers configured in Cursor settings  
→ Check authentication status (may need to re-auth with Google/Salesforce/Slack)  
→ Setup guide: [Shopify MCP Server Documentation](https://vault.shopify.io/ai/mcp_servers)  
→ See rules file Section 0.4 for MCP prerequisites and degraded mode operations

### "Priority scores don't match expectations"
→ Review scoring formula: `workflows/reference/opportunity-prioritization.md`  
→ Verify Salesforce fields populated: `Total_Revenue__c`, `Close_Probability__c`, `CloseDate`  
→ Check that `Primary__c = true` for your opportunities

### "New Opportunity command not creating files"
→ Check if folder already exists (command aborts if it does)  
→ Verify you're in workspace root directory  
→ See rules file Section 1.1 for creation workflow details

### "Merchant folder is too large/slow"
→ Run: `@se-assistant "Clean up stale files for [Merchant Name]"`  
→ Target: ~105KB per merchant (emails <30 days, Slack <60 days)  
→ See rules file Section 0.6 for cache management policy

---

## ❓ Questions?

**How do I use SE-Assistant?**  
→ Just use `@se-assistant` in any Cursor chat

**Do I need to create personal-config.md?**  
→ Only if you want accurate query filtering (highly recommended) and add your own personal rules/context

**Where are the complete rules?**  
→ `.cursor/rules/se-assistant.mdc` (1318 lines, loaded via `@se-assistant`). Ideally avoid to edit this file, as it has been optimized for LLM readability. Use personal-config.md to add your own logic and rules instead.

**How do I sync to the SE-NTRAL team platform?**  
→ Visit [SE-NTRAL Sync](https://se-ntral.quick.shopify.io/sync.html) after building context locally

---

## 🚀 Ready to Start?

```bash
@se-assistant
"Let's get started!"
```

Welcome to the future. 🎉

