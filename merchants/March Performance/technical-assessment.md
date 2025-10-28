# March Performance - Technical Assessment

**Opportunity:** March Performance #OB  
**Account:** CVF Racing  
**Industry:** Automotive Performance Parts  
**Last Updated:** October 28, 2025  
**Status:** Closed Lost (Oct 27, 2025)

---

## Opportunity Context

**⭐ Compelling Event:** BigCommerce contract renewal November 8, 2025 - 7 years on platform with no innovation, variant limits blocking product expansion

**Business Problem:** Cannot expand product catalog on BigCommerce due to 600-variant limit; need 2000+ variants for complex automotive fitment products. B2B functionality insufficient for jobber/dealer programs.

---

## Key Metrics

- **March Performance Revenue:** $6-7M annually
- **Parent Company (CVF Racing) Total:** $24-25M annually
- **Product Count:** ~80,000 SKUs
- **Orders Per Year:** ~25,000
- **BigCommerce Annual Cost:** $12K (March Performance share of $45K total)
- **Opportunity Amount:** $82,800
- **Total Revenue Potential:** $559,045.61

---

## Business Overview

CVF Racing operates three automotive performance brands: March Performance ($6-7M), CVF Racing ($24-25M), and CVF Off-Road. March Performance specializes in high-performance engine components and accessories for motorsports applications. Products require complex fitment mapping (Year/Make/Model) with 1000+ variant combinations for some items.

Business model combines D2C online sales with B2B wholesale to jobbers and dealers. Sales team acts as technical advisors, often creating orders via admin for customers requiring expert product selection based on vehicle specifications and performance goals.

Migration strategy: Test with March Performance first; if successful, migrate larger CVF Racing brand later.

---

## Business Goals

- Eliminate 600-variant BigCommerce limitation blocking catalog expansion
- Improve B2B functionality for dealer/jobber programs (tiered pricing, payment terms)
- Streamline sales team workflow for technical product selection
- Modernize platform after 7 years without BigCommerce innovation
- Prepare for potential CVF Racing migration ($24-25M) if March Performance successful
- Reduce reliance on apps for core functionality

---

## Merchant Challenges

**Platform Limitations:**
- BigCommerce variant cap (600) insufficient for complex automotive products
- Lack of native B2B portal functionality
- Limited innovation/feature development over 7 years
- Concerns about competitor data scraping (Zik Analytics)

**Technical Complexity:**
- Automotive fitment (Year/Make/Model) requires deterministic SKU mapping
- Product selections must generate warehouse-pickable SKUs for ERP integration
- Complex BOM (Bill of Materials) explosion for make-to-order kits
- Required vs optional add-ons need separate inventory tracking

**Business Operations:**
- Sales team personal shopper workflow requires efficient admin order creation
- 5 sales reps processing technical orders - need streamlined process
- $7-8K sunk cost if migrate Feb 2026 after Nov 8 BigCommerce renewal

---

## Discovery Gaps

**🔴 HIGH PRIORITY:**
- **Partner Selection:** Never confirmed automotive fitment partner (NexusMedia, PartsPal, Teifi)
- **SKU Mapping Validation:** Proposed solution not tested/proven in merchant's trial store
- **Production Code Schema:** Never confirmed ERP integration requirements for Acumatica
- **Sunk Cost Mitigation:** $7-8K BigCommerce waste concern not addressed with financial offset

**🟡 MEDIUM PRIORITY:**
- **Migration Timeline:** Feb 2026 launch plan not validated with partner scoping
- **Bot Protection:** Specific mitigation tactics mentioned but not documented
- **App Stack:** Full list of required apps never finalized with pricing

**🟢 LOW PRIORITY:**
- **Split Payment App:** Specific app recommendation not delivered
- **Fraud Management:** Eye for Fraud replacement with Shopify native not quantified

---

## Current Tech Stack Summary

March Performance operates on BigCommerce after 7 years, currently migrating ERP to Acumatica. Tech stack emphasizes automotive-specific functionality (fitment, complex variants) with standard e-commerce tools (ShipStation, Klaviyo, Eye for Fraud). Team has strong internal technical capability (migrated brands from Volusion and Magento to BigCommerce) with preference for DIY implementation supported by agency for data migration and complex customizations.

---

## Tech Stack Details

