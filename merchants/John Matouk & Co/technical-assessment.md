# John Matouk & Co. - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Salesforce Opportunity**: https://banff.lightning.force.com/lightning/r/Opportunity/0068V000011Ai0nQAC/view  
**Products**: Plus, B2B

## Executive Summary

John Matouk & Co. is a luxury linen company migrating from Spree platform to Shopify Plus. They require a customizable product configurator that works across online and POS systems, with NetSuite Rootstock ERP integration. Target: Q2 launch, Q1 following year go-live.

## Current Technical Stack

**Platform**: Spree  
**ERP**: Rootstock (https://www.rootstock.com/)  
**Payment Gateway**: Stripe  
**POS**: Lightspeed  
**Tax Software**: In place (specific system not named)  
**CRM**: System in place (specific system not named)  
**Inventory Management**: System in place  
**Shipping & Fulfillment**: Existing system  
**Automation**: Power Automate

**Also Evaluating**: Salesforce Commerce Cloud

## Critical Requirements

### Product Configurator (HIGHEST PRIORITY)

**Business Need**: Custom monogramming and configuration for luxury linens  
**Key Requirements**:
- Works across both online store AND POS systems
- Real-time visual feedback for customers
- Material selection, embroidery options, monogram customization
- Set-building functionality (complete coordinated sets on single page)
- Luxury brand aesthetic with high-resolution imagery

**Reference**: Suit Supply configurator cited as desired experience level

### Current Integration

**Rootstock Integration**: Existing automated input for monogrammed orders  
**Control Preference**: Internal team to manage integration (not outsourcing)

## Solution Architecture

### Product Configurator: Two Approaches

#### Option 1: Standard POS UI Extensions
**Implementation**: Using Shopify's native POS UI components  
**Extension Points**:
- `pos.product-details.action.menu-item.render` for "Customize" button
- `pos.product-details.action.render` for full-screen customizer

**Advantages**:
- Native integration with Shopify POS
- Consistent design language
- Simpler implementation
- Better performance
- Easier/cheaper to maintain

**Limitations**:
- May not support complex visual feedback for luxury linens
- Limited ability for real-time material combination previews
- Restricted flexibility vs. Suit Supply-like experience
- Constrained to Shopify POS primitives

#### Option 2: App Bridge POS Extension (RECOMMENDED)
**Implementation**: Standalone web application embedded via App Bridge

**Architecture**:
- Custom web app with high-resolution fabric imagery
- POS extension launches web app within POS interface
- Responsive design matching luxury brand aesthetic
- Real-time visual feedback for all selections

**User Flow**:
1. Customer discusses customization with staff
2. Staff locates product in POS
3. Launch custom configurator via App Bridge
4. Interactive visual interface shows real-time previews
5. Staff helps build complete sets with complementary items
6. Configuration sent to POS cart with manufacturing details
7. Order flows automatically to Rootstock

**Advantages**:
- Complete flexibility for luxury customization experience
- High-resolution fabric visualization
- Real-time previews
- Suit Supply-like experience achievable
- Consistent online/in-store experience
- Premium brand positioning

**Limitations**:
- More complex implementation
- Higher investment upfront
- More maintenance required from agency (Vizio)

### Data Handling

**Metaobjects Approach**:
- Store complex configuration options
- Metafields for fabric types, colors, embroidery styles, monogram options
- Relationships between complementary products for set completion
- Seamless Rootstock integration for manufacturing specs

**Line Item Properties**:
- Store customization options
- Integrate with Rootstock for automated processing

## Agency Partner Requirements

**Must Have**: Experience in luxury category  
**Currently Evaluating**: Astound Digital, Vizio

## Integration Priorities

### Must-Haves
- Rootstock ERP (internal team managing)
- Lightspeed POS integration with configurator
- Stripe (or Shopify Payments comparison)
- Product configurator across all touchpoints

### Should-Haves
- Salesforce Marketing Cloud integration
- Salesforce Service Cloud integration
- Apple Pay

## B2B Considerations

**Current**: Hotels use EDI  
**Future**: May use Shopify B2B features for designers and small businesses (not hotels initially)

## International Expansion

**Growth Markets**: International expansion planned  
**Target Customers**: Interior designers, hotels, D2C outside US

## Implementation Considerations

### Performance Optimization
- Optimize high-resolution fabric images for in-store loading
- Efficient caching strategies for product configuration options

### Testing Strategy
- Thorough testing with actual store staff using POS
- Validate complete customer journey across online and in-store channels

## Pricing & Platform

**Variable Platform Fee**:
- D2C transactions: 35 basis points
- Retail transactions: 25 basis points
- B2B transactions: 18 basis points

**Payment Processing**: Open to Shopify Payments, want to compare to Stripe rates  
**Note**: Using own Stripe account incurs additional 20 basis points per transaction

## Revenue Goals

Target: 22% month-to-date increase in revenue

## Meeting History

**January 29, 2025**: AE sync meeting  
**February 5, 2025**: Discovery call - POC demo discussions, POS infinite options exploration

## Next Steps

1. Demo: Enhanced demo store with product selection add-ons
2. Test Monogram app (https://apps.shopify.com/my-easy-monogram)
3. Recipe exploration: Saving user selections/designs in Customer Account Extension
4. POS UX testing with product configurator apps (Zepto, Globo)
5. Custom web app + POS extension development decision

**Last Updated**: October 24, 2025
