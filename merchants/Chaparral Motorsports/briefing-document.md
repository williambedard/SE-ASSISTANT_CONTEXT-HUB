# Chaparral Motorsports - Briefing Document

## Executive Summary

Chaparral Motorsports is a $1.4M automotive/powersports retailer evaluating Shopify Plus. Currently in Demonstrate stage with Very Low close probability and Q4 2025 close target.

**Key Opportunity Metrics:**
- **Revenue**: $1,399,232 USD (contract value)
- **Close Target**: December 31, 2025
- **Stage**: Demonstrate
- **Close Probability**: Very Low
- **Salesforce Opp**: Chaparral Motorsports - Plus

## Merchant Overview

**Company**: Chaparral Motorsports  
**Industry**: Automotive & Powersports Retail  
**Salesforce Account**: 001OG00000y5PjQYAU

## Stakeholders

### Shopify Team
- **AE**: Sarah Roberts (sarah.roberts@shopify.com)
- **SE**: William Bédard (william.bedard@shopify.com)

## Merchant Overview (Updated Oct 27, 2025)

**Company**: Chaparral Motorsports  
**Industry**: Motorsports parts and accessories (motorcycles, ATVs, UTVs)  
**Website**: Custom-built platform (replacement target)

**Business Scale:**
- **Online GMV**: $7-10M annually
- **SKU Count**: 1.4M (includes OEM parts via ARI's PartSmart)
- **Physical Retail**: 1 store (180,000 sq ft showroom/warehouse)
- **Peak Season**: March-June (tax refund season)
- **POS**: PHP POS (on-premise, 3 months old)

**Current Tech Stack:**
- **ERP**: Acumatica (on-premise, dissatisfied with support)
- **PIM**: Perfion (on-premise)
- **Parts Fitment**: ARI's PartSmart (Year/Make/Model + schematics)
- **Marketplace**: Channel Advisor (very satisfied)
- **Payments**: Braintree (~2.1%, no contract)
- **Fraud**: Signifyd (critical - insurance + chargeback management)
- **Email**: Klaviyo (syncs vehicle ownership data)
- **Search**: Algolia (want to keep)
- **Tax**: Avalara
- **Reviews**: TurnTo (Pixlee)
- **Analytics**: Google Analytics
- **Distributors**: Turn 14, multiple drop-ship partners

### Key Stakeholders
**Merchant Team:**
- **Crystal Ashby** - VP of Operations & Marketing (Primary POC)
  - Email: cashby@chaparralmotorsports.com
  - Decision maker, evaluating solo initially
  - Owns: ecommerce ops, marketing, platform decision

**Shopify Team:**
- **AE**: Sarah Roberts
- **SE**: William Bédard

## Current Status (October 27, 2025)

### Discovery Call Completed (Oct 16)
- **Duration**: 1 hour business/technical discovery
- **Outcome**: Comprehensive requirements documented, demo scheduled
- **Tech Stack**: Confirmed all current systems and integration needs
- **Fit Assessment**: Strong Shopify compatibility, clear pain points

### Evaluation Approach
- **Status**: Not actively seeking switch, evaluating if Shopify is better solution
- **Timeline**: No hard deadline
- **Decision Criteria**: 5 factors (performance, TCO, integrations, risk mitigation, cost savings)
- **Migration Timing**: Would hold until post-peak season (after June 2026)

### Critical Requirements Confirmed

**1. Year/Make/Model Fitment** ⭐ CRITICAL
- ARI's PartSmart API integration (1.4M OEM SKUs)
- Schematics viewer with hot-spot selection
- "My Garage" vehicle storage for customers
- **Shopify Solution**: Metafields, YMM partner tools, API-first platform

**2. Organizational Risk Mitigation** ⭐ PRIMARY DRIVER
- Heavy dependency on 1-2 developers who know custom system
- Difficult knowledge transfer
- Developer retention risk
- **Shopify Solution**: Platform knowledge, business user empowerment, no developer backlog

**3. Integration Ecosystem** ⭐ HIGH VALUE
- Partner apps require "a lot of lift" on custom platform
- Each integration needs custom development
- **Shopify Solution**: Pre-built ecosystem (Klaviyo, Algolia, Avalara, Signifyd, etc.)

**4. Freight Shipping**
- Large packages requiring LTL
- **Shopify Solution**: ETL app with 35+ freight providers

**5. Payment Innovation**
- Multiple BNPL options desired
- **Shopify Solution**: Shop Pay Installments + Klarna/Afterpay/Affirm/Katapult
- **Value**: ~5% conversion uplift

### Integration Strategy

**✅ First-Party Available:**
- Acumatica ERP (Shopify partner - can leverage relationship)
- Klaviyo (email marketing + vehicle data)
- Algolia (search - want to keep)
- Avalara (tax)
- TurnTo (reviews)
- Signifyd (fraud - CRITICAL TO KEEP)
- Google Analytics

**⚠️ Verification Needed:**
- Perfion PIM (on-premise API endpoints)
- PHP POS (on-premise API endpoints)
- ARI's PartSmart (fitment API integration method)

**🔧 Middleware/Apps:**
- Dcopify (Channel Advisor ↔ Shopify)
- ETL or similar (freight shipping)
- Partner YMM tools (automotive fitment)

### Demo Scheduled
- **Date**: Tuesday, week of Oct 27, 2025
- **Time**: 10:00 AM Pacific
- **Duration**: 1.5 hours
- **Attendees**: Crystal Ashby (solo), Sarah Roberts, William Bédard

**Demo Focus:**
1. Year/Make/Model backend functionality (PRIMARY)
2. Comparable automotive merchant examples
3. Platform admin (business user empowerment)
4. Integration ecosystem walkthrough
5. Shopify Payments + conversion benefits
6. Mutual evaluation plan alignment

### Outstanding Pre-Demo Actions

**William:**
- [ ] Verify Perfion on-premise API compatibility
- [ ] Verify PHP POS on-premise API compatibility
- [ ] Document Dcopify for Channel Advisor
- [ ] Prepare YMM functionality demo
- [ ] Build/find comparable automotive merchant examples

**Sarah:**
- [ ] Share automotive merchant case studies
- [ ] Send comprehensive BNPL provider list (including Katapult)
- [ ] Share conversion uplift data (5% from Shopify Payments)
- [ ] Provide mutual plan access

**Crystal:**
- [ ] Review mutual plan document
- [ ] Explore pricing calculator in shared sheet
- [ ] Provide 3-month Braintree statements (if pursuing rate negotiation)




