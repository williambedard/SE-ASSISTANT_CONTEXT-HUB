# SE-NTRAL Demo Script

*Step-by-step walkthrough with screenshots and talking points*  
*Duration: 3-5 minutes (keep it tight!)*

---

## Demo Overview

**Purpose:** Show SE-NTRAL in action with real workspace and real merchants  
**Format:** Conceptual walkthrough + short live demo (if time)  
**Key Message:** "This isn't vapor. This is working code. Right now."

---

## Pre-Demo Setup (DO THIS BEFORE PRESENTATION)

### Technical Checklist:

- [ ] **Open Cursor** with SE-NTRAL workspace
- [ ] **Navigate to merchants/ folder** (show 18 merchant folders)
- [ ] **Have one merchant folder open** (Mixbook recommended - most complete)
- [ ] **Have Current-Q-Priority-Dashboard.md open** in a tab
- [ ] **Test @se-assistant command** to ensure it works
- [ ] **Close unnecessary tabs** (clean workspace for demo)
- [ ] **Increase font size** in Cursor for visibility (Cmd/Ctrl + +)
- [ ] **Test screen sharing** to ensure it's clear
- [ ] **Have backup screenshots** in case live demo fails

### Mental Prep:

- Know exactly what you'll show (practice once)
- Have talking points memorized
- Be ready to skip demo if time is tight
- Have confidence: "This works. Watch."

---

## Demo Script - Conceptual Walkthrough (Slides 14-16)

**If you're NOT doing a live demo, use this section with slides.**

---

### Part 1: Create New Merchant (Slide 14 - Part 1)

**On screen:** Show slide with command and bullet points

**Script:**

"Let me walk you through what happens when you create a new merchant. The command is simple:"

```
@se-assistant "New Opportunity: Acme Corp"
```

"And here's what happens over the next 2-3 minutes:"

[Read through each step, emphasizing the automation]

"1. **Creates folder structure** - merchants/Acme-Corp/ with all subfolders automatically

2. **Queries Salesforce** - Pulls opportunity data (revenue, close date, stage, probability) and account data (industry, GMV, locations)

3. **Searches Gmail** - Finds email threads using company name and domain patterns

4. **Searches Slack** - Discovers team conversations mentioning this merchant

5. **Searches Google Drive** - Locates presentations, notes, and technical docs

6. **Runs external research** - Web search plus company enrichment API for business intelligence

7. **Generates briefing-document.md** - Executive summary with stakeholders, timeline, and challenges

8. **Stores all context** - Emails, meeting notes, documents organized in raw-files/"

**Pause for effect**

"At the end of this, you have a complete merchant folder. Before your first discovery call, you already have:
- Company overview and business intelligence
- Stakeholder list with contact information  
- Email threads with full context
- Meeting notes if there were any
- Competitive landscape research
- Links to all internal tools in Salesforce, Slack, and Drive"

**Key Point:**

"This is 2-3 minutes of automation replacing 2-3 hours of manual research. And critically—it's more complete than manual research. The AI searches 7 systems simultaneously. You'd never check all these sources manually."

---

### Part 2: Update Priority Dashboard (Slide 14 - Part 2)

**On screen:** Show slide with command and bullet points

**Script:**

"The second command is even faster. Watch this:"

```
@se-assistant "Update my priority dashboard"
```

"This one takes 5 seconds total:"

[Read through steps quickly to emphasize speed]

"1. **Reads personal-config.md** - Knows your Salesforce UserId (so it only queries YOUR opportunities, not other SEs')

2. **Queries Salesforce** - Pulls all your opportunities for the current quarter

3. **Calculates priority scores** - Revenue points + (Close Probability × 2) + Urgency points

4. **Classifies into tiers** - Tier 1 (Hot 🔥), Tier 2 (Warm 🟡), Tier 3 (Watch 👀)

5. **Generates dashboard** - Current-Q-Priority-Dashboard.md with this week's focus, risk flags, time allocation"

**Pause**

"Time: 5 seconds. And now you have a complete view of where to focus your energy."

**Make the comparison:**

"Without this? You'd spend 30 minutes in Salesforce manually reviewing opportunities, doing mental math on priorities, trying to figure out what matters most."

"With this? 5 seconds. And you have a better, more objective answer."

---

### Part 3: Show Real Dashboard Output (Slide 15)

**On screen:** Show slide with excerpt from Current-Q-Priority-Dashboard.md

