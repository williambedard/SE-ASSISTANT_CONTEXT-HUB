# Chaparral Motorsports - Technical Requirements Summary

**Document:** Shopify Requirements & Questions (Chap Moto)  
**Google Sheet ID:** 1NK8oU29X8nvt3TYEjOvXFByWzK8bUP2vMcz-zPGQHsg  
**Last Modified:** October 27, 2025  
**Status:** In Progress (Being populated by Crystal + Shopify team)

---

## Overview

This is a comprehensive technical requirements spreadsheet that covers all aspects of the merchant's current systems, processes, and desired future state on Shopify. The sheet has 8 tabs total and includes the following major sections:

---

## Major Requirement Categories

### 1. GENERAL
- Legal Business Name, Company Name, Address
- Main Point of Contact
- Website URL
- Number of web stores and physical stores
- Current eCommerce platform
- Current implementation and enhancement partners
- Reasons for re-platform
- Desired project start and launch dates
- Annual online revenue and orders per year
- International requirements

### 2. PRODUCT CATALOG
- SKU Count: **1.4 million**
- Number of categories
- Product types (simple, configurable, downloadable, bundled, custom, personalized, digital)
- Current product creation process
- Source of Truth for Inventory: **Acumatica ERP**
- Source of Truth for Pricing
- Unique filtering options (YMM fitment critical)
- Frequency of product data changes
- Reviews: **TurnTo (Pixlee)**
- Search: **Algolia**
- Merchandising

### 3. CUSTOMERS
- Approximate number of existing customer records
- Customer groups or types
- Source of truth for customer information
- Discounts per customer type
- Notable customer attributes: **"My Garage" vehicle ownership data**
- Customer sign on system / authentication
- **Current Email Marketing:** Klaviyo (integrated with vehicle data)

### 4. PRICING / PROMOTIONS
- Current promotions run online
- Discount structures
- Price tiers

### 5. PAYMENTS / CHECKOUT
- **Current Payment Processing:** Braintree (~2.1% rates)
- Payment methods accepted
- Loyalty program
- Gift cards (legacy)
- Gift certificates
- **Tax Requirements:** Avalara integration
- Recurring payments / fees / subscriptions
- **Fraud Management:** Signifyd (CRITICAL - provides insurance + chargeback management)

### 6. FULFILLMENT
- Warehouse count and locations
- 3PL usage
- Drop shipping: **Yes - multiple drop ship vendors**
- Number of drop ship vendors
- Store fulfillment options
- Process for integration from eComm to fulfillment: **Via ERP**
- **Shipping providers:** FedEx, USPS
- **Special shipping needs:** Freight for large packages
- International shipping
- Backorder support
- Pre-order support
- Address validation

### 7. INTEGRATIONS (CRITICAL SECTION)

**Current Integrations:**
- **Accounting/Financials:** Acumatica ERP
- **PIM:** Perfion (on-premise version)
- **ERP:** Acumatica
- **POS:** PHP POS (on-premise version)
- **3PL/Drop Ship:** Multiple distributors via ERP
- **CRM:** Not specified
- **EDI:** Not specified
- **Tax Calculation:** Avalara
- **Fraud Management:** Signifyd
- **Email Services Provider:** Klaviyo
- **Product Reviews:** TurnTo (Pixlee)
- **Search:** Algolia
- **Analytics:** Google Analytics
- **Marketplace:** Channel Advisor
- **Parts Fitment:** ARI's PartSmart
- **Distributor:** Turn 14 (sometimes)

**Integration Priority:**
1. Acumatica ERP (first-party Shopify integration available)
2. Perfion PIM (need to verify on-premise API compatibility)
3. Channel Advisor (via Dcopify middleware recommended)
4. ARI's PartSmart (API integration for YMM fitment)
5. PHP POS (need to verify on-premise API compatibility)
6. Signifyd (built into Shopify platform)
7. Klaviyo (first-party integration)
8. Algolia (first-party integration)
9. Avalara (first-party integration)
10. TurnTo (first-party integration)

