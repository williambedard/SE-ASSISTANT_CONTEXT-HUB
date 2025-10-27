# Chaparral Motorsports - Discovery Assessment

**Last Updated**: October 27, 2025 (Post-Discovery Call)  
**Discovery Call Date**: October 16, 2025  
**Status**: Discovery Complete, Demo Scheduled

---

## 5Cs Framework

### 1. Customer (Target Market & Personas)

#### Primary Customer Base
- **Motorsports enthusiasts** (motorcycles, ATVs, UTVs, powersports)
- **DIY mechanics** seeking OEM and aftermarket parts
- **Professional mechanics** and repair shops

#### Customer Behavior
- **Peak purchasing season**: March-June (tax refund season)
- **Shopping journey requires**:
  - Year/Make/Model fitment tools
  - OEM parts schematics with hot-spot selection
  - "My Garage" saved vehicle functionality
  - Clear compatibility information before purchase
- **Currently marketed via**: Klaviyo email campaigns segmented by vehicle ownership

#### Business Scale
- **Online GMV**: $7-10M annually
- **Retail presence**: 1 physical store (180,000 sq ft)
- **SKU complexity**: 1.4M SKUs (heavy OEM parts catalog)

---

### 2. Company (Business Model & Operations)

#### Business Model
- **Primary**: D2C e-commerce (custom platform)
- **Secondary**: Retail (PHP POS, recently implemented)
- **Revenue Mix**: Online GMV $7-10M + retail (amount TBD)

#### Current Operations & Pain Points

**Platform Operations**:
- **Current**: Custom-built website
- **Pain**: "Tedious to maintain and update"
- **Risk**: Heavy dependency on 1-2 developers who know the system
  - Knowledge transfer difficulty
  - Developer retention risk
  - Slow change implementation (backlog of tickets)

**Organizational Structure**:
- **Decision Maker**: Crystal Ashby (VP of Operations & Marketing)
- **Tech Resources**: Small in-house dev team (stretched thin)
- **VAR Partner**: Acumatica VAR (poor performance, lacks expertise)

**Integration Challenges**:
- Partner app integrations require "a lot of lift" on custom platform
- Custom development for each third-party tool
- High cost vs. Shopify's pre-built ecosystem

#### Evaluation Approach
- **Status**: Not actively seeking switch, evaluating if Shopify is better
- **Timeline**: No hard deadline
- **Migration Preference**: Post-peak season (after June)
- **Decision Criteria** (5 factors):
  1. Performance meets needs (fitment, customer experience)
  2. Lower total cost of ownership
  3. Integration ecosystem
  4. Reduced organizational risk (less developer dependency)
  5. Cost savings from integrations

---

### 3. Competition (Market Position)

#### Competitive Landscape
- **Direct competitors**: Other motorsports parts retailers (online + brick & mortar)
- **Online presence**: Competes with specialized motorcycle/ATV retailers
- **Physical retail**: 180,000 sq ft showroom/warehouse gives local advantage

#### Differentiation Strategy
- **OEM parts expertise**: Deep catalog with fitment tools and schematics
- **Aftermarket + OEM mix**: Comprehensive parts coverage
- **Multi-channel**: Online + large retail presence

#### Market Position
- **Established player**: Previous Shopify contact in April 2024
- **Growth focus**: Improving conversion (BNPL, payments)
- **Operational efficiency**: Reducing platform maintenance burden

---

### 4. Collaborators (Partners & Integrations)

#### Current Tech Stack (Confirmed)

**Core Systems**:
- **ERP**: Acumatica (on-premise)
  - **Pain**: Poor support (30-60 day ticket response times)
  - **Pain**: VAR lacks technical expertise
  - **Pain**: Performance issues unaddressed
  - **Status**: Self-hosting due to cloud performance concerns
  - **Future**: Wishes to move but no appetite for another ERP migration
- **PIM**: Perfion (on-premise)
  - **Status**: Want to continue using
  - **Integration**: Has automation tools that may connect to Shopify
  - **Note**: Would require Perfion developer knowledge (not plug-and-play)

**Sales & Commerce**:
- **POS**: PHP POS (on-premise, implemented 3 months ago)
  - **Status**: Team happy with it
  - **Integration**: Need to verify on-premise API compatibility
- **Payments**: Braintree (~2.1% rates)
  - **Status**: No contract, open to switching
