# Context Priority Ranking

*Guide for intelligent context selection and loading*

**Reference:** This guide implements the caching strategy defined in `.cursor/rules/se-assistant.mdc` Section 0.6

---

## Priority Framework

This framework helps SE-Assistant determine which context to load based on the question type and available token budget.

---

## Priority Levels

### P0: Always Load (Critical Context)
**Files that should be loaded for ANY merchant question:**

1. **personal-config.md** (workspace root)
   - Your Salesforce UserId
   - Current quarter dates
   - AE names and preferences
   - Essential for accurate queries

2. **briefing-document.md** (merchant root)
   - Executive summary
   - Key stakeholders
   - Timeline and next steps
   - Core merchant overview

3. **discovery-assessment.md** (merchant root)
   - Challenges and needs (5Cs framework)
   - Current state assessment
   - EPoV readiness
   - Critical for understanding merchant

**Token Budget:** ~15-20K tokens

---

### P1: Load for Technical Questions
**When question involves technical requirements, integrations, solutions:**

4. **technical-assessment.md**
   - Current tech stack
   - Proposed solutions
   - Integration architecture
   - API strategy

5. **raw-files/config.md**
   - Salesforce opportunity link
   - Drive folder location
   - Slack channels
   - System references

**Additional Token Budget:** ~10-15K tokens

---

### P2: Load for Stakeholder/Communication Questions
**When question involves people, meetings, emails, conversations:**

6. **raw-files/slack.md**
   - Recent Slack conversations
   - Team discussions
   - Quick updates

7. **raw-files/meeting-notes/** (most recent)
   - Latest meeting transcripts
   - Action items from calls
   - Stakeholder quotes

8. **raw-files/emails/** (last 7 days only)
   - Recent email threads
   - Stakeholder communications
   - Decision points

**Additional Token Budget:** ~20-30K tokens

---

### P3: Load for Research/Deep Dive Questions
**When question requires historical context, competitive intel, deep research:**

9. **raw-files/additional-context/**
   - Competitive analysis
   - Industry research
   - Web enrichment data

10. **raw-files/key-resources/**
    - Merchant-provided documents
    - RFPs, requirement docs
    - Technical specifications

11. **raw-files/documents/**
    - Proposal drafts
    - Solution presentations
    - Technical diagrams

**Additional Token Budget:** ~30-50K tokens

---

## Recency Multiplier

Apply recency boost to context selection:

| Age | Priority Multiplier |
|-----|---------------------|
| 0-7 days | 3.0x (highest priority) |
| 8-14 days | 2.0x |
| 15-30 days | 1.0x (baseline) |
| 31-60 days | 0.5x |
| 60+ days | 0.25x (archive, load only if explicitly requested) |

**Example:**
- P2 file from 5 days ago = P2 × 3.0 = P0.67 (bumps up to near P1 priority)
- P1 file from 45 days ago = P1 × 0.5 = P1.5 (drops to near P2 priority)

---

## Context Budget Management

**Cursor Context Window:** 1M tokens (see `.cursor/rules/se-assistant.mdc` Section 0.6 for details)

**Recommended Budget Allocation:**

| Priority | Token Budget | Files |
|----------|-------------|-------|
| P0 (Always) | 15-20K | 3 files |
| P1 (Technical) | 10-15K | 2 files |
| P2 (Comms) | 20-30K | 3-5 files |
| P3 (Research) | 30-50K | Variable |
| **Reserve** | 100-200K | For response generation |

**Total Context Used:** ~100-150K tokens (leaves ample room for response and multiple merchants)

---

## Question-Type Routing

Match question intent to priority levels:

### Strategy/Overview Questions
**Examples:** "What's our biggest risk?" "Should we pursue this deal?" "Summarize the opportunity"

**Load:** P0 + P1 (briefing, discovery, technical)

---

### Technical Questions
**Examples:** "Can they integrate with X?" "What's their current tech stack?" "Validate POS hardware"

**Load:** P0 + P1 + P2:config (briefing, discovery, technical, config)

---

### Stakeholder/Communication Questions
**Examples:** "Who's the decision maker?" "What did they say about pricing?" "Recent updates?"

**Load:** P0 + P2 (briefing, discovery, slack, emails, meeting-notes)

---

### Competitive/Research Questions
**Examples:** "How do we compare to Magento?" "What's their industry position?" "Find similar deals"

**Load:** P0 + P3 (briefing, discovery, additional-context, key-resources)

---

### Call Prep Questions
**Examples:** "Prep for tomorrow's call" "What should I focus on?" "Key talking points?"

**Load:** P0 + P1 + P2 recent only (briefing, discovery, technical, slack/emails last 7 days)

---

## Degradation Strategy

If hitting token limits (rare with 1M tokens, but possible with many merchants):

**Drop in this order:**
1. P3 files (research/archives)
2. P2 older than 30 days (old emails/Slack)
3. P2 older than 14 days
4. P1 technical-assessment (if not tech question)

**NEVER drop:**
- personal-config.md (breaks queries)
- briefing-document.md (core overview)
- discovery-assessment.md (critical context)

---

## Optimization Guidelines

### DO:
✅ Batch file reads (load 3-5 files in one operation)
✅ Use @folder mentions to load entire merchant directory
✅ Apply recency multiplier to recent content
✅ Filter P2/P3 files by date before loading
✅ Load full context for complex/ambiguous questions

### DON'T:
❌ Read files sequentially one by one
❌ Load all raw-files/* without filtering
❌ Include stale content (60+ days) unless explicitly requested
❌ Load duplicate information across files
❌ Waste tokens on boilerplate/templates

---

## Performance Metrics

**Goal (Research-Backed):**
- Load time: 5-10 seconds (vs. 20-30s without optimization)
- Tool calls: 1-2 per analysis (vs. 5-10 without batching)
- Accuracy: 90-95% (vs. 60-70% with minimal context)
- Token efficiency: 100-110K used (vs. 150K+ with inefficient loading)

**Monitor:**
- Are responses comprehensive? (Load more context)
- Are responses too slow? (Reduce P3 loading)
- Missing key info? (Check priority rankings)

---

## Integration with Context Loader Guide

This priorities file works with `context-loader-guide.md`:
- **Context Loader:** Defines WHAT to load (file patterns)
- **Context Priorities:** Defines WHEN to load (priority logic)

Together they implement the context engineering strategy from `.cursor/rules/se-assistant.mdc` Section 0.6.

---

## Special Cases

### First-Time Merchant Analysis
Load everything (P0 + P1 + P2 + P3) to build comprehensive understanding.

### Weekly Check-In
Load P0 + P2 recent only (last 7 days).

### Pre-Call Prep
Load P0 + P1 + P2 (last 7 days) + most recent meeting notes.

### Post-Call Update
Load P0 + new meeting notes, update briefing/discovery as needed.

### Competitive Analysis
Load P0 + P3:additional-context + search Vault for battle cards.

---

*This priority framework is based on Context Engineering research showing that structured, prioritized context delivers 30-40% better AI responses than unfiltered context dumps.*