| System | Current | Future (Shopify) | Notes |
|--------|---------|------------------|-------|
| **Platform** | BigCommerce | Shopify Plus | 7 years on BigC, 600-variant limit blocker |
| **ERP** | Migrating to Acumatica | Acumatica | Certified Shopify connector or iPaaS (Celigo/Patchworks) |
| **Shipping** | ShipStation | ShipStation | Native Shopify app available |
| **Email Marketing** | Klaviyo | Klaviyo | Native integration (Shopify owns 20% of Klaviyo) |
| **Fraud** | Eye for Fraud | Shopify Fraud Protect | Native solution could replace and reduce costs |
| **Migration Tool** | N/A | Matrixify | For products/customers/order history import |
| **Fitment (YMM)** | Custom/BigC | NexusMedia PartsPal or Teifi | **CRITICAL GAP - Never selected** |
| **Product Options** | Native BigC | Bold Product Options or Infinite Options | For non-inventory attributes (engravings, finishes) |
| **Search** | Unknown | Algolia (likely) | Advanced search + merchandising |
| **Bot Protection** | Unknown | BotStop or Shop Protector | Optional mitigation + robots.txt hardening |
| **Reviews** | Unknown | Okendo or Judge.me | UGC/social proof if not handled elsewhere |
| **Split Payments** | None | App required | Lower priority per merchant |

---

## Architecture Challenges

**Variant/SKU Complexity:**
- Products with 1000+ variant combinations exceed traditional product model
- Each customer selection combination must generate deterministic warehouse SKU
- Optional add-ons need separate SKU tracking for inventory management
- BigCommerce auto-generates SKUs from option codes - Shopify requires explicit SKU definition

**Automotive Fitment:**
- Year/Make/Model (YMM) compatibility data must drive product availability
- Vehicle garage/selector functionality required for customer experience
- Fitment database integration with product catalog
- ACES/PIES standards compliance (industry standard for automotive data)

**ERP Integration:**
- Acumatica connector must support:
  - Bi-directional product/inventory sync
  - Order export with custom production codes
  - BOM explosion for make-to-order kits
  - Price list management for B2B tiers
  - Real-time inventory updates

---

## Shopify Fit Assessment

| Requirement | Fit | Solution |
|-------------|-----|----------|
| **2000+ Variants** | ✅ Native | 2048 variant limit (announced Oct 15) |
| **B2B Portal** | ✅ Native | Plus B2B portal with tiered pricing, payment terms |
| **Draft Orders** | ✅ Native | Sales reps create orders in admin, collect payment |
| **Automotive Fitment** | 🔄 App | NexusMedia PartsPal, Teifi YMM - **NEVER SELECTED** |
| **Complex SKU Mapping** | 🔄 Custom | Collapsed-variant model + line-item properties - **NOT TESTED** |
| **ERP Integration** | ✅ App | Acumatica certified connector or iPaaS |
| **ShipStation** | ✅ Native | ShipStation app available |
| **Klaviyo** | ✅ Native | Native integration (Shopify investor) |
| **Bot Protection** | 🔄 App | BotStop/Shop Protector + mitigation tactics |
| **Split Payments** | 🔄 App | Multiple options available (lower priority) |
| **Data Migration** | ✅ App | Matrixify for products/customers/orders |

**Legend:**
- ✅ = Native Shopify functionality
- 🔄 = Requires app or custom development
- ❌ = Not possible or significant limitation

---

## Migration Considerations

**Data Migration:**
- 80,000 products (potentially expanding with variant explosion)
- Customer records (volume unknown)
- Historical order data (25,000 orders/year × 7 years = ~175K orders)
- B2B customer groupings and price lists

**Integration Requirements:**
- Acumatica ERP connector (certified or iPaaS)
- ShipStation fulfillment sync
- Klaviyo customer/event sync
- YMM fitment database integration
- Custom production code generation for make-to-order kits

**Risks:**
- **Timing:** 12-day window to Nov 8 renewal insufficient for confident decision
- **Technical Validation:** Variant/SKU solution proposed but never proven in trial
- **Partner Gap:** No automotive fitment specialist engaged to validate approach
- **Implementation Complexity:** DIY preference underestimates fitment integration complexity
- **Sunk Cost:** $7-8K BigCommerce waste if launch Feb 2026

**Testing Strategy (Missed Opportunity):**
- Should have built example complex product in trial store
- Should have validated SKU generation with Acumatica test connector
- Should have demonstrated YMM fitment app with merchant's data
- Should have engaged partner for rapid assessment (timeline/cost)

---

## Immediate Actions

*Note: Opportunity closed lost Oct 27, 2025. Actions below represent what COULD have been done:*

- ~~**William:** Build example complex product with variant/SKU solution~~ (Committed Oct 15, not delivered before Oct 27 decision)
- ~~**William:** Record video demonstrating back-office management~~ (Committed Oct 15, not delivered)
- ~~**Luis:** Introduce automotive fitment partner for rapid assessment~~ (Not done)
- ~~**Luis:** Explore PDFs to offset $7-8K sunk cost~~ (Discussed Oct 28, too late)

---

## Strategic Recommendations

**For Future Similar Opportunities:**

1. **Partner Early for Complex Requirements:** Don't wait for merchant request - introduce proven automotive/fitment partner in first discovery meeting to de-risk implementation

2. **Address Timeline Pressure Immediately:** When renewal deadline <60 days, explore contract extension options (month-to-month) in first week, not after decision made

3. **Build Proof of Concept Quickly:** For complex variant/SKU requirements, create working example within first week of trial (not just document solution)