**Script:**

"This is my actual priority dashboard. Generated in those 5 seconds."

[Point to key sections on slide]

"At the top: Executive summary. 18 opportunities tracked. 6 high priority, 5 medium priority, 7 low priority."

"Then Tier 1: Hot deals. These are my 🔥 priorities, getting 60% of my time."

[Point to Mixbook example]

"Mixbook: $6.2M deal, highest priority score of 15. Weekly calls established. MVF submitted October 6th. Closing November 21st."

"Notice the detail level:
- Last activity date (October 22)
- Salesloft touchpoints tracked (15+ in Q4)
- Why it's high priority (largest deal, weekly cadence, strong alignment)
- Specific next steps (API docs from Anatoli, weekly touchbase continues)"

**Emphasize the insight:**

"All of this was pulled from Salesforce, emails, and Slack. Then scored objectively. Then classified into tiers with explicit time allocation."

"This dashboard tells me exactly where to focus. No guesswork. No 'hmm, I should probably check on this deal.' The scoring is objective. The guidance is explicit."

---

### Part 4: Show Real Merchant Folder (Slide 16)

**On screen:** Show slide with Mixbook folder structure

**Script:**

"Now let me show you what a merchant folder actually contains. This is Mixbook:"

[Point to each section]

**Core files:**

"briefing-document.md: 4,200 words. Always current. Updated after every call, every email, every decision. Contains:
- Executive summary for quick refresh
- Merchant overview with GMV, locations, business model
- Stakeholder list with roles and contact info
- Timeline of engagement with next steps
- Outstanding actions with owners"

"discovery-assessment.md: 5Cs framework documenting their buying journey. Circumstance, Challenge, Consequence, Change Positive, Closing requirements."

"technical-assessment.md: Full solution architecture when we get to that stage. Current tech stack, proposed Shopify solution, integration blueprint, migration considerations, risk assessment."

**Raw files:**

"Then raw-files/ where all supporting context lives:
- emails/: 23 email threads from the last 30 days
- meeting-notes/: 8 call transcripts with TLDR summaries and sentiment
- documents/: 5 Google Drive docs including MVF and technical specs
- additional-context/: Business intelligence and competitive analysis
- config.md: Direct links to Salesforce opportunity, Slack channels, Drive folders"

**The revelation:**

[Slow down here, make it sink in]

"All of this context is instantly searchable. I can @-reference this folder in Cursor, and AI has access to everything. Every email. Every meeting note. Every decision. Every detail."

[Pause]

"When I switch to this merchant, I'm not starting from zero. I have complete context. I know what happened last week, last month, three months ago."

"And when I switch away to another merchant? I don't lose anything. It's all right here. Persistent. Permanent. Perfect recall."

---

## Demo Script - Live Walkthrough (If Time Allows)

**If you have 3-5 minutes, do this live demo after the conceptual walkthrough.**

---

### Setup Transition

**Script:**

"Alright, I have a few minutes. Let me show you this live."

[Share screen]

"This is my actual SE-NTRAL workspace in Cursor right now. Real merchants, real data."

---

### Demo Step 1: Show Workspace Structure (60 seconds)

**Action:** Navigate to merchants/ folder

**On screen:** Show merchants/ folder with 18 merchant folders

**Script:**

"Here's my merchants folder. 18 folders, one per merchant:"

[Scroll through list, point out a few names]

"Mixbook, Cueros Velez, DAZ 3D, Gosselin Photo Video... each one is a complete context capsule."

**Action:** Click into Mixbook folder

**On screen:** Show Mixbook folder contents

"Let's open Mixbook. Here's the structure:"

[Point to each file]

"briefing-document, discovery-assessment, technical-assessment at the root level. Then raw-files/ with all the supporting context."

**Action:** Open briefing-document.md

**On screen:** Show first page of briefing document

[Scroll slowly through document]

"4,200 words of context. Executive summary at the top. Merchant overview with business intelligence. Stakeholder list with 8 people. Timeline of all interactions. Outstanding actions with specific next steps."

**Key Point:**

"This updates automatically. Every time I learn something new, this document gets better."

---

### Demo Step 2: Show @se-assistant Command (90 seconds)

**Action:** Open new Cursor chat, type command

**On screen:** Show Cursor chat interface

**Script:**

"Now let me show you a command. I'm going to ask: 'What should I focus on this week?'"

[Type slowly so audience can read]

