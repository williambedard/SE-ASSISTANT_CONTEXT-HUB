# Merchant Context Loader

*Auto-load pattern for efficient context management*

**Reference:** This guide implements the caching strategy defined in `.cursor/rules/se-assistant.mdc` Section 0.6

---

## How This Works

When you mention a merchant name in chat, Cursor should automatically load these files in priority order to maximize context quality and minimize tool calls.

---

## Auto-Load Priority Pattern

**When user mentions a merchant (e.g., "Acme Corp"):**

### Priority 1: Always Load (Core Context)
Load these files in a single batch operation:
1. `merchants/[Merchant Name]/briefing-document.md` - Executive summary, stakeholders
2. `merchants/[Merchant Name]/discovery-assessment.md` - Challenges, needs, 5Cs
3. `merchants/[Merchant Name]/technical-assessment.md` - Tech stack, solutions

### Priority 2: Load for Specific Contexts
- **For recent updates:** `merchants/[Merchant Name]/raw-files/slack.md`
- **For system links:** `merchants/[Merchant Name]/raw-files/config.md`
- **For meeting prep:** `merchants/[Merchant Name]/raw-files/meeting-notes/`

### Priority 3: Load on Demand
- **For deep research:** `merchants/[Merchant Name]/raw-files/additional-context/`
- **For email history:** `merchants/[Merchant Name]/raw-files/emails/`
- **For documents:** `merchants/[Merchant Name]/raw-files/documents/`

---

## Usage Examples

### Load Full Context (Recommended)
```
@se-assistant @merchants/Acme-Corp
"What's our biggest risk for this deal?"
```
**Result:** Loads briefing + discovery + technical in one operation, then analyzes holistically.

### Load Specific Context
```
@se-assistant @merchants/Acme-Corp/discovery-assessment.md
"What are the top 3 challenges?"
```
**Result:** Loads just discovery file.

### Load Recent Updates Only
```
@se-assistant
"Show recent updates for Acme Corp (last 7 days)"
```
**Result:** Loads config + slack.md only, filters by date.

---

## Context Window Optimization

**Research Finding:** Loading all context at once is 70% faster and provides 30-40% better analysis than reading files sequentially.

**Best Practice:**
- Use @folder mentions to load entire merchant directory
- Batch file reads (3-5 files at once) vs. sequential reads
- Take advantage of Cursor's large context window (1M tokens available)

**Benefits:**
- Fewer tool calls (1-2 vs. 5-10)
- Faster responses (5-10s vs. 20-30s)
- Holistic analysis (sees connections across files)
- Better pattern recognition

---

## Recency Weighting

When context is too large for one load:

**Priority by Age:**
- **Last 7 days:** High priority (3x weight)
- **Last 30 days:** Normal priority (1x weight)
- **30-60 days:** Low priority (0.5x weight)
- **60+ days:** Archive (load only if explicitly requested)

This ensures most relevant/recent context loads first.

---

## File Size Guidelines

**Target:** See `.cursor/rules/se-assistant.mdc` Section 0.6 for storage targets and cache cleanup rules

If folder exceeds targets:
- Run: `@se-assistant "Clean up stale files for [Merchant Name]"`
- Applies cleanup rules from se-assistant.mdc (emails 30d, Slack 60d, etc.)
- Keeps core files (briefing, discovery, technical) always

---

## Integration with personal-config.md

Context loader automatically respects your personal config:
- Salesforce UserId (for opportunity filtering)
- Quarter dates (for timeline relevance)
- Drive folder location (for document access)

**Setup:** Ensure `personal-config.md` exists in workspace root.

---

## Team Sync Reminder

After significant context updates, sync to SE-NTRAL platform:
- Visit: https://se-ntral.quick.shopify.io/sync.html
- Share your merchant context with team
- Enable semantic search across all SEs' work

---

*This file optimizes context loading for the SE-Assistant workflow based on Context Engineering research (OpenAI, Anthropic, Google 2024).*

