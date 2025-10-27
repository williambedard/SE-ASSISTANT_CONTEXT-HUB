# DAZ Productions - Technical Assessment

## Current Status
Technical scoping in progress. Partner selection between Emila and SG (pitches Oct 25). Implementation planning to begin post-signature (target Oct 31).

## Technical Stack

### Current Platform
- **Platform**: Homegrown (custom-built, 7 years old)
- **Previous Platform**: Magento (migrated off 7+ years ago)
- **Age**: 7 years in production
- **Challenges**:
  - Clunky, difficult to maintain
  - Analytics bottleneck (single person dependency)
  - High maintenance overhead
  - Limited modern eCommerce features

### Required Integrations
1. **PayPal**: Critical for international business (50% revenue)
   - Current concern: Transaction costs
   - Resolution: PayPal parity pricing approved by CEO
2. **Analytics/Reporting**: Major pain point - need robust data access
3. **Shopify Managed Markets**: For international tax/compliance (MOR)
4. **Digital Asset Delivery**: 3D content/software distribution

## Solution Architecture

### Shopify Plus Platform
- **Core Features**:
  - Unlimited products, bandwidth, transactions
  - Advanced reporting and analytics (solves current bottleneck)
  - International scaling (133 countries, multiple languages)
  - Managed Markets for MOR support (50% international revenue)
  - Discount codes, abandoned cart recovery, gift cards
  - Site search, recommendations, predictive merchandising
  - Level 1 PCI DSS compliant
  - Disaster recovery & platform monitoring

### Payment Strategy
- **Primary**: Shopify Payments (17% higher conversion vs other platforms)
- **Critical Secondary**: PayPal (at parity pricing for international customers)
- **Consideration**: International credit card processing costs
  - Shopify rates higher than current homegrown platform
  - Offset by PayPal parity and overall platform cost savings

### International Commerce
- **Shopify Managed Markets**: MOR support for 50% international revenue
- **Benefits**:
  - Simplified international tax/compliance
  - Multiple currencies and languages
  - Localized customer experiences
  - Reduced operational complexity

## Integration Requirements

### Critical
1. **PayPal Integration**: Parity pricing for international transactions
2. **Analytics Platform**: Replace single-person bottleneck with self-service reporting
3. **Managed Markets**: MOR support for international business

### Important
1. **Digital Asset Delivery**: 3D content and software distribution workflows
2. **Customer Data Migration**: Historical customer records and purchase history
3. **Product Catalog**: Digital assets, SKU structure

### Nice-to-Have
*To be determined during partner scoping*

## Migration Strategy

### Phase 1: Partner Selection (Oct 25)
- Evaluate Emila and SG proposals
- Brad to select preferred partner
- Shopify to request partner funding post-selection

### Phase 2: Contract & Planning (Oct 28-31)
- Contract review and signature (target Oct 31)
- Steve to create trial store
- Initial planning with selected partner

### Phase 3: Implementation (Post-Oct 31)
- Will provides 3-month Launch Engineer support
- Partner leads implementation
- Migration from homegrown platform
- International commerce configuration (Managed Markets)
- PayPal integration and testing
- Analytics/reporting setup

### Phase 4: Go-Live
*Timeline to be determined by selected partner*

## Risk Mitigation

### Technical Risks
1. **Data Migration Complexity**: 7-year-old homegrown platform
   - Mitigation: Partner expertise, phased migration approach
2. **International Commerce**: 50% revenue dependent on proper MOR setup
   - Mitigation: Managed Markets tool, PayPal parity pricing
3. **Analytics Transition**: Current dependency on single person
   - Mitigation: Shopify native reporting, self-service analytics

### Business Risks
1. **PayPal Exemption**: Sam advocating for parity pricing exemption
   - Status: In progress, Oct 31 signature helps advocacy
   - Fallback: CEO already approved with parity pricing commitment
2. **Partner Selection**: Choice between Emila and SG
   - Mitigation: Both pitches same day (Oct 25), decision by EOD
3. **Timeline Pressure**: Oct 31 target with Brad's scheduling constraints
   - Mitigation: All key meetings scheduled, contract ready to sign

## Launch Engineer Support

**William Bédard**: 3-month post-signature support
- Technical guidance during implementation
- Shopify best practices
- Troubleshooting and escalation support
- Bridge between merchant, partner, and Shopify internal teams

**Last Updated**: October 24, 2025
