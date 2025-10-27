# Chaparral Motorsports - Technical Assessment

**Opportunity Name:** Chaparral Motorsports - Plus, SP, SPi  
**NotebookLM:** https://notebooklm.google.com/notebook/9300b15c-66cc-417a-84ea-6f30efb046f2  
**Google Drive Folder:** 10CPbWCNKIyagMjOIb8EKfnVVyvEON11_

---

## 🤝 Stakeholders & Key Player Matrix

### Merchant Team
- **Crystal Ashby** - VP of Operations and Marketing (Primary POC)
  - Email: cashby@chaparralmotorsports.com
  - Decision maker for platform evaluation
  - Managing all evaluation without developer involvement initially

### Shopify Team
- **Sarah Roberts** - Account Executive
- **William Bédard** - Solutions Engineer

### Other Merchant and Partner Relationship Context
**Context and Motivation:**
- Chaparral Motorsports is an existing automotive merchant who previously connected with Shopify in April 2024 regarding the platform
- Current focus is replacing Chaparral's custom website because it is often tedious to maintain or update
- Partner software implementation is difficult on the custom platform, requiring significant effort ("a lot of lift"), whereas Shopify offers easy, automatic connections
- Chaparral's online Gross Merchandise Volume (GMV) is between $7-10 million annually
- Key concern: managing fitment and integrating their specialized schematics viewer for selling OEM parts
- Future goals: improving shipping engine (critical for handling large packages requiring freight) and adding additional Buy Now Pay Later (BNPL) options

---

## 🤔 Why Shopify / Why Now?

### Business Drivers
1. **Organizational Risk**: Heavy dependency on 1-2 developers who know the custom system
   - Custom system makes it difficult to bring new developers up to speed
   - Significant knowledge risk if developers leave
   - "It's like having someone else understand your file system"

2. **Integration Complexity**: Partner integrations require "a lot of lift" on custom platform
   - Shopify offers easy, automatic connections vs. manual development
   - Cost and time savings from pre-built integrations

3. **Lower Total Cost of Ownership**: Evaluating if Shopify is more cost-effective than custom platform
   - Not actively seeking switch, but evaluating if Shopify is better solution
   - No hard deadline for migration
   - Peak season: March-June (tax refund season) - would hold migration until later in year

### Pain Points with Current Platform
- Tedious to maintain and update
- Backlog of tickets sent to developers for changes
- Can't make quick changes without developer dependency
- Difficult partner app implementations

---

## 🧠 Requirements and Solutions

### 1. Year, Make, Model Fitment (CRITICAL)
**Current Solution:**
- Third-party integration: **ARI's PartSmart**
- API integration providing year/make/model data from manufacturers
- Customer flow:
  1. Select year, make, model
  2. Select area of motorcycle
  3. View schematic with hot spots
  4. List below corresponds to parts (numbered)
  5. Add SKUs to cart

**Current Challenge:**
- Requires 1.4M SKUs in database for cart functionality
- Schematics viewer is essential for OEM parts sales
- Concerns about handling high SKU count and data movement

**Shopify Solution:**
- Shopify is API-first platform - can extend functionality and add custom objects
- Can integrate with ARI's PartSmart API
- Options:
  1. Load all 1.4M SKUs into Shopify (traditional approach)
  2. Use external database with API for pricing/availability, with custom objects in Shopify
- Year/make/model tools available from Shopify partners
- Custom fields (metafields/metaobjects) available through API
- Partners experienced with automotive fitment can assist

**User Experience Goal:**
- Minimum: Replicate current experience
- Ideal: Improve upon current experience (open to enhancements)

**Additional Functionality:**
- "My Garage" / "My Rides" feature where customers can save their vehicles
- Currently integrated with Klaviyo for email marketing based on vehicle ownership
- Shopify can extend customer profiles with this data

### 2. Shipping Engine Improvements
**Current Challenge:**
- Need to handle large packages requiring freight
- Shopify Shipping doesn't cover freight

