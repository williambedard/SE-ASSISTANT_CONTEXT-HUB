# Chaparral Motorsports - Technical Assessment Summary

**Last Updated**: October 27, 2025  
**Discovery Call**: October 16, 2025  
**Demo Scheduled**: Week of Oct 27, Tuesday 10 AM PT  
**NotebookLM**: https://notebooklm.google.com/notebook/9300b15c-66cc-417a-84ea-6f30efb046f2

> 📄 **See detailed technical assessment**: `/raw-files/documents/technical-assessment.md`

---

## Executive Summary

Chaparral Motorsports is a $7-10M motorsports parts retailer evaluating Shopify Plus to replace their custom platform. Primary driver: **organizational risk from developer dependency**. Not urgent (no deadline), but strong fit. Demo scheduled to prove YMM fitment capabilities and 1.4M SKU performance.

**Key Opportunity**: Replace brittle custom stack with Shopify's automotive-proven ecosystem while keeping best-in-class tools (Klaviyo, Algolia, Signifyd).

---

## Current Platform & Pain Points

### Platform
- **Custom-built website** (tedious to maintain/update)
- **PHP POS** (on-premise, 3 months old, team happy)
- **Braintree payments** (~2.1%, no contract)

### Critical Pain Points
1. **Organizational Risk** ⚠️
   - Heavy dependency on 1-2 developers who know custom system
   - Difficult to bring new developers up to speed
   - Knowledge transfer risk if developers leave
   
2. **Integration Complexity** ⚠️
   - Partner apps require "a lot of lift" to integrate
   - Each integration needs custom development
   - Expensive vs. Shopify's pre-built ecosystem

3. **Developer Backlog** ⚠️
   - Long ticket queue for website changes
   - Business users can't make quick updates
   - Slow response to market opportunities

---

## Business Requirements & Shopify Solutions

### 1. Year/Make/Model Fitment ⭐ CRITICAL
**Current**: ARI's PartSmart API integration  
**Challenge**: 1.4M OEM parts SKUs with schematics viewer  
**User Flow**: Select Y/M/M → View schematic hot spots → Add parts to cart

**Shopify Solution**:
- API-first platform supports external fitment databases
- Metafields/metaobjects extend product data models
- Partner-built YMM tools for automotive
- Can load all SKUs or use external database with API
- Custom fields available through API for app integrations

**Demo Focus**: Show backend of YMM functionality, comparable automotive merchants

---

### 2. Freight Shipping 🚛
**Challenge**: Large packages requiring LTL/freight  
**Current**: FedEx, USPS for standard parcels

**Shopify Solution**:
- **Shopify Shipping**: Negotiated rates with major carriers (standard parcels)
- **ETL App**: Integrates 35+ freight providers for LTL
- Can use Shopify rates or merchant's negotiated rates (whichever better)
- Draft order workflow alternative for manual freight quotes

---

### 3. Buy Now, Pay Later 💳
**Goal**: Expand BNPL options beyond current offerings

**Shopify Solutions**:
- Shop Pay Installments (native with Shopify Payments)
- Klarna, Afterpay, Affirm, Sezzle
- **Katapult** (recommended for automotive)
- Apple Pay, Google Pay (accelerated checkout)

**Value**: ~5% conversion uplift from payment innovation

---

## Tech Stack & Integration Strategy

### ✅ First-Party Integrations (Strong)
| System | Provider | Integration | Status |
|--------|----------|-------------|--------|
| **ERP** | Acumatica | First-party | ✅ Available (Shopify partner) |
| **Email** | Klaviyo | First-party | ✅ Available |
| **Search** | Algolia | First-party | ✅ Available (want to keep) |
| **Tax** | Avalara | First-party | ✅ Available |
| **Reviews** | TurnTo | First-party | ✅ Available |
| **Fraud** | Signifyd | Built-in | ✅ Keep (insurance critical) |
| **Analytics** | Google Analytics | Included | ✅ Standard |

### ⚠️ Verification Required
| System | Provider | Challenge | Action |
|--------|----------|-----------|--------|
| **PIM** | Perfion | On-premise version | Verify API endpoints |
| **POS** | PHP POS | On-premise version | Verify API endpoints |
| **Marketplace** | Channel Advisor | Complex data | Use Dcopify middleware |
| **Fitment** | ARI's PartSmart | API integration | Confirm Shopify method |

### 🔧 Custom/Partner Solutions Needed
- **YMM Tools**: Partner-built automotive fitment apps
- **Freight**: ETL or similar for LTL shipping
- **Schematics**: Embedded viewer with cart API

---

## Integration Deep-Dive

### Acumatica ERP (⚠️ Pain Point, ✅ Solution Available)
**Current Pain**:
- Poor support (30-60 day ticket responses)
- VAR lacks technical expertise
- Performance issues unaddressed
- Self-hosting due to cloud problems

