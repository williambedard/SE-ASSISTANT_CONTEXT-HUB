# Shopify x CVF Racing (March Performance) | Follow-up - October 15, 2025

**Date:** Wednesday, October 15, 2025 @ 11:00 AM CDT  
**Duration:** 30 minutes  
**Attendees:**
- **Shopify:** Luis Eduardo Di Meco (AE), Colin Sinclair, William Bédard (SE)
- **Merchant:** Duane Birchem, Brandon Johnson, Sam

**Meeting Type:** Technical Discovery Follow-up  
**Recording:** Available in Google Drive  
**Gemini Notes:** Available in Google Drive (Doc ID: 1321fcmI3g14A6MTkENUgpb3Vr-iQByrP0zN1kn5E3lc)

---

## Meeting Summary

Second discovery meeting focused on addressing technical deal-breakers identified in initial Oct 8 call. Key discussion points: Shopify's 2048 variant limit (announced same day!), complex product variant/SKU mapping strategies, internal migration preference with potential agency support, bot protection methods, and B2B/sales team workflows.

**Outcome:** Positive engagement - Brandon indicated scope planner nearly complete, Duane receptive to proposed solutions. William committed to building example product and providing detailed technical guidance.

---

## Key Discussion Points

### 1. BigCommerce Renewal Context

**Financial Details:**
- BigCommerce renewal: **November 8, 2025**
- Annual contract: **$45,000** (all 3 domains: March Performance, CVF Racing, CVF Off-Road)
- March Performance share: **~$12,000/year** (~22% of total)
- Order-based pricing: ~25,000 orders @ negotiated rate with $0.15 overage

**Migration Timeline:**
- Target March Performance launch: **February 2026**
- Would result in **$7-8K wasted** on unused BigCommerce service (Feb-Nov 2026)
- Still evaluating Shopify vs BigCommerce renewal

### 2. Variant Limit Solution ✅

**Problem:**
- BigCommerce limits: 600-700 variants per product
- March Performance needs: 1000+ variants for some products
- Example product shown: 4 required options + 2 fitment dimensions + 5-6 add-on options

**Solution:**
- **Shopify recently increased variant limit to 2048** (announced October 15, same day as meeting!)
- Previously: 1024 standard, 2048 in beta
- Now: 2048 native for all Plus merchants

**William's Proposed Workaround:**
- Explode complex products into individual product SKUs in back office
- Merge variants on storefront for seamless customer experience
- Preserves deterministic SKU mapping for warehouse/ERP
- Example: 80,000 current products could expand but manageable

**Duane's Concern:**
- SKU mapping critical - customer selections must generate specific warehouse-pickable SKU
- BigCommerce auto-generates SKUs based on option codes
- Shopify apps tested didn't provide true SKU mapping (only line-item properties)

**Next Step:** William to build example product and demonstrate back-office management via video

### 3. Automotive Fitment / YMM (Year/Make/Model)

**Requirements:**
- Products have complex fitment: Configuration, Power Steering type, Water Pump, Alternator, Damper
- Required selections must deterministically map to SKU
- Optional add-ons (Reservoir Style, Power Steering Line Kit, etc.) need to be separate SKUs

**William's Assessment:**
- Collapsed-variant model feasible within 2048 limit
- Option 1: Accessory Setup (concatenate config + PS type)
- Option 2: Water Pump (3 values)
- Option 3: Alternator (2 values)
- Total: ~72-288 variants depending on fitment complexity
- Add-ons modeled as separate products

**Alternative Approaches Discussed:**
- Combined Listings (Plus-exclusive) for multi-product kits
- Metaobject-driven custom PDP for maximum flexibility
- ERP-driven BOM explosion (capture selections, ERP derives production code)

**Duane Shared:** URL to most complex product (in chat)

### 4. Migration Strategy

**Duane's Preference:**
- Handle migration internally (experienced: Volusion → BigC, Magento → BigC)
- Team capable: Duane (IT/dev), Brandon (products/data), Sam (design)
- Open to third-party agency for:
  - Data migration heavy-lifting
  - Product page customizations
  - Specific technical challenges
- One-time agency payment acceptable if needed

**William's Recommendation:**
- Storefront buildable by merchant team given experience
- Agency recommended for data migration (done it 100+ times)
- Agency valuable for complex product page customizations
- Can split responsibilities based on merchant preference

### 5. Zik Analytics / Bot Protection

**Concern:**
- Competitors use Zik Analytics (Seek Analytics) to track:
  - Revenue estimates
  - Order volumes
  - Top-selling products
- Merchant wants to track competitors but prevent being tracked

**William's Assessment:**
- Complete prevention impossible for public websites
- Any public site can be scraped (especially with AI tools)
- Platform-agnostic issue (BigCommerce or Shopify)
- Mitigation tactics available but never perfect
- Shopify offers bot protection (better than most) but not foolproof
- Filter bot traffic in analytics reports

