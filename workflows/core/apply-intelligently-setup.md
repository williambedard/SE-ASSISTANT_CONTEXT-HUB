# Configuring "Apply Intelligently" for Agent Files

## Setup Instructions

**For each specialized agent file** (`account-manager.mdc`, `se-coach.mdc`, `solutions-architect.mdc`):

1. Open the agent file in Cursor
2. Look for the dropdown button near the top (shows "Apply Manually" currently)
3. Click the dropdown
4. Select **"Apply Intelligently"**
5. Cursor will use the agent's `description` field and content to automatically load it when relevant

## What This Does

**Before (Apply Manually):**
- Orchestrator had to explicitly call `read_file` to load agents
- More code, more control, but less elegant

**After (Apply Intelligently):**
- Cursor automatically loads agents based on semantic understanding
- Cleaner architecture, better UX
- Orchestrator validates routing (safety net)

## How It Works

1. **User query:** "New Opportunity: Acme Corp"
2. **Cursor analyzes:** Query mentions "opportunity" + Account Manager description mentions "opportunities"
3. **Cursor loads:** Account Manager agent automatically
4. **Orchestrator validates:** Confirms Account Manager is correct (or routes if needed)
5. **Agent executes:** Uses its specialized knowledge

## Benefits

- ✅ **Better UX:** No need for explicit `read_file` calls
- ✅ **Semantic Understanding:** Cursor catches edge cases we might miss
- ✅ **Still Token Efficient:** Only loads when relevant
- ✅ **Cleaner Code:** Less explicit routing code needed
- ✅ **Safety Net:** Orchestrator still validates routing

## Testing

After setting "Apply Intelligently" for all 3 agents, test with:

- "New Opportunity: TestCo" → Should load Account Manager
- "Give me feedback on this call" → Should load SE Coach
- "Design architecture for Mixbook" → Should load Solutions Architect

If agents don't load intelligently, orchestrator will still route correctly as fallback.

