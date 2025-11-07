# SE-ASSISTANT_CONTEXT-HUB

Your AI-powered research partner for Shopify SE work. Combines your merchant context with Shopify's internal tools (via MCPs) to help you research faster, prepare better, and prioritize smarter.

**Built for SEs. Syncs to [SE-NTRAL](https://se-ntral.quick.shopify.io/) for team sharing.**

---

## ⚡ What This Adds to SE Assistant

Operational workflows and tooling built on top of the foundational SE Assistant rules:

- **Work Prioritization** - Smart dashboards for opportunities and launch cases
- **Post-Sales Support** - Launch case management with SE consultation tracking
- **Account Organization** - Structured folders for pre-sales, post-sales, and shared context
- **Personal Config** - Your Salesforce UserId, quarter dates, and preferences
- **Salesforce Integration** - Bidirectional sync with validation protocols
- **Team Collaboration** - GitHub-based structure that syncs to SE-NTRAL

## 🤖 How It Works

SE Assistant uses a **4-agent architecture** for optimal performance:

- **Orchestrator** - Always active, automatically routes your requests to the right specialist
- **Account Manager** - Handles merchant folders, Salesforce, context sync
- **SE Coach** - Provides discovery frameworks, demo methodology, craft coaching
- **Solutions Architect** - Designs architectures, researches platform capabilities, writes technical assessments

**You don't need to know which agent handles what** - just ask naturally and the orchestrator routes automatically. Use `@account-manager`, `@se-coach`, or `@solutions-architect` if you want to override routing.

**Benefits:**
- ⚡ ~40% faster responses (loads only what's needed)
- 🎯 Better accuracy (specialized agents for specialized tasks)
- 📈 Scalable (easy to add new capabilities)

---

## 🚀 Quick Start (5 minutes)

### Step 0: Configure MCP Servers (REQUIRED)

**⚠️ Most important step** - Without MCPs, this tool won't work properly.

MCPs (Model Context Protocol servers) give the AI access to Shopify's internal tools. Think of them as API connectors.

**Setup guide:** [Shopify MCP Server Documentation](https://vault.shopify.io/ai/mcp_servers)

**Required MCPs:**
- ✅ **Revenue MCP** - Salesforce data, company enrichment, account info
- ✅ **Vault MCP** - Internal knowledge base, RFP responses, competitive battle cards
- ✅ **GWorkspace MCP** - Gmail threads, Drive docs, Calendar
- ✅ **Slack MCP** - Team conversations, merchant mentions

**Highly Recommended:**
- Scout MCP - Support tickets, merchant frustrations, sales conversations
- Shopify Dev MCP - API docs, GraphQL validation

**How to verify MCPs are working:**
```bash
@se-assistant "Get my Salesforce UserId"
```
If this returns your UserId, MCPs are configured correctly.

**Common MCP issues:**
- Need to re-authenticate with Google/Salesforce/Slack every few weeks
- Check Cursor settings → Features → Model Context Protocol
- Some MCPs require specific permissions (admin for Revenue MCP)

**Already have MCPs configured?** Skip to Step 1 below.

---

### Step 1: Clone Repository

**First time setup?** In Terminal:

```bash
cd ~/Documents  # Or wherever you keep projects
git clone https://github.com/shopify-playground/se-assistant.git
cd se-assistant
```

Then open the folder in Cursor.

**Already cloned?** Just open the folder in Cursor and skip to Step 2.

---

### Step 2: Run Setup in Cursor

When you open the folder, Cursor automatically:
- ✅ Loads SE Assistant with all agents
- ✅ Configures git to track shopify-playground/main for updates
- ✅ Auto-fetches updates (status bar shows ↓ when available)
- ✅ Adds one-click update tasks to Command Palette

Then run this to create your personal config:
```bash
@se-assistant "Set up SE-ASSISTANT_HUB for me"
```

This creates `personal-config.md` with your Salesforce UserId and quarter dates (gitignored).

---

### Step 3: Start Working

```bash
@se-assistant "New Opportunity: [Company Name]"
```

Done, prompt away! 🎉

**Tip:** Type `@se-assistant` to see all available commands.

---

## 🔄 Getting Updates from the Team

When the team pushes updates to [`shopify-playground/se-assistant/main`](https://github.com/shopify-playground/se-assistant/tree/main), you'll get them automatically.

**Easiest method:** Cursor shows updates automatically in the bottom-left status bar (↓ icon) - just click "Sync Changes"!

**Alternative:** Press `Cmd+Shift+P` → Type `Run Task: 🔄 Update SE-ASSISTANT_HUB` → Enter

**Merge strategy:** Team agent updates always take precedence (ensures everyone has latest agent versions).

**Your personal files are protected** - `merchants/*`, `personal-config.md`, and priority dashboards won't be overwritten.

**Full guide with all methods:** [`workflows/core/updating-from-github.md`](workflows/core/updating-from-github.md)

---

## 💪 What You Can Do

### Create & Manage Opportunities
```bash
@se-assistant "New Opportunity: Acme Corp"
```
Auto-creates merchant folder with pre-sales structure and pulls context from Gmail, Slack, Drive, Salesforce, and web research.

### Create & Manage Launch Cases
```bash
@se-assistant "New Launch Case: Acme Corp"
```
Auto-creates post-sales structure, pulls Launch Case data from Salesforce, links to pre-sales context.

### Start & End Your Day
```bash
"start my day"
"end my day"
```
Natural language daily automation - pulls calendar, Slack, Revenue MCPs → updates briefing docs → lean chat briefing (CEO-style: focus + actions only)

### Get Priorities & Pipeline Insights
```bash
@se-assistant "Update my priority dashboard"
@se-assistant "What should I focus on this week?"
@se-assistant "Show my open SE opportunities closing this quarter"
```

### Research & Prep
```bash
@se-assistant "Show me latest context for Acme Corp"
@se-assistant "Give me 5 reasons why this merchant may not choose Shopify"
@se-assistant "Create technical assessment for Acme Corp"
```

### Sync & Update Context
```bash
@se-assistant "Sync merchant context for Acme Corp"
@se-assistant "Clean up stale files for Acme Corp"
```

---

## 🤖 What This Does Automatically

When you create a merchant folder, it pulls:
- ✅ Email threads from Gmail
- ✅ Slack conversations
- ✅ Google Drive docs
- ✅ Salesforce opportunity/launch case data
- ✅ Internal Shopify resources (Vault, Scout)
- ✅ Company research

All organized in your `merchants/[Company Name]/` folder with:
- `pre-sales/` - Briefing doc, discovery assessment, technical assessment
- `post-sales/` - Launch plan
- `raw-files/` - Emails, meeting notes, Slack, docs (shared context for continuity)

**You can also add context manually:** Paste Drive links, emails, or notes into chat and ask to add them to the merchant folder.

---

## 📁 Project Structure

```
SE-ASSISTANT_CONTEXT-HUB/
├── merchants/                # One folder per merchant
│   └── [Merchant Name]/
│       ├── pre-sales/        # Opportunities (briefing, discovery, technical)
│       ├── post-sales/       # Launch Cases (launch plan)
│       └── raw-files/        # Context (emails, Slack, meeting notes, docs)
├── personal-config.md        # Your config (gitignored)
├── current-q-priorities.md   # Auto-generated dashboard
└── workflows/                # How-to guides
```

**Tip:** Use `@se-assistant` to access full workflow commands and context.

---

## 🎯 Key Features

- **Smart context gathering** - Automatic sync from Gmail, Slack, Drive, Salesforce
- **Discovery frameworks** - 5Cs, EPoV, Challenger methodology built-in
- **Technical assessments** - Generate from templates with merchant-specific details
- **Priority scoring** - Revenue + Probability + Urgency formula with tiered dashboards
- **Anti-hallucination** - Only references verified data, never synthesizes capabilities
- **Write operation safety** - 🚨 MANDATORY validation before any Salesforce updates
- **MCP-powered** - Direct access to Salesforce, Vault, Scout, Shopify Dev tools

---

## 🔧 Common Issues

**"Returns other SEs' opportunities"**  
→ Check `personal-config.md` has your correct Salesforce UserId

**"Queries return too many results"**  
→ Update quarter dates in `personal-config.md` (Q1: Jan-Mar, Q2: Apr-Jun, Q3: Jul-Sep, Q4: Oct-Dec)

**"Can't find merchant context"**  
→ Run: `@se-assistant "Sync merchant context for [Name]"`

**"MCP not working" / "Tool failed to execute"**  
→ Check Cursor settings → Features → Model Context Protocol  
→ Verify all required MCPs are listed and enabled  
→ Try re-authenticating (may need to re-auth with Google/Salesforce/Slack)  
→ Setup guide: [Shopify MCP Documentation](https://vault.shopify.io/ai/mcp_servers)  
→ Test with: `@se-assistant "Get my Salesforce UserId"` - should return your UserId

**More help:** 
- Type `@se-assistant "help"` for command reference
- MCP issues: Check Cursor settings → Features → Model Context Protocol
- Ping @william.bedard in Slack

---

## 🤝 Team Sharing with SE-NTRAL

Build your merchant context locally with this tool, then sync to [SE-NTRAL](https://se-ntral.quick.shopify.io/sync.html) for team-wide semantic search and knowledge sharing.

**SE-ASSISTANT_CONTEXT-HUB** = Your personal research genius  
**SE-NTRAL** = Team's collective intelligence network

*Shoutout to @Stephen.Brook and @Ben Homer for building this great tool!*

---

## 📚 Learn More

- **Version history:** [CHANGELOG.md](CHANGELOG.md)
- **Agent architecture:** 4-agent system for optimal performance
  - **Orchestrator** (`se-assistant.mdc`) - Always loaded, routes requests automatically
  - **Account Manager** (`agents/account-manager.mdc`) - Merchant lifecycle, Salesforce, context sync
  - **SE Coach** (`agents/se-coach.mdc`) - Discovery frameworks, demo methodology, craft coaching
  - **Solutions Architect** (`agents/solutions-architect.mdc`) - Architecture design, platform capabilities, API research
- **Complete rules & commands:** Type `@se-assistant` in Cursor (orchestrator automatically loads specialized agents as needed)
- **MCP setup:** [Shopify MCP Documentation](https://vault.shopify.io/ai/mcp_servers)
- **How routing works:** Orchestrator detects intent and loads the right agent automatically - no need to know agent names
- **Explicit agent access:** Use `@account-manager`, `@se-coach`, or `@solutions-architect` to override automatic routing

---

**Questions?** Contact @william.bedard in Slack
