# Changelog

All notable changes to the SE Assistant will be documented in this file.

## [8.0.1] - 2025-11-07

### Enhanced - Weekend-Aware End of Day Workflow

**User Experience Improvement:** End-of-day automation now intelligently detects weekends and adjusts messaging accordingly.

### Changed
- **Weekend Detection Logic:** Automatically detects Friday vs Monday-Thursday when running end-of-day workflow
- **Friday End of Day Format:**
  - "Accomplishments This Week" (instead of just today)
  - "Next Week Preview" section with Monday focus + week overview
  - "Top 3 priorities for next week" (instead of tomorrow)
  - "Action Items Before Next Week" (instead of before EOD)
- **Monday-Thursday Format:** Unchanged - focuses on tomorrow as next business day
- **Trigger Phrases:** Added "finishing my day", "wrapping up for the day", "wrapping up for the weekend"

### Technical Details
- User doesn't work weekends - system now respects this boundary
- Mon-Thu: Queries tomorrow's calendar (next business day)
- Friday: Queries next week's calendar (Monday-Friday preview)
- Updated output templates with day-specific formatting

### Benefits
- ✅ No more "tomorrow" confusion on Fridays
- ✅ Natural weekly rhythm (week recap on Fridays vs daily recap Mon-Thu)
- ✅ Better work-life boundaries (respects weekends)
- ✅ More relevant next-week planning on Fridays

## [8.0.0] - 2025-11-06

### Major Architecture Refactor: 4-Agent System

**Breaking Change:** Split monolithic `se-assistant.mdc` into specialized agent architecture for improved token efficiency, clearer boundaries, and scalability.

### Added
- **Orchestrator Agent** (`se-assistant.mdc`) - Always loaded, routes requests to specialized agents
  - Request routing logic with "Apply Intelligently" mode (Cursor auto-loads agents based on semantic understanding)
  - Ambiguity detection and handling (smart disambiguation for "Update [merchant]" queries)
  - Multi-agent sequential request handling
  - Planning and prioritization workflows (daily briefings, focus dashboards)
- **Account Manager Agent** (`agents/account-manager.mdc`) - Merchant lifecycle management
  - Merchant folder CRUD operations
  - Salesforce read/write operations (opportunities, launch cases, SE Next Steps)
  - Context sync across Gmail/Slack/Drive
  - Company research and intelligence gathering
  - Embedded Gumloop validation protocol and SE Next Steps sync workflow
- **SE Coach Agent** (`agents/se-coach.mdc`) - Methodology and craft coaching
  - Discovery frameworks (5Cs, EPoV, 6-Box Value Framework)
  - Demo methodology and evaluation
  - Tech stack assessment methodology
  - Craft coaching and call evaluations
  - Competitive intelligence methodology
- **Solutions Architect Agent** (`agents/solutions-architect.mdc`) - Technical design
  - Custom architecture design for merchant use cases
  - Platform capability and limitation evaluation
  - Technical assessment creation and management
  - Integration architecture patterns
  - Deep Shopify API research and GraphQL validation

### Enhanced
- **Token Efficiency:** ~40% reduction per query (load only needed agents)
- **Self-Contained Agents:** Core principles embedded in each agent (no external dependencies)
- **Explicit Collaboration Patterns:** Documented file access patterns between agents
- **Smart Routing:** 93% accuracy with context-aware ambiguity handling
- **Ambiguous Query Handling:** "Update [merchant]" shows local summary before fetching from MCPs

### Changed
- **Agent Loading:** Uses Cursor's "Apply Intelligently" mode - agents auto-load based on semantic understanding (better UX, cleaner architecture)
- **Orchestrator Role:** Validates routing and provides fallback (no longer needs explicit `read_file` calls)
- **File Structure:** New `.cursor/rules/agents/` directory for specialized agents
- **Core Principles:** Embedded in all agents (previously referenced from orchestrator)
- **Workflow Consolidation:** Embedded reference files into agents (gumloop-validation-protocol.md, se-next-steps-sync.md, opportunity-prioritization.md)
- **Agent Descriptions:** Added `description` metadata to frontmatter for better intelligent loading

### Removed
- Monolithic agent structure (split into 4 specialized agents)
- External workflow dependencies (embedded into agents for self-containment)
- Test files (AGENT-ROUTING-TEST-RESULTS.md)