```
@se-assistant "What should I focus on this week?"
```

[Press Enter]

**While it's processing:**

"Behind the scenes, AI is:
- Reading my personal-config for my UserId
- Querying Salesforce for my opportunities
- Calculating priority scores
- Classifying into tiers
- Generating recommendations"

**On screen:** Show response with tiered list

[Scroll through response]

"5 seconds later, here's my answer:"

[Point to key sections]

"Tier 1 deals: Mixbook at the top, score of 15. Cueros Velez score of 13. These are my hot deals getting 60% of my time.

Tier 2 deals: Warm opportunities getting 30% of my time.

Tier 3 deals: Watch status, 10% of my time.

Plus this week's focus: Deals closing this week flagged. Risk alerts for committed deals showing warning signs."

**Key Point:**

"This entire analysis—querying Salesforce, calculating scores, generating tiers—took 5 seconds. Manual Salesforce review would have taken 30 minutes."

---

### Demo Step 3: Show Generated Dashboard (60 seconds)

**Action:** Open Current-Q-Priority-Dashboard.md

**On screen:** Show full dashboard file

**Script:**

"And here's the full dashboard that command generated."

[Scroll through document]

"Top section: Executive summary with counts and stats.

Tier 1 section: 6 hot opportunities with full details. Revenue, probability, close date, stage, why they're hot, what's next.

Tier 2 section: 5 warm opportunities with same level of detail.

Tier 3 section: Watch status deals.

Bottom section: This week's focus with specific action items."

**Key Point:**

"This dashboard is auto-generated from live Salesforce data. Every time I run that command, it recalculates based on current opportunity status. My priorities are always current."

---

### Demo Step 4: Show Context Retrieval (60 seconds, if time)

**Action:** Type new command in Cursor chat

**On screen:** Cursor chat interface

**Script:**

"One more quick example. Let me ask about specific merchant context:"

[Type command]

```
@se-assistant "Show me latest context for Mixbook"
```

[Press Enter]

**While processing:**

"AI is now:
- Reading briefing-document.md for current status
- Scanning recent emails for new threads
- Checking Slack summary for team conversations
- Reviewing meeting notes for latest decisions
- Synthesizing into a summary"

**On screen:** Show AI response

[Scroll through, highlight key points]

"10 seconds later, complete summary:
- Current status and stage
- Latest interactions (weekly call October 22)
- Outstanding action items (API docs pending)
- Next steps (continue weekly cadence)
- Risk assessment (none - deal tracking well)"

**Make the comparison:**

"Without SE-NTRAL? I'd spend 10-15 minutes hunting through Salesforce, Gmail, Slack, Drive to piece this together.

With SE-NTRAL? 10 seconds. And I have the complete picture."

---

### Demo Wrap-Up (30 seconds)

**Script:**

"That's SE-NTRAL in action. Real workspace, real merchants, real time savings."

[Stop screen share]

"Any questions about what you just saw?"

---

## Demo Backup Plan (If Live Demo Fails)

**If technical issues occur during live demo:**

**Script:**

"Alright, looks like the demo gods aren't with me today. But that's fine—I have screenshots."

[Pull up presentation-deck.md slides 15-16]

"Here's what I wanted to show you: [Continue with conceptual walkthrough]"

**Key Point:**

"The good news is the system is rock solid. I use it every day. Technical glitches happen in demos, not in real work. Happy to show anyone individually after the presentation."

---

## Screenshots to Prepare (Do Before Presentation)

### Screenshot 1: Merchants Folder View
- Show merchants/ folder with all 18 merchant folders visible
- Highlight folder structure and naming convention
- **File:** `screenshots/01-merchants-folder.png`

### Screenshot 2: Merchant Folder Contents
- Show Mixbook folder with core files and raw-files/ visible
- Clear file structure with briefing/discovery/technical at root
- **File:** `screenshots/02-merchant-folder-structure.png`

### Screenshot 3: Briefing Document
- Show first page of briefing-document.md
- Highlight Executive Summary and Merchant Overview sections
- **File:** `screenshots/03-briefing-document.png`

### Screenshot 4: Cursor Chat - Priority Question
- Show @se-assistant command: "What should I focus on this week?"
- Show response with tiered list
- **File:** `screenshots/04-priority-command.png`

### Screenshot 5: Priority Dashboard
- Show Current-Q-Priority-Dashboard.md full file
- Highlight Tier 1 section with Mixbook at top
- **File:** `screenshots/05-priority-dashboard.png`

