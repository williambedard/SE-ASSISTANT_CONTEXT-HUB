# Opportunity Prioritization Framework

**Purpose:** Scoring formula and tier classification for opportunity focus management

**Last Updated:** October 24, 2025

---

## Priority Score Formula

```
Priority Score = Revenue Points + (Close Probability × 2) + Urgency Points
```

**Range:** 4-16 points  
**Higher score = Higher priority**

---

## Revenue Points

Based on `Total_Revenue__c` field from Salesforce opportunities:

| Annual Revenue | Points |
|----------------|--------|
| $5M+ | 10 |
| $2M - $5M | 8 |
| $1M - $2M | 6 |
| $500K - $1M | 4 |
| $100K - $500K | 2 |
| < $100K | 1 |

**Why revenue matters:** Larger deals = larger quota impact = higher priority

---

## Close Probability Points (Doubled)

Based on `Close_Probability__c` field from Salesforce opportunities:

| Probability | Base Points | Multiplied × 2 | Final Points |
|-------------|-------------|----------------|--------------|
| Very High (90%+) | 3 | × 2 | 6 |
| High (70-90%) | 2 | × 2 | 4 |
| Low (40-70%) | 1 | × 2 | 2 |
| Very Low (<40%) | 0.5 | × 2 | 1 |

**Why probability matters:** High-probability deals deserve more focus than wishful thinking

**Why doubled:** Close probability is the strongest predictor of whether you'll hit quota this quarter

---

## Urgency Points

Based on `CloseDate` field from Salesforce opportunities:

| Timeframe | Points |
|-----------|--------|
| Closes this week | +4 |
| Closes this month | +2 |
| Closes next month | +1 |
| Closes later this quarter | 0 |

**Why urgency matters:** Deals closing soon need immediate attention to prevent slippage

---

## Tier Classification

| Tier | Score Range | Focus % | Label |
|------|-------------|---------|-------|
| **Tier 1** | 12-16 | 60% | Hot 🔥 |
| **Tier 2** | 8-11 | 30% | Warm 🟡 |
| **Tier 3** | 4-7 | 10% | Watch 👀 |
| **Pipeline** | <4 | Minimal | Pipeline 📋 |

### Tier 1: Hot 🔥 (Score 12-16)
**Characteristics:**
- High revenue + High probability, OR
- Medium revenue + Very high probability + Closing soon

**Focus:** 60% of SE time
- Daily engagement
- Proactive risk mitigation
- Close monitoring
- Frequent touchpoints

**Examples:**
- $2M deal, High probability (70%), Closes this month = 8 + 4 + 2 = 14 points
- $6M deal, High probability (70%), Closes next month = 10 + 4 + 1 = 15 points

---

### Tier 2: Warm 🟡 (Score 8-11)
**Characteristics:**
- Medium revenue + Medium probability, OR
- High revenue + Low probability, OR
- Lower revenue but high probability + urgency

**Focus:** 30% of SE time
- Weekly check-ins
- Maintain momentum
- Monitor for promotion to Tier 1
- Address blockers as they arise

**Examples:**
- $1.5M deal, High probability (70%), Closes later = 6 + 4 + 0 = 10 points
- $500K deal, Very High probability (90%), Closes this month = 4 + 6 + 2 = 12 points → Actually Tier 1!

---

### Tier 3: Watch 👀 (Score 4-7)
**Characteristics:**
- Low revenue + Low probability
- High revenue but very low probability
- Far-future close dates

**Focus:** 10% of SE time
- Monthly check-ins
- Reassess quarterly
- Consider disqualifying if no movement
- Minimal proactive engagement

**Examples:**
- $500K deal, Very Low probability (30%), Closes later = 4 + 1 + 0 = 5 points
- $2M deal, Very Low probability (30%), Closes later = 8 + 1 + 0 = 9 points → Actually Tier 2

---

## Special Considerations

### "Committed - At Risk" Status ⚠️
**Even if high score, requires immediate attention:**
- These were committed deals showing warning signs
- Risk of slippage or loss
- Investigate root cause
- Address blockers immediately
- May need AE escalation

**Action:** Flag these prominently in dashboard regardless of tier

---

### "Uncommitted" Status with Near Close Date ⏸️
**Red flag combination:**
- Deal closing soon (this week/month)
- Still marked "Uncommitted"
- Mismatch = forecast risk

**Action:** Get verbal/written commitment before close date, or push close date

---

### Stage vs Score Mismatch
**Watch for:**
- Deal Craft stage + Low probability = stalled?
- Envision stage + "At Risk" = very early problem
- Solution stage + Very High probability = unusually fast (validate)

**Action:** Investigate mismatches, may indicate data quality issues

---

## Usage in SE Workflows

### Daily: "What should I focus on TODAY?"
1. Query Salesforce for current quarter opportunities (filter by Primary SE)
2. Calculate priority scores using this formula
3. Generate Tier 1 list
4. Highlight deals closing THIS WEEK
5. Flag "Committed - At Risk" deals
6. Start work on highest priority

**Time:** 2-5 minutes

---

