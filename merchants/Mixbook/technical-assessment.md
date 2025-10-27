# Mixbook - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Notebook LM**: https://notebooklm.google.com/notebook/1c442df1-9cc8-45bb-be75-f58260f75069

## Executive Summary

Mixbook ($80M/year online transactions) is evaluating migration from bespoke platform to Shopify Plus. Evaluation driven by CMO O'Neal Rowe (former Rugs USA, Shopify champion) and Sr. Dir Ecomm Arly Bauer (also from Rugs USA). Engineering investigation phase Q3-Q4 2025, targeting January 2027 go-live.

## Business Context

**Annual Revenue**: $80M/year online transactions (~<10% B2B offline)  
**Product**: Photo books, personalized gifts (1 billion+ possible SKU combinations)  
**Current Platform**: Completely bespoke on AWS (7 years+)  
**Evaluation Options**: Shopify Plus or status quo (no other platforms being considered)

**Internal Team**: Most engineers based in Moldova (potential for headcount optimization/redistribution with Shopify)

## Stakeholder Dynamics

### Champions
**O'Neal Rowe** - CMO (1 year, previously Rugs USA)  
- **OBSESSED WITH SHOPIFY**
- Primary catalyst for evaluation
- Has Shopify partner agency contacts

**Arly Bauer** - Sr. Dir Ecomm (7 months, previously Rugs USA - big Plus client)  
- Potential catalyst for evaluation
- Previous Shopify Plus experience

### Skeptics
**Chris Rudow** - Group Ecomm Project Manager  
- Has hesitations (key blocker)
- No professional Shopify experience
- Top-down request (not personally motivated)
- Going on paternity leave August 8 for 2 months

### Decision-Makers
**David Newhoff** - Chief Product Officer (4 years, very eager to evaluate)  
**DJ Charles** - CTO (3 years)  
**CEO, CFO** - Final approval required

## Current Technical Stack

**Platform**: Bespoke AWS infrastructure (7+ years)  
**Payment**: Stripe (considering Shopify Payments)  
**Search**: Algolia  
**Reviews**: Trustpilot/Bazaarvoice  
**Email**: Iterable  
**Analytics**: GA4, Segment  
**CRM**: Kustomer (newer platform, connectors to be explored)  
**Accounting**: Intacct (limited Shopify integrations, to be explored)  
**Data Analytics**: Hex (custom data pipeline required, may need Headless)  
**ERP**: BOB ERP (less common, needs middleware)

### Complex/Custom Systems
**In-House Studio App** (largest complexity):
- Design engine similar to Canva
- Large portion of cloud compute
- Custom API integration needed

**Print-on-Demand Routing Engine**:
- Business rules determine printer selection
- Custom fulfillment logic

**Bespoke Coupon Engine**:
- May need Shopify Discount Functions

## Assumptions & Value Drivers

### Why Shopify Now?
1. **Faster Innovation**: vs. custom build maintenance
2. **Better Compliance/Maintenance**: Let Shopify handle platform updates
3. **Improved Scalability**: Infrastructure for Nov/Dec peak traffic
4. **Flexible Extensibility**: Reduce ~60 integrations complexity
5. **Enhanced UX**: Better mobile app experience
6. **B2B Growth**: School program (recurring revenue)
7. **Internationalization**: US, CA, EU, UK storefronts (all US-managed, lacks localization)
8. **Social Selling Expansion**: Better tools for social commerce
9. **AI Extensibility**: Future AI capabilities
10. **Product Catalog Expansion**: Accommodate SKU growth
11. **Cost Efficiencies**: Reduce integration/maintenance costs
12. **Headcount Optimization**: Moldova engineering team redistribution (on the down-low)

## Critical Integration Challenges

### Complex/Custom Integrations
- ⚠️ In-house Studio App (custom API)
- ⚠️ Print-on-demand routing engine (custom fulfillment logic)
- ⚠️ Bespoke coupon engine (Shopify Discount Functions)
- ⚠️ BOB ERP (less common, middleware needed)

### Rare/Challenging Integrations
- 🔴 Intacct accounting (limited Shopify integrations)
- 🔴 Kustomer CRM (newer platform)
- 🔴 Hex analytics (custom data pipeline, may require Headless)

### Easy/Available Integrations
- ✅ Stripe payments (native)
- ✅ Algolia search (multiple Shopify apps)
- ✅ Trustpilot/Bazaarvoice reviews (standard)
- ✅ Iterable email (established connector)
- ✅ GA4, Segment analytics (native/easy)

## Solution Architecture Considerations

### Storefront Approach
**Two Options Being Evaluated**:
1. **Headed Shopify Architecture**: 
   - Recommended by SDG (partner)
   - Stability, performance, reduced engineering overhead
   - Simplifies operations while minimizing risk

2. **Headless Shopify Architecture**:
   - Keep current stack, connect to Shopify Storefront API
   - Minimizes stack changes
   - Higher complexity

### Product Complexity Management
**Challenge**: 1 billion+ possible SKU combinations via in-house Studio app  
**Solution**: API-first approach - Shopify's flexibility with line item properties maintains design sophistication while gaining enterprise commerce capabilities

### Coupon System Modernization
**Current**: Bespoke coupon engine with complex rules  
**Shopify Solution**: Shopify Functions to streamline rule creation and provide more flexibility

## Agency Partner

**SDG (Lazer)** - Preferred partner  
**Timeline Alignment**: 5-6 month minimum implementation (realistic assessment)  
**Scope Delivered September 18, 2025**: Pricing and timeline outline  

**Pending from Mixbook**:
- Fulfillment API documentation from print partners
- List of third-party integrations
- Summary of coupon types (Chris's work + Anatolie's team additions)

## Implementation Timeline

**Engineering Investigation**: Q3-Q4 2025  
**Estimated Implementation**: 12 months  
**Target Go-Live**: Early 2027 (shortly after first week, critical for 2027 growth modeling)  
**Peak Season Consideration**: Must be live before Q4 holiday season

**Decision Deadline**: August 6 go/no-go (expected to slip, Chris on pat leave August 8)

## Pricing Considerations

**Platform Fees**: To be modeled against current fees  
**Shopify Payments**: 1:1 with current Stripe provider (confirmed by finance)  
**Status**: Platform fee estimation + Shop Pay lift estimation delivered by Sarah

## Resource Optimization

**Moldova Engineering Team**: Currently maintaining complex platform  
**Shopify Benefit**: Redirect engineering talent to:
- Next-generation design tools
- Product innovation vs. platform maintenance
- New product category expansion

## Meeting History

**July 9, 2025**: Sarah's initial discovery  
**July 21, 2025**: Sarah/Will sync on partner recommendations  
**July 23, 2025**: Weekly with Chris - decision-maker alignment discussed  
**August 11, 2025**: Finance team shared volume data  
**September 18, 2025**: SDG scope discussion with Mixbook

## Next Steps

1. Complete technical requirements sheet (Chris distributing)
2. Veno (SDG sales lead) to join future calls
3. Finalize fulfillment API documentation from print partners
4. Complete coupon types documentation
5. Finalize integration list
6. Chris returns from paternity leave (October)
7. Engineering investigation completion (Q4 2025)
8. Go/no-go decision (post-investigation)

**Last Updated**: October 24, 2025