**Shopify Solution:**
- **Shopify Shipping** for standard packages:
  - Negotiated rates with major carriers (UPS, USPS, DHL, Canada Post)
  - Dynamic rate calculation based on cart contents and weight
  - Can use Shopify rates or merchant's own negotiated rates (whichever is better)
- **Freight Solution**: ETL app
  - Integrates with 35+ freight providers
  - Can quote freight rates in checkout
  - Alternative: Draft order workflow with manual freight quotes

**Current Carriers:**
- FedEx
- USPS

### 3. Buy Now, Pay Later (BNPL) Options
**Current Solution:** Limited BNPL options

**Shopify Solutions Discussed:**
- **Shop Pay Installments** (out of the box with Shopify Payments)
- **Klarna**
- **Afterpay**
- **Affirm**
- **Sezzle**
- **Katapult** (recommended for automotive industry)
- Additional options available

**Also Includes:**
- **Apple Pay** (out of the box with Shopify Payments)
- **PayPal** (direct partnership)
- **Google Pay**
- **Shop Pay** (accelerated checkout)

---

## 🏋️ Data Migration

### SKU and Catalog Details
- **Total SKUs**: 1.4 million (initially stated as 14M, corrected)
- **Product Categories**: Extensive automotive/powersports parts
- **OEM Parts**: Significant portion of catalog

### Inventory Management
- **Source of Truth**: ERP (Acumatica)
- **Drop Ship Partners**: Supplemental inventory feeds from distributors
- **Inventory Sync**: Managed via ERP, one-way sync to Shopify
- **No Direct Supplier Integration**: Inventory always flows through ERP first

### Migration Approach
- Partner agencies experienced with automotive merchants
- Partners handle initial data migration and test synchronizations
- CSV import for initial product catalog
- Ongoing sync via ERP integration

---

## 🔌 Tech Stack and Integrations

### Current Tech Stack

| System | Provider | Integration Status | Notes |
|--------|----------|-------------------|-------|
| **ERP** | Acumatica | ✅ First-party Shopify integration | Significant dissatisfaction with Acumatica support |
| **PIM** | Perfion (on-premise) | ⚠️ Integration possible | Need to verify on-premise API compatibility |
| **Parts Fitment** | ARI's PartSmart | ✅ API integration possible | Third-party year/make/model database |
| **Marketplace** | Channel Advisor | ✅ Dcopify middleware | Product + order integration |
| **POS** | PHP POS (on-premise) | ⚠️ Integration exists | Need to verify on-premise version API compatibility |
| **Payment Gateway** | Braintree | 🔄 Replace with Shopify Payments | No contract, open to switch |
| **Fraud Protection** | Signifyd | ✅ Built into Shopify | Keep - provides insurance + chargeback management |
| **Tax Calculation** | Avalara | ✅ Shopify integration | Can keep or switch to Shopify Tax |
| **Email Marketing** | Klaviyo | ✅ Shopify integration | Vehicle data currently synced here |
| **Search** | Algolia | ✅ Shopify integration | Want to keep - already configured |
| **Product Reviews** | TurnTo (owned by Pixlee) | ✅ Shopify integration | First-party integration available |
| **Analytics** | Google Analytics | ✅ Included with Shopify Plus | Standard integration |
| **Distributor** | Turn 14 | ✅ Shopify app available | Sometimes used |

### Acumatica ERP Issues
**Major Pain Points:**
- Lack of support for performance issues
- VAR (Value Added Reseller) lacks technical expertise
- Ticket response times: 30-60 days ("might as well not respond")
- Forced to self-host due to cloud performance concerns
- Currently manage own hosting environment
- Doing a lot of Acumatica development in-house due to poor VAR support

**Shopify Advantage:**
- Close relationship between Shopify and Acumatica
- Can leverage partnership for smoother integration
- First-party integration is "super clean"

**Future State:**
- Crystal wishes they could move ERPs but doesn't have appetite for another ERP migration
- Open to exploring other ERPs long-term (NetSuite, Brightpearl mentioned)

