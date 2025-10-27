# CampusParc - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Salesforce Opportunity**: https://banff.lightning.force.com/lightning/r/Opportunity/006OG00000CQYlVYAX/view  
**Products**: Plus

## Executive Summary

CampusParc manages university parking systems and is looking to modernize their parking permit platform. Currently using T2 Flex, dissatisfied with slow innovation. Annual revenue: ~$17B total, $10M online platform (excludes payroll deduction).

## Current Technical Stack

**Platform**: T2 Flex  
**Pain Points**:
- Slow pace of innovation
- Limited flexibility in permit offerings
- Lack of modern payment options

**Revenues**: $17B total (includes payroll deduction); $10M online platform estimate  
**Seasonality**: June, July, August (majority of sales)

## Business Requirements

### Permit Offerings
- Flexible permit structures
- Modern payment options (including installments)
- Annual permits with subscription model + cancellation options
- Ability to experiment with permit offerings

### Integration Requirements

**T2 Flex**: Ideal end state has T2 as inventory management system  
**SSO**: Existing Single Sign-On with university  
**API Integration**: Potential for deeper integration with existing comparison tool

### Payment Processing
Explore Shopify Payments with modern payment options (installments, subscription models)

## Solution Architecture

### Phase 1: MVP (Recommended Starting Point)

**User Journey**:
1. User lands on current website, logs in, builds cart
2. User clicks "checkout" in cart
3. **Redirect to Shopify Checkout**:
   - Automatic login via Multipass SSO
   - Cart items pre-populated via Cart Permalinks
   - Customer/order data synced to Shopify Admin APIs
4. Current customer portal maintained (for now)
5. All customer/order/product data synchronized between platforms

### Subsequent Phases

**Phase 2: Storefront Migration**
- Migrate product discovery and cart building to Shopify
- Leverage Shopify's OOTB Customer Portal with Extensibility
- Let users manage licenses, purchase history, renewals, waitlists
- **This phase provides biggest UX impact**

**Phase 3: Shopify as Source of Truth**
- Use Shopify primitives (products, orders, customers) as source of truth
- Streamline internal workflows
- Empower teams with tools like Shopify Flow
- Simplify daily operations

**Phase 4: Portable App**
- Package Customer Account Extensions into standalone app
- Reusable across multiple colleges/universities
- Scalable solution for higher education market

## Technical Considerations

### SSO Integration
**Shopify Solution**: Multipass SSO API  
**Capability**: Connect to external systems for single sign-on  
**New Option**: Third-party auth now available (need to clarify if university owns login)

### Cart Permalinks Limitation
**Issue**: Don't work with selling plans (subscriptions)  
**Workaround**: May need Cart/Storefront API or iframe on PDP

### Multipass Limitation
**Issue**: Only works with Legacy Customer Accounts  
**Implication**: Must fully migrate to Shopify storefronts + new Customer Accounts in Phase 2

### Subscription Model
**Question**: Can subscription model fit CampusParc's annual permit use case?  
**Requirement**: Cancellation options for annual permits

## Market Opportunity

Both Shopify and CampusParc acknowledge potential to modernize parking solutions for:
- Universities
- Municipalities
- Other institutional parking systems

## Decision-Making Process

**No RFP Required**: CampusParc confirmed no formal Request for Proposal needed  
**Budget Confirmed**: Shopify Plus within budget  
**Key Features**: Exclusive to Plus (features and support levels)

## Stakeholders

**Sarah Choops** - IT Project Manager, Business Solutions Team (primary contact)  
**Makenzie Dodd** - Participant in discovery  
**Julian Smith** - Participant in discovery

## Pricing Considerations

**Platform Fees**: Standard Shopify Plus pricing  
**Credit Card Processing**: Shopify Payments rates  
**VPF (Variable Platform Fee)**:
- D2C transactions
- B2B opportunities possible (leverage workplace database for known customers - potential savings)

## Flags & Warnings

1. **Cart Permalinks**: Don't work with subscriptions - need workaround via Cart/Storefront API or iframe
2. **Multipass**: Legacy Customer Accounts only - requires full storefront migration for new accounts
3. **Phased Approach Critical**: MVP minimizes risk/impact, builds business case before full migration

## Meeting History

**October 2, 2025**: AE intro call with Eli Cadesky  
**February 18, 2025**: Technical discovery with William Bédard

**Last Updated**: October 24, 2025