### Weekly: "Update my priorities"
1. Query Salesforce for all current quarter opportunities
2. Recalculate all priority scores
3. Identify promotions/demotions between tiers
4. Review Tier 2 deals for promotion opportunities
5. Check Tier 3 for disqualification candidates
6. Update Current-Q-Priority-Dashboard.md

**Time:** 5-10 minutes

---

### Monthly: "Re-prioritize everything"
1. Query Salesforce for all opportunities (current + next quarter)
2. Recalculate ALL priority scores
3. Update all merchant profiles with new scores
4. Generate fresh Current-Q-Priority-Dashboard.md
5. Report significant changes to manager
6. Disqualify stalled Tier 3 deals (no movement in 90 days)

**Time:** 10-15 minutes

---

## Example Calculations

### Example 1: Large, High-Probability Deal Closing Soon
- Revenue: $6.19M → 10 points
- Probability: High (75%) → 4 points
- Urgency: Closes this week → 4 points
- **Total: 18 points → Tier 1 (Hot 🔥)**
- **Focus:** URGENT - Close NOW

---

### Example 2: Medium Deal, Very High Probability, Committed
- Revenue: $1.41M → 6 points
- Probability: Very High (90%) → 6 points
- Urgency: Closes next month → 1 point
- **Total: 13 points → Tier 1 (Hot 🔥)**
- **Focus:** Maintain momentum, close early

---

### Example 3: Large Deal, Low Probability, Far Close
- Revenue: $2.27M → 8 points
- Probability: Very Low (30%) → 1 point
- Urgency: Closes later → 0 points
- **Total: 9 points → Tier 2 (Warm 🟡)**
- **Focus:** Reassess qualification, consider disqualifying if no movement

---

### Example 4: Small Deal, Low Probability
- Revenue: $213K → 2 points
- Probability: Low (50%) → 2 points
- Urgency: Closes later → 0 points
- **Total: 4 points → Tier 3 (Watch 👀)**
- **Focus:** Minimal engagement, monthly check-ins only

---

## Salesforce Fields Reference

**Required fields for priority calculation:**
- `Total_Revenue__c` - Annual revenue (Shopify quota field)
- `Close_Probability__c` - Probability percentage
- `CloseDate` - Target close date
- `Primary__c` - Boolean (filter to Primary SE only)
- `RecordType.Name` - Filter to 'Sales' record type

**Optional fields for context:**
- `StageName` - Current stage (Envision → Demonstrate → Solution → Deal Craft)
- `Merchant_Intent__c` - Intent status (Uncommitted → Committed → At Risk)
- `Account.Name` - Merchant name
- `Owner.Name` - AE name

---

## Dashboard Format Reference

When generating `Current-Q-Priority-Dashboard.md`, use this structure:

```markdown
# Q4 2025 Priority Dashboard

**Last Updated:** [Date]
**Q4 Opportunities:** [Count]
**Q4 Pipeline:** $[Total]M

---

## 🔥 TIER 1: HOT (Focus 60% Time)

**[Count] opportunities | $[Total]M Q4 pipeline**

### 1. [Merchant Name] - Score [Score] ⭐ [CLOSES THIS WEEK if applicable]
- **Revenue:** $[Amount] | **Probability:** [Level] | **Close:** [Date]
- **Stage:** [Stage] | **Intent:** [Intent Status]
- **Why HOT:** [Reason for high score]
- **Action:** [Next step]

[Continue for all Tier 1 opps]

---

## 🟡 TIER 2: WARM (Focus 30% Time)
[Same format]

---

## 👀 TIER 3: WATCH (Focus 10% Time)
[Same format]

---

## 📅 This Week's Focus
- ⚡ URGENT - Closing THIS WEEK: [List]
- ⚠️ Risk Mitigation: [Committed - At Risk deals]
- 📊 Time Allocation: 60% Tier 1, 30% Tier 2, 10% Tier 3
```

---

## Best Practices

### Do:
- ✅ Re-calculate scores monthly (mid-month recommended)
- ✅ Update dashboard weekly for Tier 1 deals
- ✅ Focus 60% time on Tier 1 regardless of tier count
- ✅ Investigate "Committed - At Risk" status immediately
- ✅ Disqualify stalled Tier 3 deals (no movement in 90 days)

### Don't:
- ❌ Spend equal time on all opportunities
- ❌ Let Tier 3 deals consume Tier 1 time
- ❌ Ignore close date urgency
- ❌ Forget to filter by Primary SE (or you'll see other SEs' deals)
- ❌ Use `Amount` field (use `Total_Revenue__c` instead)

---

## Integration with SE-NTRAL

This framework integrates with SE-NTRAL's comprehensive SE rules:
- Discovery frameworks (5Cs, EPoV, 6-Box) inform probability assessment
- Technical assessment workflows support high-priority deals
- MCP integration (revenue-mcp) provides Salesforce data
- Merchant folders track detailed engagement history

**See:** `.cursor/rules/se-assistant.mdc` for implementation details

---

**Questions?** Update this framework based on your quarterly retrospectives and team feedback.

