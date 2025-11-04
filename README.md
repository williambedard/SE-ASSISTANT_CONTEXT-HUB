# SE-ASSISTANT_CONTEXT-HUB

Your AI-powered research partner for Shopify SE work. Combines your merchant context with Shopify's internal tools (via MCPs) to help you research faster, prepare better, and prioritize smarter.

**Built for SEs. Syncs to [SE-NTRAL](https://se-ntral.quick.shopify.io/) for team sharing.**

---

## ⚡ What This Adds to SE Assistant v7.1

This repo builds on the foundational SE Assistant rules with operational workflows and tooling:

**1. Work Prioritization & Focus** 🎯
- Automated "What should I focus on?" dashboard with scored priorities
- Pre-sales: Opportunities by tier (Revenue + Close Probability + Urgency)
- Post-sales: Launch Cases by health status (Red/Yellow/Green)
- Uses personal Salesforce UserId + quarter dates for filtering
- Time allocation guidance (60% Tier 1, 30% Tier 2, 10% Tier 3)

**2. Launch Case & Post-Sales Support** 🚀
- New launch cases trigger post-sales structure and pulls existing opp data from the Account
- `post-sales/launch-plan.md` template for SE consultation tracking
- SE Consultation Log for platform validations, architecture guidance, technical escalations
- Context continuity via shared `raw-files/` (pre-sales context flows seamlessly into post-sales)
- Can manage multiple TAs per Account accessible across merchant lifecycle (ex.: POS opp, B2B opp)

**3. Account-Level Organization** 📁
- Split directory structure: `pre-sales/` (Opportunities) + `post-sales/` (Launch Cases) + shared `raw-files/`
- Technical assessments in `raw-files/documents/{product}-technical-assessment.md` (multiple per account supported)
- Automatic Drive search and pull for TAs during sync
- Context continuity model: `raw-files/` provides seamless merchant history across phases

**4. Infrastructure & Configuration** 🔧
- Personal Config: `personal-config.md` with Salesforce UserId, quarterly context window, Drive folders (enables prioritization/queries)
- MCP Tooling: revenue-mcp enhanced (always pulls Id/Name/SE_Next_Steps__c)
- More Guardrails: AI Self-Check quality controls, sync history checks, operational validation protocols

**5. Meeting Automation & Salesforce** 🤝📝 **[Coming Soon]**
- Meeting Workflow: Structured notes with auto-generated TL;DR/sentiment, post-meeting auto-processing, automatic briefing updates
- Salesforce Writes: Bidirectional SE Next Steps sync via Gumloop MCP (read → update locally → write in SF → validate), eliminates manual field updates

**tl;dr:** Base SE Assistant = foundational rules. This repo = daily workflows + tooling + team collaboration via GitHub.

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

### Step 1: Clone & Setup

**First time setting up your work locally?**

1. Create an empty project folder
2. Open a terminal window at that folder
3. Run:
   ```bash
   git init
   git clone https://github.com/williambedard/SE-ASSISTANT_CONTEXT-HUB
   ```
4. Open the `SE-ASSISTANT_CONTEXT-HUB` folder in Cursor

**Already have the repo?** Just open it in Cursor and continue to Step 2.

---

### Step 2: Run Setup in Cursor

In Cursor, open the cloned folder and run:
```bash
@se-assistant "Set up SE-ASSISTANT_CONTEXT-HUB for me"
```
This creates your `personal-config.md` with your Salesforce UserId and quarter dates (gitignored).

---

### Step 3: Start Working

```bash
@se-assistant "New Opportunity: [Company Name]"
```

Done, prompt away! 🎉

**Full details:** See [Quick Start Guide](workflows/core/quick-start.md) for daily workflows.

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

**See:** [Quick Start Guide](workflows/core/quick-start.md) for folder structure details and daily workflows.

---

## 🎯 Key Features

- **Smart context gathering** - Automatic sync from Gmail, Slack, Drive, Salesforce
- **Discovery frameworks** - 5Cs, EPoV, Challenger methodology built-in
- **Technical assessments** - Generate from templates with merchant-specific details
- **Priority scoring** - Revenue + Probability + Urgency formula with tiered dashboards
- **Anti-hallucination** - Only references verified data, never synthesizes capabilities
- **Write operation safety** - 🚨 MANDATORY validation before any Salesforce updates (see `workflows/reference/gumloop-validation-protocol.md`)
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
- [Onboarding Setup Guide](workflows/core/onboarding-setup.md)
- [MCP Troubleshooting Guide](workflows/reference/mcp-troubleshooting.md) - Auth failures, permission errors, sync issues
- Ping @william.bedard in Slack

---

## 🤝 Team Sharing with SE-NTRAL

Build your merchant context locally with this tool, then sync to [SE-NTRAL](https://se-ntral.quick.shopify.io/sync.html) for team-wide semantic search and knowledge sharing.

**SE-ASSISTANT_CONTEXT-HUB** = Your personal research genius  
**SE-NTRAL** = Team's collective intelligence network

*Shoutout to @Stephen.Brook and @Ben Homer for building this great tool!*

---

## 📚 Learn More

- **Daily workflows:** [Quick Start Guide](workflows/core/quick-start.md)
- **First-time setup:** [Onboarding Setup](workflows/core/onboarding-setup.md)
- **Prioritization:** [Opportunity Prioritization Guide](workflows/reference/opportunity-prioritization.md)
- **Salesforce writes:** [SE Next Steps Sync](workflows/reference/se-next-steps-sync.md) + [Validation Protocol](workflows/reference/gumloop-validation-protocol.md)
- **MCP Troubleshooting:** [MCP Troubleshooting Guide](workflows/reference/mcp-troubleshooting.md)
- **Complete rules:** `.cursor/rules/se-assistant.mdc` (loaded via `@se-assistant`)

---

**Questions?** Contact @william.bedard in Slack
