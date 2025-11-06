# SE Assistant

Welcome 🚀

The SE Assistant is a Cursor based, AI assistant for Solutions Engineers and has been described as "the best f* resource I've ever had for my work".

SE Assistant allows you to integrate with ⚡️ SE-NTRAL.

Join us in [#se-assistant](https://shopify.enterprise.slack.com/archives/C07JYRCSZH2) for latest updates, tinkering and advice.

This document outlines setup instructions, key capabilities, changelog, quick start commands and stores the latest version of the SE Assistant.

## Setup Instructions

The setup is chunky, but it's worth it. You will come through a cursor power user and equipped with a powerful assistant.

You've got this! 💚

### Installing Cursor

1. [Install Cursor](https://www.cursor.com/)
2. If prompted for a password, insert the computer password (you will be asked to re-enter it multiple times at once)

### Adding the SE Assistant

#### Create the merchant project folder

1. Go to your Desktop > Right click > Add Folder > call it 'Merchants'
2. Open Cursor, in the top bar click File > Open Folder, navigate to desktop, open 'Merchants'

#### Add the SE Assistant

1. Download or copy the `se-assistant.mdc` file from this repository
2. In cursor, open settings > Rules & Memories > Project Rules 'Add rule'
3. Name the rule "se-assistant"
4. Paste the content from `se-assistant.mdc`
5. Save

### Activating MCP Servers

SE Assistant requires MCP Server integration to have access to Shopify context.

**Tip:** The 'Add to Cursor' button in Vault often breaks your configuration file. Rather copy and paste the provided configuration into your mcp.json file.

#### Prerequisites

1. **GitHub Access** - ensure you have access to Shopify, Shop and Playground. This can be requested through Okta.
2. Install [dev](https://github.com/Shopify/dev) (& follow https://technical-learning.docs.shopify.io/setup/github_access for GitHub instructions)

#### Install MCP servers

Do them in this order as they get more complicated / less important 'for SE'ing' as you move through:

1. [G Workspace](https://vault.shopify.io/ai/mcp-servers/194-gworkspace) - guided steps
2. [Vault MCP](https://vault.shopify.io/ai/mcp-servers/193-vault-mcp) - guided steps
3. [Vault-set Search](https://vault.shopify.io/ai/mcp-servers/270-vault-set-search-mcp)
4. [Support Core](https://vault.shopify.io/ai/mcp-servers/215-support-core-mcp)
5. [Dev MCP](https://vault.shopify.io/ai/mcp-servers/151-dev-mcp)
6. [Slack MCP](https://vault.shopify.io/ai/mcp-servers/195-slack-mcp) - guided steps
7. [Shopify Dev](https://vault.shopify.io/ai/mcp-servers/192-shopify-dev-mcp)
8. [Observe MCP](https://vault.shopify.io/ai/mcp-servers/267-observe-mcp)
9. [Data Portal MCP](https://vault.shopify.io/ai/mcp-servers/240-data-portal-mcp) (Reference for install - successful install of this should make everything else work)
10. [Scout MCP](https://vault.shopify.io/ai/mcp-servers/249-scout-mcp)

**Note on Competebot MCP:** Instead of integrating the MCP, which has proved troublesome, we've built the logic directly into the SE Assistant (v5.1+) and then access the appropriate files via the gworkspace mcp.

#### Troubleshooting tips for MCPs

1. Ask Cursor to help debug why the MCP server isn't connecting properly, then proceed with the steps it proposes (honestly, this helps)
2. Check your mac is up to date
3. Update the CLI Tools (from System Settings -> General -> Software Update)
4. Hard quit cursor (command + q) and reopen (sometimes it's simply an authentication issue which goes through your browser)
5. If that still doesn't enable MCPs, turn each MCP on and off again (toggle in settings)
6. Ask Cursor to debug your brew set-up (use MAX mode with Claude as a model)
7. If that still doesn't work, try adding the following commands into the agent chat box:
   - `dev github auth`
   - `gcloud auth login`
   - `brew install uv`
   - `dev update`
   
   Run each command one at a time, and repeat steps 2 and 3 for each command.

## Getting Started

1. Tag the se-assistant in a prompt, then ask it to create a new Merchant
2. Prompt the se-assistant to add context from a file / your emails / a slack thread to a specific merchant
3. Prompt the se-assistant to prepare a technical fit analysis based on known requirements to date.

## Capabilities Summary

### Opportunity & Context Management

- Create new opportunities with "New Opportunity: [Name]" - auto-creates folder structure and scrapes internal & external context
- Auto-update merchant files when new information is manually provided or discovered in the sync (briefing docs, discovery assessments, technical assessments)

### Research & Intelligence

- Shopify product/feature research via support-core MCP (public help docs, internal knowledge, Zendesk tickets)
- Technical implementation guidance via shopify-dev MCP (APIs, GraphQL, developer docs)
- Competitive intelligence from Klue data and battle cards via Google Workspace
- Web research & company enrichment for merchant business intelligence
- Internal knowledge search via Vault MCPs for strategies, roadmap, RFP content

### Technical Assessments

- Google Doc technical assessments - create/update from template with merchant context
- Tech stack capability mapping across all commerce functions (catalog, pricing, checkout, fulfillment, etc.)
- POS hardware validation against Shopify's supported hardware by country
- Integration blueprint design with API strategy and data architecture

### Discovery & Sales Frameworks

- 5Cs discovery framework application (Circumstance/Challenge/Consequence/Change/Closing)
- EPoV readiness assessment with gap identification
- Challenger approach integration with reframe insights

### Merchant Context Sync

- Sync merchant context from Gmail, Slack, and Google Drive with "sync merchants"
- Auto-extract stakeholders and build intelligent search queries
- Read document contents and save to merchant raw-files/ folders
- Update briefing documents automatically with discovered context

### File Management

- Briefing documents - executive summaries, stakeholder tracking, timelines
- Discovery assessments - 5Cs framework, discovery gaps, EPoV status
- Technical assessments - product snapshots, proposed solutions, tech stacks
- Raw files organisation - meeting notes, emails, Slack threads, key resources

### Anti-Hallucination & Accuracy

- 100% verified information - says "I don't know" when uncertain
- Source hierarchy enforcement - prioritises authoritative sources (RFP content > internal docs > public docs)
- Explicit internal-only marking for confidential information
- Tool/service name validation to prevent transcription errors

## Quick Start Commands

- `"New Opportunity: [Merchant Name]"` - Creates new merchant folder with context scraping
- `"Sync merchants"` - Updates all merchant context from Gmail/Slack/Drive
- `"Technical assessment for [merchant]"` - Creates/updates Google Doc assessment

## Support & Community

Join the [#se-assistant Slack channel](https://shopify.enterprise.slack.com/archives/C07JYRCSZH2) for:
- Latest updates and announcements
- Tips and tricks from other users
- Troubleshooting help
- Feature requests and feedback

## SE-NTRAL Integration

SE Assistant integrates with [SE-NTRAL](https://se-ntral.quick.shopify.io/) for centralised merchant context visibility across the team.

After significant updates, the assistant will prompt you to sync your context to SE-NTRAL.

## Version Information

Current Version: **v7.0**

For detailed version history and changelog, see [CHANGELOG.md](CHANGELOG.md)

## Contributing

This is an internal Shopify tool. For questions, feedback, or contributions, please reach out in the #se-assistant Slack channel.

## License

Internal Shopify use only.