**Shopify Advantage**:
- First-party integration (Shopify-Acumatica partnership)
- Can leverage relationship for smoother integration
- One-way sync for inventory/products ideal
- May provide better support through partnership

**Future**: Crystal wishes to move ERPs but no appetite for another migration

---

### Channel Advisor (✅ Keep, Use Middleware)
**Current**: Very satisfied, only complaint is cost  
**Function**: Marketplace product + order management

**Strategy**: Use **Dcopify middleware**
- Integrates Channel Advisor ↔ Shopify
- Better for complex/technical product data vs. Marketplace Connect
- Handles both product information + order flow

---

### Signifyd Fraud Protection (✅ CRITICAL - Keep)
**Why Critical**:
- Significant fraud history (bad credit cards, call center)
- Provides **insurance** on all orders
- Manages chargebacks ("Such a waste of time to fight them")

**Shopify Integration**: Built into platform  
**Recommendation**: Keep (more sophisticated than Shopify's native fraud detection)

---

## Key Stakeholder

**Crystal Ashby** - VP of Operations & Marketing
- Primary POC and decision maker
- Evaluating solo initially (avoiding developer bias)
- Owns: ecommerce ops, marketing, platform decision
- Email: cashby@chaparralmotorsports.com

**Evaluation Approach**:
- Not urgent, exploring if Shopify is better than custom
- No hard deadline
- Would migrate post-peak season (after June)

---

## Next Steps & Pre-Demo Actions

### Demo Preparation (Week of Oct 27, Tuesday 10 AM PT)
**Duration**: 1.5 hours  
**Focus**: Year/Make/Model backend functionality

**William's Tasks**:
- [ ] Explore Dcopify for Channel Advisor integration
- [ ] Add Perfion integration docs to shared sheet
- [ ] Verify Perfion on-premise API compatibility
- [ ] Verify PHP POS on-premise API compatibility
- [ ] Prepare YMM demo (partner examples or replicate Chaparral product)

**Sarah's Tasks**:
- [ ] Share automotive merchant case studies
- [ ] Send comprehensive BNPL provider list
- [ ] Share conversion uplift data (Shopify Payments)

**Crystal's Tasks**:
- [ ] Review mutual plan document
- [ ] Explore pricing calculator
- [ ] Provide 3-month Braintree statements (if pursuing rate negotiation)

---

## Success Criteria for Demo

1. ✅ Prove YMM fitment works at scale (1.4M SKUs)
2. ✅ Show backend of how automotive tools are configured
3. ✅ Demonstrate comparable merchant examples
4. ✅ Address organizational risk (business user empowerment)
5. ✅ Show integration ecosystem advantage
6. ✅ Explain conversion uplift (5% from payments innovation)

---

## Risk Assessment & Mitigation

### Strengths (Green Flags) ✅
- Tech stack highly compatible with Shopify
- Clear pain points (developer dependency, integrations)
- No contracts (Braintree easy to switch)
- Decision maker engaged
- Previous Shopify interest (April 2024)
- Demo scheduled
- Using best-in-class apps already

### Challenges (Yellow Flags) ⚠️
- Not urgent (no hard deadline)
- Complex requirements (1.4M SKUs, freight, schematics)
- Acumatica pain (but Shopify has partnership)
- Two on-premise systems need API verification
- Small rate gap (Braintree 2.1% vs Shopify 2.25%)
- Would delay launch until post-June
- Partner hesitancy from past experiences

### Mitigation Strategy
1. **Demo Excellence**: Prove YMM + performance capabilities
2. **Integration Verification**: Confirm all APIs pre-demo
3. **Partner Introduction**: Automotive specialist (Firesite)
4. **Conversion Story**: Show 5% uplift data
5. **Risk Emphasis**: Developer dependency → platform knowledge
6. **TCO Analysis**: Platform fees vs. hosting + dev + maintenance

---

## Probability & Timeline Assessment

**Current Stage**: Demonstrate  
**Close Probability**: Medium (shows strong engagement despite "Very Low" in SFDC)  
**Deal Size**: $82,800 (Plus + Payments)  
**Timeline**: Q1-Q2 2026 launch (post-peak season)

**Key Milestone**: Demo week of Oct 27 will determine next stage advancement

---

## Related Documents
- [Detailed Technical Assessment](raw-files/documents/technical-assessment.md)
- [Technical Requirements Summary](raw-files/documents/technical-requirements-summary.md)
- [Discovery Assessment](discovery-assessment.md)
- [Briefing Document](briefing-document.md)
- [Discovery Call Notes](raw-files/meeting-notes/2025-10-16-discovery-call.md)