- **Fraud**: Signifyd
  - **Status**: CRITICAL - provides insurance + chargeback management
  - **History**: Significant fraud issues (bad credit cards, call center fraud)
  - **Value**: "Such a waste of time to fight chargebacks"
  - **Recommendation**: Keep (Shopify fraud detection less sophisticated)

**Marketplace & Distribution**:
- **Marketplace Management**: Channel Advisor
  - **Satisfaction**: Very satisfied with functionality
  - **Pain**: Cost is high
  - **Integration**: Via Dcopify middleware (preferred over Marketplace Connect)
  - **Scope**: Both product information + order integration
- **Distributors**: Turn 14 (sometimes), multiple drop-ship partners

**Parts & Fitment**:
- **Year/Make/Model**: ARI's PartSmart
  - **Function**: API integration for vehicle data from manufacturers
  - **User Flow**: Select Y/M/M → Select area → View schematic hot spots → Add to cart
  - **Requirement**: 1.4M SKUs need to be in database for cart functionality

**Marketing & Customer Experience**:
- **Email Marketing**: Klaviyo
  - **Integration**: Syncs with "My Garage" vehicle ownership data
  - **Segmentation**: Campaigns by vehicle type/brand
- **Search**: Algolia
  - **Status**: Want to keep (already configured)
  - **Reason**: Handles large data sets well
- **Product Reviews**: TurnTo (owned by Pixlee)

**Operations & Compliance**:
- **Tax**: Avalara
- **Analytics**: Google Analytics
- **Shipping Carriers**: FedEx, USPS
  - **Special Need**: Freight/LTL for large packages

#### Shopify Integration Strategy

**First-Party Integrations** (✅ Available):
- Acumatica ERP (first-party partner)
- Klaviyo
- Algolia
- Avalara
- TurnTo
- Google Analytics
- Signifyd (built into platform)

**Middleware Required**:
- Channel Advisor → Shopify: Dcopify
- Perfion PIM → Shopify: Custom integration (on-premise API)
- PHP POS → Shopify: Need verification (on-premise API)
- ARI's PartSmart → Shopify: API integration

**App/Partner Solutions Needed**:
- Freight shipping app (ETL or similar)
- Year/Make/Model tools (partner-built for Shopify)
- Multiple BNPL providers

#### Partner Involvement
- **Hesitancy**: Poor past experiences with development partners
- **Openness**: Open to hybrid approach (partner + in-house)
- **Preference**: Partners who "live, eat, breathe Shopify Plus"
- **Mentioned**: Firesite, others specializing in automotive

---

### 5. Climate (Market Conditions & Trends)

#### Market Dynamics
- **Tax Refund Season**: March-June peak (drives purchasing behavior)
- **E-commerce Growth**: Shift from retail to online accelerating
- **Payment Innovation**: BNPL adoption growing in powersports
- **Platform Modernization**: Industry moving from custom to SaaS platforms

#### Technology Trends
- **SaaS Platform Adoption**: Moving away from custom builds
- **Integration Ecosystems**: Pre-built apps vs. custom development
- **Accelerated Checkout**: Apple Pay, Google Pay, Shop Pay
- **Automotive E-commerce**: Specialized fitment tools maturing on Shopify

#### Business Pressures
- **Developer Scarcity**: Hard to find developers familiar with custom systems
- **Maintenance Burden**: Custom platforms becoming harder to justify
- **Integration Costs**: Third-party integrations expensive on custom builds
- **Security & Compliance**: Platform updates, PCI, fraud prevention

#### Opportunities
- **Conversion Optimization**: ~5% uplift from Shopify Payments + Shop Pay
- **Operational Efficiency**: Reduce developer backlog, empower business users
- **Risk Mitigation**: Less dependency on specific developers
- **Lower TCO**: Platform fees vs. hosting + development + maintenance

---

## EPoV Readiness Assessment

### Current Readiness: Medium-High
**Discovery completed, demo scheduled, strong engagement**

### Strengths (Green Flags)
1. ✅ **Tech stack compatibility**: Nearly all integrations have Shopify solutions
2. ✅ **Clear pain points**: Organizational risk, developer dependency, integration difficulty
3. ✅ **No contracts**: Braintree has no contract (easy to switch)
4. ✅ **Decision maker engaged**: Crystal Ashby is sole evaluator initially
5. ✅ **Previous interest**: Connected with Shopify in April 2024
6. ✅ **Demo scheduled**: Week of Oct 27, Tuesday 10 AM PT
7. ✅ **Open to partners**: Despite past issues, willing to consider hybrid approach
8. ✅ **Well-researched tools**: Already using best-in-class apps (Klaviyo, Algolia, Signifyd)