### Technical Details
- **Orchestrator:** 640 lines (routing + core identity)
- **Account Manager:** 1,180 lines (merchant operations)
- **SE Coach:** 570 lines (methodology)
- **Solutions Architect:** 410 lines (technical design)
- **Total:** 2,899 lines (vs 2,296 lines monolithic - better organized, more maintainable)

### Migration Notes
- **No user action required** - Orchestrator automatically routes requests
- **Explicit agent mentions:** Users can use `@account-manager`, `@se-coach`, `@solutions-architect` to override routing
- **Backward compatible:** All existing commands work the same way

### Benefits
- ✅ Clear separation of concerns (each agent has focused responsibilities)
- ✅ Improved token efficiency (~40% reduction per query)
- ✅ Better scalability (easy to add new agents)
- ✅ Self-contained agents (no external dependencies)
- ✅ Production-ready routing (93% accuracy tested)

## [7.5.4] - 2025-11-06

### Integration Branch (will-se-sandbox)
This version merges SE-ASSISTANT_CONTEXT-HUB operational workflows into shopify-playground/se-assistant base.

### Added from SE-ASSISTANT_CONTEXT-HUB
- Work Prioritization & Focus system (Pre-sales Opportunities + Post-sales Launch Cases)
- Launch Case & Post-Sales Support workflows with SE Consultation Log
- Account-Level Organization (pre-sales/, post-sales/, raw-files/ structure)
- Personal Config infrastructure (Salesforce UserId, quarter dates, Drive folders)
- Priority dashboard generation with scoring formula
- Enhanced MCP integration protocols
- AI Self-Check quality controls
- Gumloop validation protocol for Salesforce writes
- Context loading and prioritization guides
- MCP troubleshooting documentation

### Enhanced
- README.md with comprehensive setup, workflows, and team collaboration details
- .gitignore with merchant folders, personal-config.md, presentation/ exclusions
- File structure to support both pre-sales and post-sales merchant lifecycle phases
- Folder hierarchy optimized for SE-NTRAL dashboard parsing

### Differences from shopify-playground/se-assistant main
- Expanded operational workflows beyond core rules
- GitHub-based team collaboration structure
- Integration with SE-NTRAL for context sharing
- Daily workflow templates and reference guides

## [7.5.3] - 2025-11-05

### Changed
- Optimised content to reduce file size from 110k to under 100k characters while maintaining all critical functionality

## [7.5.2] - Previous Version

### Added
- Merchant Status Tracking & Salesforce Integration (Section 12)
- Status determination logic for Opportunity/In Launch/Archived states
- Automated status detection via revenue-mcp
- Status-specific file management protocols

### Enhanced
- Briefing document with Executive Summary and Current Engagement Status sections
- Integration with SE-NTRAL dashboard for portfolio tracking

## [7.0] - Previous Major Version

### Added
- Core SE Assistant identity and operations framework
- MCP Prerequisites & Environment setup
- Directory-Scoped Context & Opportunity Management
- Knowledge Management & Templates
- Technical Assessment & Documentation workflows
- Anti-Hallucination & Validation protocols
- Information Source Hierarchy & Usage
- Discovery Framework & 5Cs Integration
- Merchant Tech Stack Assessment Protocol
- Competitive Intelligence Protocol
- Web Research & Company Intelligence Protocol
- Merchant Context Sync Protocol
- Shopify Cultural Principles integration

### Features
- Automated opportunity creation with context scraping
- Multi-source merchant context synchronisation (Gmail, Slack, Google Drive)
- Technical assessment generation and management
- 5Cs discovery framework application
- POS hardware validation against supported hardware
- Competitive intelligence gathering from Klue data
- Company enrichment via Revenue MCP
- Internal content flagging for confidential information
- SE-NTRAL integration for team-wide visibility

## Version Naming Convention

- **Major (X.0):** Core functionality, persona, or workflow changes
- **Minor (X.Y):** New rules, enhancements, or feature additions
- **Patch (X.Y.Z):** Bug fixes, clarifications, or minor adjustments

## Contributing

For questions, feedback, or to report issues, please reach out in the [#se-assistant Slack channel](https://shopify.enterprise.slack.com/archives/C07JYRCSZH2).