### Screenshot 6: Context Retrieval
- Show @se-assistant command: "Show me latest context for Mixbook"
- Show response with summarized context
- **File:** `screenshots/06-context-retrieval.png`

---

## Common Demo Issues & Solutions

### Issue 1: MCP Authentication Error

**Symptom:** "@se-assistant command returns auth error"

**Solution:**
- Have backup screenshots ready
- Say: "Looks like I need to re-auth. That happens sometimes. Here's what it would show..."
- Use screenshots to continue demo
- Offer to demo individually later

### Issue 2: Slow Response Time

**Symptom:** "AI taking longer than expected to respond"

**Solution:**
- Fill dead air: "While that's processing, let me explain what's happening..."
- Walk through the behind-the-scenes steps
- If > 30 seconds, cancel and use screenshots
- Say: "Network must be slow today. Normally this is instant."

### Issue 3: Unexpected Response

**Symptom:** "AI response doesn't match expectation"

**Solution:**
- Roll with it: "Great example of how it adapts to current data..."
- Highlight whatever is useful in the response
- Transition to screenshots for cleaner example
- Never apologize excessively

### Issue 4: Screen Share Issues

**Symptom:** "Audience can't see screen clearly"

**Solution:**
- Ask: "Can everyone see this? Should I make it bigger?"
- Increase Cursor font size (Cmd/Ctrl + +)
- If still unclear, switch to presentation slides
- Use slide deck screenshots instead

---

## Demo Do's and Don'ts

### DO:

✅ **Practice once before presentation** - Know exactly what you'll show  
✅ **Keep it tight** - 3-5 minutes max, no tangents  
✅ **Narrate as you go** - Don't leave dead air  
✅ **Highlight key points** - "Notice how..." "See here..."  
✅ **Make comparisons** - "Without this? With this?"  
✅ **Have backup screenshots** - Always have a plan B  
✅ **End confidently** - "That's SE-NTRAL in action"  

### DON'T:

❌ **Don't wing it** - Know what you'll show  
❌ **Don't troubleshoot live** - If it breaks, move on  
❌ **Don't apologize excessively** - Brief acknowledgment, then continue  
❌ **Don't go off-script** - Stick to the planned demo  
❌ **Don't assume everyone can see** - Increase font size  
❌ **Don't rush** - Speak clearly, pause for key points  
❌ **Don't oversell** - Let the demo speak for itself  

---

## Post-Demo Transition

**After demo, transition back to slides:**

**Script:**

"Alright, that's SE-NTRAL in action. Now let's talk about what this means for you..."

[Advance to Slide 17: The Magic Moment]

---

## Demo Alternative: Recorded Walkthrough

**If you're not comfortable with live demo, pre-record it:**

### Recording Checklist:

- [ ] Record screen + audio walkthrough (3-5 minutes)
- [ ] Follow demo script exactly
- [ ] Edit out any mistakes or dead time
- [ ] Add captions for key points
- [ ] Test playback on presentation computer
- [ ] Have video file ready to play during presentation
- [ ] Know how to pause/resume if needed

### During Presentation:

"Let me show you a quick recorded walkthrough. This is the same demo I would have done live, just pre-recorded for consistency."

[Play video]

[Pause at key points if needed to add commentary]

---

## Key Talking Points to Hit in Demo

**No matter which format you use, make sure to emphasize:**

1. **"This is real."** - Not mockups, not prototypes, working code
2. **"18 merchants."** - Not just one demo merchant, actual workload
3. **"5 seconds."** - Speed is shocking, emphasize it
4. **"Complete context."** - Everything in one place, nothing forgotten
5. **"Auto-generated."** - Minimal manual effort, maximum value
6. **"You can try this today."** - Removing the barrier to adoption

---

## Demo Success Metrics

**You know the demo was successful if:**

- ✅ Audience leans forward to see screen (engagement)
- ✅ Audible reactions ("Wow," "That's fast") (impact)
- ✅ Questions about how it works (interest)
- ✅ Questions about getting access (urgency)
- ✅ Side conversations during demo (social proof)

---

## Final Demo Reminder

**The demo isn't about showing off. It's about proof.**

The message is: "This works. Right now. You can use it today."

Keep it simple. Keep it tight. Show the magic. Move on.

---

**You've got this. The demo will land. Trust the system.** 🎯