### Challenges (Yellow Flags)
1. ⚠️ **Not urgent**: No hard deadline, evaluating vs. actively seeking
2. ⚠️ **Custom complexity**: 1.4M SKUs, OEM schematics, freight shipping
3. ⚠️ **Acumatica pain**: Dissatisfied with ERP but no appetite to switch
4. ⚠️ **On-premise systems**: Perfion PIM and PHP POS need API verification
5. ⚠️ **Rate gap**: Braintree 2.1% vs. Shopify 2.25% (small delta)
6. ⚠️ **Peak season**: Would delay launch until post-June
7. ⚠️ **Partner hesitancy**: Previous poor experiences with development partners
8. ⚠️ **Custom payments**: Manufacturer credit cards (Yamaha, etc.) not standard

### Critical Success Factors
1. **YMM Fitment Demo**: Must show backend of how year/make/model works
2. **Performance Confidence**: Prove Shopify can handle 1.4M SKUs + schematics
3. **Integration Verification**: Confirm Perfion (on-premise) and PHP POS (on-premise) APIs
4. **Partner Match**: Find automotive specialist partner (Firesite or similar)
5. **Freight Solution**: Demonstrate ETL or equivalent for LTL shipping
6. **Conversion Story**: Show 5% uplift from Shopify Payments + accelerated wallets
7. **Risk Mitigation**: Emphasize reduced developer dependency, business user empowerment
8. **TCO Analysis**: Platform fees vs. current hosting + dev + maintenance costs

### Probability Assessment
- **Close Probability**: Medium (currently "Very Low" in SFDC but shows strong engagement)
- **Timeline**: Q1-Q2 2026 launch (post-peak season)
- **Deal Size**: $82,800 (Plus + Payments)

### Next Steps to Advance
1. **Deliver exceptional demo** (week of Oct 27, Tuesday 10 AM PT)
   - Focus: YMM backend functionality
   - Show: Comparable automotive merchants
   - Demo: Either partner's YMM tool or replicate Chaparral product
2. **Verify integrations** (pre-demo):
   - Perfion on-premise API compatibility
   - PHP POS on-premise API compatibility
   - Dcopify for Channel Advisor
3. **Share resources** (pre-demo):
   - Automotive merchant case studies
   - Comprehensive BNPL provider list
   - Conversion uplift data
4. **Partner introduction** (post-demo):
   - Firesite or automotive specialist
   - Show similar builds and timelines
5. **Address Acumatica pain** (ongoing):
   - Leverage Shopify-Acumatica partnership
   - Smoother integration path

---

## Recommended EPoV Narrative

### Problem Statement
"Chaparral Motorsports' custom platform creates organizational risk through developer dependency and makes partner integrations prohibitively difficult and expensive. With 1.4M SKUs and complex OEM fitment requirements, they need a scalable platform that can handle automotive complexity while reducing operational burden."

### Shopify Solution
"Shopify Plus provides enterprise-grade commerce with purpose-built support for automotive fitment (year/make/model tools, metafields for OEM data), embedded schematics integration, and freight shipping capabilities—all while eliminating platform maintenance burden. The 3M+ merchant ecosystem means lower integration costs and reduced developer dependency, with business users empowered to make changes without engineering tickets."

### Value Proposition
1. **Risk Mitigation**: Platform knowledge vs. custom system dependency
2. **Lower TCO**: App ecosystem vs. custom integrations
3. **Conversion Lift**: ~5% from Shopify Payments + Shop Pay + BNPL options
4. **Operational Control**: Business users make changes without dev backlog
5. **Proven Automotive Pattern**: Existing merchants with similar complexity on Shopify
6. **Flexible Timeline**: Phased approach, post-peak launch

### Success Metrics
- Reduced developer ticket backlog
- Faster integration deployment (hours vs. weeks)
- Conversion rate improvement (5%+ from payment innovation)
- Lower total cost of ownership (platform + apps vs. custom)
- Business user self-sufficiency (catalog changes, merchandising)

---

**Last Updated**: October 27, 2025