### Marketplace Integration Strategy
**Current:** Channel Advisor
- Very satisfied with functionality
- Only complaint: Cost
- Manages product information + order integration

**Options Discussed:**
1. **Shopify Marketplace Connect** (free, first-party)
   - May have limitations with 200-300K SKUs
   - Good for standard marketplace integration
   
2. **Keep Channel Advisor + Use Dcopify Middleware**
   - Preferred option
   - Integrates Channel Advisor ⟷ Shopify
   - Handles both product data and order flow
   - Better for merchants with complex/technical product data

### Point of Sale (POS) Considerations
**Current:** PHP POS (implemented 3 months ago)
- Simple migration process
- Team is happy with solution
- On-premise version
- Integrated with ERP (Acumatica)

**Shopify POS:**
- Not a priority for this evaluation
- Previously explored but:
  - Cost concerns (at the time, needed Plus for user licenses)
  - Custom payment methods not supported (manufacturer credit cards - Yamaha, etc.)
  - Manufacturer cards don't run through Visa/Mastercard networks
  - Need manual entry that posts to specific GL accounts in ERP
- **Note:** Shopify Plus includes 200 POS licenses free with Shopify Payments
  - One location = one license (can have multiple kiosks/iPads per location)
  - 180,000 sq ft store = 1 location license
- Could be backup option if PHP POS issues arise

### Payments Strategy
**Current:** Braintree
- Rates: ~2.1% (pre-negotiated)
- No contract - open to switch

**Shopify Payments Consideration:**
- Crystal open to comparing rates
- Shopify rates: 2.25% for Plus
- Braintree 2.1% → Shopify unlikely to match (too close)
- **PayPal rates:** More room for negotiation if there's significant delta
- **Would need:** Last 3 months of Braintree statements for rate negotiation
- **Conversion uplift:** ~5% increase expected from Shop Pay, Apple Pay, Google Pay, accelerated wallets

### Fraud Protection
**Current:** Signifyd
- Significant fraud history (bad credit cards, multiple attempts)
- Fraud on both website and call center
- Review all orders through Signifyd

**Signifyd Benefits:**
- Insurance on all orders
- Chargeback management handled by Signifyd
- "Such a waste of time to fight chargebacks" - critical to keep

**Shopify Fraud Detection:**
- Built-in fraud detection flags suspicious orders
- Algorithms block clearly fraudulent orders
- Less sophisticated than Signifyd
- **Recommendation:** Keep Signifyd for insurance + advanced detection

### PIM Strategy
**Current:** Perfion (on-premise)
- Used for product creation and data management
- Want to continue using as source of truth
- Already has automation tool that may connect to Shopify APIs
- Integration would likely require Perfion developer knowledge (not plug-and-play)

**Reason to Keep:**
- Already integrated with Channel Advisor workflow
- Established product data management processes

---

## 📝 Additional Notes

### Website Costs (Current Platform)
**Main Cost Drivers:**
- Standard hosting
- Developer dependency and custom development
- Third-party integrations (more expensive than Shopify equivalents)

**Crystal's Perspective:**
- Third-party integrations often more expensive than Shopify app features
- Shopify's 3M+ merchant network drives lower integration costs (developers build for Shopify first)
- Long-term benefits: Growth and conversion improvements, not just cost savings