### 8. ADDITIONAL DTC REQUIREMENTS
- **Year/Make/Model Fitment:** CRITICAL REQUIREMENT
  - ARI's PartSmart API integration
  - Schematic viewer with hot spots
  - 1.4M OEM parts SKUs
  - "My Garage" vehicle storage for customers
- **Freight Shipping:** Large package handling
- **BNPL Options:** Multiple providers desired
- **Accelerated Wallets:** Apple Pay, Google Pay, PayPal

### 9. B2B (If Applicable)
- Not primary focus for this evaluation
- Separate section in requirements sheet if needed

---

## Tabs Included in Sheet

1. **Technical Requirements** - Main requirements (shown above)
2. **Platform Fees Calculator** - Interactive pricing tool
3. **Shopify Payments Rates** - Credit card processing fees
4. **Q&A Section** - Questions from discovery calls
5. **Integration Links** - Hyperlinked first-party integrations
6. **System Summary** - Current tech stack overview
7. **B2B Requirements** (if applicable)
8. **Additional tabs** (mutual plan, notes, etc.)

---

## Key Requirements Highlighted During Discovery

### Must-Haves
1. ✅ **Year/Make/Model Fitment** with schematics viewer
2. ✅ **1.4M SKU management** with performance
3. ✅ **Freight shipping** capability
4. ✅ **Signifyd fraud protection** (insurance critical)
5. ✅ **Acumatica ERP integration**
6. ✅ **Channel Advisor marketplace** integration
7. ✅ **Perfion PIM** integration (on-premise)
8. ✅ **Algolia search** (already configured)
9. ✅ **Klaviyo email marketing** with vehicle data sync

### Nice-to-Haves
1. Multiple BNPL providers
2. Lower payment processing rates than Braintree
3. Improved shipping engine
4. Reduced developer dependency
5. Better integration ecosystem
6. Backup POS option (Shopify POS)

### Integration Verification Needed
1. **Perfion (on-premise)** - Verify API endpoint compatibility
2. **PHP POS (on-premise)** - Verify API endpoint compatibility
3. **ARI's PartSmart** - Confirm Shopify integration method
4. **Channel Advisor** - Confirm Dcopify middleware pricing/capability

---

## Next Steps for Requirements Sheet

### Crystal's Tasks
- [ ] Populate remaining fields in General section
- [ ] Detail product types and categories
- [ ] Provide customer group information
- [ ] List current promotions and discount structures
- [ ] Detail fulfillment workflow
- [ ] Clarify international requirements
- [ ] Add any unique business rules or workflows
- [ ] Review Sarah's hyperlinked integrations for accuracy

### Shopify Team Tasks
- [ ] Verify Perfion on-premise API compatibility (William)
- [ ] Verify PHP POS on-premise API compatibility (William)
- [ ] Document Dcopify middleware for Channel Advisor (William)
- [ ] Add YMM tool options to integration section (William)
- [ ] Document freight shipping app options (William)
- [ ] Provide BNPL provider comparison (Sarah)
- [ ] Document conversion uplift from Shopify Payments (Sarah)

---

## Document Status

**Current State:**
- Basic information populated by Crystal
- Shopify team adding integration links and notes
- Interactive pricing calculators added by Sarah
- Q&A section populated from discovery call

**Completion Target:**
- Pre-demo: High-level requirements documented
- Post-demo: Detailed requirements based on merchant feedback
- Pre-SOW: Complete requirements for partner scoping

---

## Related Documents
- [Technical Assessment](technical-assessment.md)
- [Discovery Call Notes](../meeting-notes/2025-10-16-discovery-call.md)
- [Briefing Document](../../briefing-document.md)
- Google Sheet (live): https://docs.google.com/spreadsheets/d/1NK8oU29X8nvt3TYEjOvXFByWzK8bUP2vMcz-zPGQHsg

