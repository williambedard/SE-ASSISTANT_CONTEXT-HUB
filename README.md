# SE-ASSISTANT_CONTEXT-HUB

Your AI-powered research partner for Shopify SE work. Combines your merchant context with Shopify's internal tools (via MCPs) to help you research faster, prepare better, and prioritize smarter.

**Built for SEs. Syncs to [SE-NTRAL](https://se-ntral.quick.shopify.io/) for team sharing.**

---

## 🚀 Quick Start (2 minutes)

### Prerequisites
You need [MCP servers](https://vault.shopify.io/ai/mcp_servers) configured in Cursor first (Revenue MCP, Vault MCP, GWorkspace MCP, Slack MCP).

### Setup

**1. Clone this repo**
```bash
git clone https://github.com/williambedard/SE-ASSISTANT_CONTEXT-HUB
```

**2. Run setup in Cursor**
```bash
@se-assistant "Set up SE-ASSISTANT_CONTEXT-HUB for me"
```
This creates your `personal-config.md` with your Salesforce UserId and quarter dates (gitignored).

**3. Start working**
```bash
@se-assistant "New Opportunity: [Company Name]"
```

Done! 🎉

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
- **MCP-powered** - Direct access to Salesforce, Vault, Scout, Shopify Dev tools

---

## 🔧 Common Issues

**"Returns other SEs' opportunities"**  
→ Check `personal-config.md` has your correct Salesforce UserId

**"Queries return too many results"**  
→ Update quarter dates in `personal-config.md` (Q1: Jan-Mar, Q2: Apr-Jun, Q3: Jul-Sep, Q4: Oct-Dec)

**"Can't find merchant context"**  
→ Run: `@se-assistant "Sync merchant context for [Name]"`

**"MCP not working"**  
→ Verify MCP servers configured in Cursor settings: [Shopify MCP Documentation](https://vault.shopify.io/ai/mcp_servers)

**More help:** [Onboarding Setup Guide](workflows/core/onboarding-setup.md) or ping @william.bedard in Slack

---

## 🤝 Team Sharing with SE-NTRAL

Build your merchant context locally with this tool, then sync to [SE-NTRAL](https://se-ntral.quick.shopify.io/sync.html) for team-wide semantic search and knowledge sharing.

**SE-ASSISTANT_CONTEXT-HUB** = Your personal research genius  
**SE-NTRAL** = Team's collective intelligence network

---

## 📚 Learn More

- **Daily workflows:** [Quick Start Guide](workflows/core/quick-start.md)
- **First-time setup:** [Onboarding Setup](workflows/core/onboarding-setup.md)
- **Prioritization:** [Opportunity Prioritization Guide](workflows/reference/opportunity-prioritization.md)
- **Complete rules:** `.cursor/rules/se-assistant.mdc` (loaded via `@se-assistant`)

---

**Questions?** Contact @william.bedard in Slack