**Status:** Transparency appreciated by Duane

**Brandon's Note:** Mentioned some Shopify competitors they couldn't scrape data from

### 6. Split Payments ✅

**Requirement:** Multiple credit cards for single transaction (customer splits payment)

**Solution:**
- **Native:** Store credit + credit card (change payment methods)
- **App recommended:** For multiple credit cards on one transaction
- William to share specific app recommendation

**Priority:** Lower priority per Duane

### 7. Sales Team Workflow (Personal Shopper) ✅

**Current Process:**
- 5 sales reps handle technical product selection
- Customer calls with vehicle specs/needs
- Rep navigates frontend, selects options, adds to cart
- Rep enters customer info and credit card during checkout
- Processes order through consumer-facing frontend

**Problem:**
- Need more efficient admin-based workflow
- Don't want to navigate entire site for each order

**Shopify Solution (William Demonstrated):**
- Sales reps get specific admin permissions
- Create orders directly in Shopify Orders tab
- Browse products, add SKUs to order
- Collect payment and input CC# from admin
- Authorize payment without storefront navigation

**Alternative Workflow:**
- Send draft orders as quotes
- Customer completes payment via email link

**Duane's Reaction:** "Cool. So our guy just puts in the right product, they can do everything right there."

**Sales Rep Tracking:**
- Currently implementing AI agent for email support
- Staff notes with initials for custom reporting
- No visibility concern with Shopify Shop Pay codes (won't be issue in admin)

### 8. Integrations Confirmed

**Current/Planned Stack:**
- **ERP:** Acumatica (migrating) - Shopify has certified connector or iPaaS (Celigo/Patchworks)
- **Shipping:** ShipStation - Shopify app available
- **Email:** Klaviyo - Native integration (Shopify owns 20%)
- **Fraud:** Eye for Fraud - Shopify built-in fraud algorithms could replace
- **Migration Tool:** Matrixify recommended for products/customers/order history

**Custom AI Implementation:**
- Language learning model for email support
- Launching within a week
- Fed with year of emails + knowledge base
- Sales staff reviews/edits AI drafts → system learns

---

## Next Steps / Commitments

### William (SE) Commitments:
- [ ] Build example of most complex product (URL provided in chat)
- [ ] Create short video demonstrating back-office variant management
- [ ] Share mitigation tactics and technical tools for bot protection
- [ ] Provide app recommendation for split payments
- [ ] Send requirements document template (Scope Planner)

### Luis (AE) Commitments:
- [ ] Send requirements document for merchant to input questions
- [ ] Record video detailing Shopify pricing breakdown (platform + apps)
- [ ] Create cost breakdown: native functionality vs app requirements
- [ ] Develop mutual action plan document

### Merchant Commitments:
- [ ] Brandon to finish scope planner (mostly complete)
- [ ] Duane to add remaining questions to scope planner
- [ ] Review William's product example and video
- [ ] Provide feedback on proposed variant/SKU solution

### Follow-up Actions:
- [ ] Merchant preference: Email/video over additional meetings
- [ ] BigCommerce renewal call: Same afternoon (Oct 15)

---

## Key Quotes

**Duane on variant/SKU mapping:**
> "The issue I was having is I couldn't find a way to map options to spit out a SKU number when customer makes selections. I found apps on Shopify but they don't actually map to anything."

**Duane on migration approach:**
> "Ideally we'd like to do it ourselves. If we have to pay a third party, that's fine, but I feel like we have the skill set to do it. It's just knowing how to do it."

**Duane on bot protection transparency:**
> "I appreciate the transparency."

**Duane on meeting efficiency:**
> "We hate meetings, so like the more we can do over email and sending video links and stuff like that. Nothing against you guys, just we'd rather just do it."

**Brandon post-meeting:**
> "It went well. I have most of the scope planner done. Duane has a few more things..."

---

## Merchant Sentiment

**Positive Indicators:**
- Strong engagement throughout 30-minute call
- Brandon actively filling out scope planner
- Duane receptive to proposed solutions
- Appreciated transparency on limitations
- Comfortable with async communication (email/video)
- Willing to pay for agency support if needed

**Concerns/Risks:**
- November 8 deadline creates significant time pressure
- Variant/SKU mapping complexity not yet proven in trial
- Preference for DIY may underestimate implementation complexity
- $7-8K sunk cost concern for Feb launch after Nov renewal

---

*Source: Google Drive meeting notes + transcript [INTERNAL-ONLY]*  
*Gemini Notes Doc: 1321fcmI3g14A6MTkENUgpb3Vr-iQByrP0zN1kn5E3lc*  
*Last Updated: 2025-10-28*

