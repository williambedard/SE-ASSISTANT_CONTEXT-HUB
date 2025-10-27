# The Watkins Company - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Notebook LM**: https://notebooklm.google.com/notebook/7d02b8d0-af32-49ff-a45a-c67878a772bf  
**Website**: https://www.watkins1868.com/

## Executive Summary

The Watkins Company is migrating from NetSuite SuiteCommerce to Shopify Plus to consolidate storefronts, simplify operations, and modernize their D2C experience while accommodating a legacy Home-Based Business (HBB) consultant model. Target launch: early March 2026.

## Current Technical Stack

**Platform**: NetSuite SuiteCommerce  
**ERP**: NetSuite  
**Payment Processing**: CyberSource/FreedomPay (gateway sprawl)  
**Tax**: Sovos (recently renewed 1-year contract October 2025)  
**CRM/Support**: LiveHelpNow (live chat/AI), NetSuite-integrated web forms  
**Content Sites**: Fragmented, need consolidation

## Solution Architecture

### Core Infrastructure
- **Platform**: Shopify Plus with Online Store 2.0
- **Markets**: Multi-currency/localization for US & Canada
- **Payment Gateway**: Shopify Payments (replace gateway sprawl)
- **Tax Solution**: To be determined (Avalara vs Vertex vs Sovos contract overlap)

### Home-Based Business (HBB) Consultant Model

**Challenge**: Thousands of independent consultants with unique URLs, tiered discounts, and commission tracking  
**Solution Approach**:
- **Consultant Attribution**: Unique storefront URLs (e.g., `watkins1868.com/myname`)
- **Discount Model**: Tiered discounts (up to 35%) based on account setup, not promo codes
- **Commission Portal**: Custom read-only analytics/reporting portal for consultants
- **Order Processing**: Consultant ID captured at checkout without confusing D2C customers
- **App Recommendation**: Go F Pro (affiliate-style attribution with auto-discounts)

### Integration Requirements

**NetSuite ERP Integration**:
- Bidirectional sync (orders, inventory, pricing, images)
- Clear field mapping with reliable error handling
- Eliminate one-day pricing/product update delay (current pain point)
- Support for immediate or scheduled changes (Flow/Launchpad)

**Commission Reconciliation**:
- **Current**: Manual 2-3 day month-end process
- **Future**: Automated commission calculation & payout
- **Tracking**: Custom Commission tracking portal with consultant-level reporting

**Tax Platform Integration**:
- Evaluate Avalara/Vertex demos showing full Shopify ↔ NetSuite flow
- Address Sovos contract overlap (renewed October 2025)

### Key Integrations
- **Email Marketing**: Klaviyo (interest expressed)
- **Customer Service**: Migrate LiveHelpNow + Contact Us forms + FAQ
- **Store Locator**: "Where to Buy" feature (compatibility to be assessed)

## Data Migration

- **Consultant URLs**: Thousands of unique URLs (many tied to paid ads)
- **Pricing/Products**: All pricing, images, product data from NetSuite
- **Customer Data**: Consultant accounts with tier/discount levels
- **Order History**: As needed for commission reconciliation

## Critical Path & Risks

### Bottleneck #1: Requirements Documentation
**Status**: Fair ✅  
**Impact**: Blocks timeline estimation  
**Mitigation**: Follow up in demos (10/29 payments, 11/6 platform)

### Bottleneck #2: Design Expectations (CRITICAL DECISION)
**Status**: Critical decision point 🎯  
**Options**:
- **Option A**: Reuse existing Shopify marketing site assets → 4-6 months
- **Option B**: Custom design from scratch → 6-9 months
**Impact**: 3-month timeline swing  
**Action**: Present design trade-offs clearly in 11/6 demo, get Emily's buy-in

### Partner Dynamics
- **Partner**: Sultans
- **Model**: 50/50 partnership (internal IT + agency)
- **Timeline Alignment**: Sultans aligned on 5-6 month minimum (realistic)
- **Expertise**: Strong direct sales/HBB model experience

## Implementation Timeline

**Target Go-Live**: Shortly after first week of March 2026  
**Estimated Duration**: 17-20 weeks (4-5 months)  
**Phased Rollout**: Under consideration (D2C first, then HBB pilot) to de-risk

## Requirements Summary

### Must-Haves
- D2C-first UX with brand consistency
- Thousands of consultant URL redirects
- Real-time inventory & order sync with NetSuite
- Automated commission tracking
- Consolidated tax filings
- Unified reporting & analytics

### Should-Haves
- Consultant read-only analytics portal
- Immediate pricing/content updates (vs 1-day delay)
- Native automation (Flow/Launchpad)
- Multiple experiences (US/CA D2C + US/CA HBB) under one domain

### Technical Challenges
- Highly customized NetSuite mapping
- HBB downline/tiers logic
- Sovos contract overlap (tax solution decision)
- Timeline pressure (hit March launch window)

## Reporting Requirements

- Orders by State/Province
- Orders by item
- Number of orders by customer type (D2C vs HBB) and country
- Sales by customer type and country

## Meeting History

**October 15, 2025**: Technical discovery with Tyler Kiel (PM), Emily Hughes (Design), Kevin/Robert/Tou (IT), Vicki (CX)  
**October 23, 2025**: Risk assessment updated, bottlenecks identified

**Last Updated**: October 24, 2025