### Business Context
- **Peak Season:** March - June (tax refund season)
- **Retail Location:** 1 store (180,000 sq ft)
- **Online GMV:** $7-10M annually
- **Physical Store GMV:** Not specified
- **SKU Scale:** 1.4M total SKUs (includes OEM parts via ARI's PartSmart)

### Evaluation Approach
- Crystal evaluating alone initially (no developers involved yet)
- Wants to avoid developer bias in decision-making
- Open to hybrid partner approach (Firesite or others mentioned)
- Previous poor experiences with development partners
- Hesitant but open to partner involvement

### Decision Criteria (5 Factors)
1. Performance - meets needs for fitment and customer experience
2. Lower total cost of ownership
3. Integration ecosystem (first-party apps)
4. Risk reduction (less developer dependency)
5. Cost savings from integrations

---

## Shopify Offerings Discussed

### Platform Benefits
- **Included in Plus Plan:**
  - Unlimited hosting
  - CDN (Cloudflare)
  - Security
  - Fraud prevention
  - Platform updates (no surprise "2.0" migrations)
  - Search and discovery
  - 200 POS licenses (with Shopify Payments)

### Payment Solutions
- **Shopify Payments** (white-label Stripe)
  - Shop Pay Installments (backed by Affirm)
  - Apple Pay, Google Pay
  - PayPal (direct partnership)
  - Shop Pay (accelerated checkout)

### Developer Dependency Reduction
- Business users can make changes without developer backlog
- Built-in admin for managing products, customers, orders
- App ecosystem reduces custom development needs
- Can still build custom storefront if desired

---

## Next Steps

### Demo Scheduled
- **Date:** Tuesday, week of October 27
- **Time:** 10:00 AM Pacific
- **Duration:** 1.5 hours
- **Attendees:** Crystal Ashby (solo), Sarah Roberts, William Bédard

### Demo Focus
1. **Year/Make/Model Functionality** (primary focus)
   - Show backend of how it's set up
   - Comparable websites with YMM functionality
   - Either demo merchant's YMM tool or replicate Chaparral product in Will's demo store
2. **Platform Admin:** How business users make changes
3. **Integration Ecosystem:** App store walkthrough
4. **Shopify Payments:** Conversion benefits, Shop Pay
5. **Mutual Evaluation Plan:** Timeline and next steps

### Pre-Demo Actions

**William's Tasks:**
- [ ] Explore Dcopify tool for Channel Advisor integration
- [ ] Add Perfion integration documentation to shared sheet
- [ ] Reach out to Perfion developers to verify on-premise API endpoint compatibility
- [ ] Reach out to PHP POS to verify on-premise version API compatibility
- [ ] Prepare YMM functionality demo (either merchant examples or build replica)
- [ ] Plan comprehensive 1.5-hour demo

**Sarah's Tasks:**
- [ ] Share automotive merchant case studies on Shopify
- [ ] Send comprehensive BNPL solutions list (including Katapult)
- [ ] Share information on conversion uplift from Shopify Payments
- [ ] Send mutual plan document with helpful resources

**Crystal's Tasks:**
- [ ] Provide last 3 months of Braintree statements (if pursuing rate negotiation)
- [ ] Review mutual plan document and add questions
- [ ] Explore pricing calculator in shared sheet

---

## Discovery Call Summary (October 16, 2025)

### Meeting Structure
1. Business discovery (Sarah)
2. Technical discussion (William)
3. Pricing tabs review (if time)
4. Mutual plan alignment
5. Demo scheduling

### Key Takeaways
- Crystal not actively seeking switch, evaluating if Shopify is better solution
- No hard deadline, but would hold off until post-peak (after June)
- Biggest concern: Can Shopify handle YMM fitment with same customer experience?
- Second concern: 1.4M SKU scale and data movement
- Tech stack integrates very well with Shopify (positive signal)
- Open to partner involvement despite past poor experiences
- Organizational risk from developer dependency is primary motivator
- Cost savings potential, but not sole decision factor

### Positive Signals
- No contract with Braintree (easy to switch)
- Strong existing integrations (Klaviyo, Algolia, Avalara, Google Analytics)
- Previous Shopify interest (April 2024)
- Tech stack already Shopify-compatible
- Open to seeing YMM tools and partner solutions

### Yellow Flags
- Acumatica dissatisfaction (but Shopify has strong partnership)
- Perfion on-premise version (need API verification)
- PHP POS on-premise version (need API verification)
- Custom manufacturer payment methods for POS
- Large freight shipping requirements
- Previous partner development issues (hesitancy)

---

## Meeting Notes
- [October 16, 2025 - Discovery Call](../meeting-notes/2025-10-16-discovery-call.md)
- [October 16, 2025 - Crystal Tech Requirements Email](../emails/2025-10-16-crystal-tech-requirements-update.md)

