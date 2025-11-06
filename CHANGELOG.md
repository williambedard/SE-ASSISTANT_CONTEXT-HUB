# Changelog

All notable changes to the SE Assistant will be documented in this file.

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