4. **Financial Offset Proactive:** Address sunk cost concerns with PDF options during negotiation, not after merchant decides

5. **Validate ERP Integration Early:** Connect with ERP partner (Acumatica) to validate connector capabilities for custom requirements before merchant tests trial

**Why This Deal Was Lost:**
- Timing pressure (12 days insufficient)
- Implementation uncertainty (solution documented but not proven)
- Missing partner involvement (no automotive expert engaged)
- Unaddressed financial concern ($7-8K sunk cost)
- Merchant couldn't replicate fitment logic cleanly in trial

**Why Technical Fit Was Strong:**
- 2048 variant limit solved core blocker
- B2B portal met requirements
- Draft orders solved sales workflow
- ERP integration feasible
- Migration path clear with Matrixify

---

## Key Resources

**Google Drive:**
- Technical Assessment Doc: https://docs.google.com/document/d/1VYxEUcTQxco0B7bUh1yKD7P_LXMP0vU6iZH5xPoYZbg
- Requirements Spreadsheet: https://docs.google.com/spreadsheets/d/1wWyhIZrcnpjGko9E64dhl0caxm991f945iB-bajMZXQ
- Meeting Notes (Oct 15): https://docs.google.com/document/d/1321fcmI3g14A6MTkENUgpb3Vr-iQByrP0zN1kn5E3lc

**Salesforce:**
- Opportunity Link: https://banff.lightning.force.com/lightning/r/Opportunity/006OG00000HRD2bYAH/view

---

## Team Contacts

**Shopify Team:**
- Luis Eduardo Di Meco (AE): luis.dimeco@shopify.com
- William Bédard (SE): william.bedard@shopify.com
- Colin Sinclair (SDR): (Email not captured)

**Merchant Team (CVF Racing):**
- Nathan French (CEO): nate@cvfracing.com, (651) 356-8593 [NEVER ENGAGED]
- Duane Birchem (Manager, Marketing / IT Lead): duane@cvfracing.com [PRIMARY CONTACT]
- Brandon Johnson (eCommerce Specialist): brandon@cvfracing.com, (651) 356-8593
- Melanie Hinderscheid (Social Media Marketing): melanie@cvfracing.com
- Sam (Design): (Email not captured)

---

## Assumptions

- March Performance revenue $6-7M accurate (stated by merchant Oct 8)
- CVF Racing parent company $24-25M accurate (stated by merchant Oct 8)
- ~80,000 SKU count accurate (stated by Duane Oct 15)
- BigCommerce renewal Nov 8, 2025 firm (confirmed multiple times)
- $12K annual BigCommerce cost accurate (22% of $45K total)
- Team has technical capability for implementation (proven by past migrations)

---

## Outstanding Questions

*At time of decision (Oct 27), these remained unanswered:*

**🔴 HIGH PRIORITY:**
- Which automotive fitment app best fits their catalog structure?
- What is Acumatica connector's SKU/BOM handling capability?
- Can production code schema be passed via line-item properties or requires custom metafields?
- What is total monthly app cost for required functionality?

**🟡 MEDIUM PRIORITY:**
- Which partner has proven automotive migration experience (BigCommerce → Shopify)?
- What is realistic timeline with partner for Feb 2026 launch?
- Can BigCommerce negotiate month-to-month extension vs annual renewal?

**🟢 LOW PRIORITY:**
- Current search solution (Algolia assumed but not confirmed)
- Current review platform (if any)
- Specific bot protection tactics beyond general mitigation

---

## Conclusion

**⭐ Migration Intent Rating: 8/10 initially, dropped to 2/10 by Oct 27**

March Performance represented a strong technical fit for Shopify Plus with clear pain points (variant limits, B2B functionality) and compelling business case ($6-7M revenue, pathway to $24-25M parent migration). The October 15 discovery meeting showed strong engagement with merchant team actively filling scope planner and receptive to proposed solutions.

**Decision came down to timing + implementation confidence, not technical fit.** With only 12 days to BigCommerce renewal deadline (Nov 8), merchant couldn't achieve confidence in migration execution despite solving core technical blockers (2048 variants, B2B portal, draft orders). The complex automotive fitment requirements needed partner validation that was never delivered, and the trial didn't provide clean replication of their variant/SKU logic.

**Key miss: Partner introduction.** Should have engaged automotive fitment specialist (NexusMedia, PartsPal) in first week to provide rapid assessment, timeline commitment, and reference examples. This would have de-risked the implementation and likely changed the outcome.

**Future opportunity exists.** Merchant engaged seriously (multiple meetings, scope planner, trial), technical solutions were sound, and relationship remains strong. Re-engage Q3 2026 before next BigCommerce renewal cycle with partner-first approach and proactive financial offset for sunk costs.

---

*Technical assessment based on Oct 8 and Oct 15 discovery meetings, Google Drive technical documents, and email communications [INTERNAL-ONLY]*  
*Last Updated: October 28, 2025*

