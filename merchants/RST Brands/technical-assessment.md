# RST Brands (RST Outdoor) - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Salesforce Opportunity**: https://banff.lightning.force.com/lightning/r/Opportunity/0068V00000zOEP8QAO/view  
**Products**: Plus

## Executive Summary

RST Brands operates multiple business units selling outdoor furniture and related products. Currently on NetSuite SuiteCommerce, migrating to D365 ERP, and evaluating Shopify Plus for e-commerce. Multiple storefronts required (Flow Wall, RST brands).

## Current Technical Stack

**Platform**: NetSuite SuiteCommerce  
**Contract**: Through August 2026 (blocker - fear of unknown with migration)  
**ERP**: Currently NetSuite, migrating to Microsoft Dynamics 365  
**European Operations**: Odoo ERP (painful integration)  
**Agency**: Task Husky (current shop enhancements)

## Business Context

**E-Commerce Manager**: Tate (SEO work focus)  
**Internal Capabilities**: Some frontend work possible with internal team  
**Other Business Units**: Portfolio includes other companies - one felt Optimizely was "big mistake" (indirectly favors Shopify)

## Solution Architecture

### Two-Store Setup (RECOMMENDED)
- **Store 1**: Flow Wall brand
- **Store 2**: RST brands
- Both integrated with D365 ERP

### ERP Integration Priority

**Target ERP**: Microsoft Dynamics 365  
**Integration Approach**: D365 plays best with Shopify B2B (noted by Kai, Shopify B2B)  
**Alternative ERP**: Acumatica also plays well with Shopify B2B

**Middleware Preference**: "Skip Celigo or another middleware" (direct integration preferred)

### B2B Requirements

**Key Need**: Pricing rules and customer group management  
**Challenge**: Ensure trade customers not charged more than D2C customers during promotional periods  
**Shopify Support**: Kai (Shopify B2B) assigned to support implementation

## PIM Considerations

**Selected PIM**: InRiver  
**Concern**: "Not the most common or well-supported choice" - lack of familiarity and internal knowledge  
**Action Item**: Follow up with dev team to understand selection rationale and knowledge base

## Marketplace Channels

**Current**:
- **Amazon**: Currently challenging
- **eBay**: Poor performance
- **Walmart**: New channel

## Agency Evaluation

**Currently Evaluating**: Broken Rubik, Silk, Taffy  
**Status**: Gathering quotes this week  
**Timeline**: Aiming to finalize agency selection and present to Martin (owner of Syria) for decision-making

**Note on Pricing**: Taffy's quote 4× higher than other companies

## Implementation Timeline

**ERP Migration**: Summer and early fall (D365 migration)  
**Shopify Project**: Running in parallel with ERP migration  
**Goal**: Complete everything in fall  
**Decision Timeline**: End of week for recommendations to owners

## Integration Ecosystem

### Marketing & Analytics
**Apps Discussed**:
- **List Track**: Mentioned, but "doesn't have track record of Klaviyo"
- **Fizzle**: Discussed for specific use case

### Payment Processing
**PayPal**: "Don't think they'll do PayPal"

## Decision-Making Process

**Key Stakeholder**: Martin (owner of Syria business unit)  
**Process**:
1. Kody presents architecture plan + quotes Monday weekly touchbase
2. Martin calls agency references
3. Final recommendation to owners by end of week

**Current Blocker**: NetSuite SuiteCommerce contract through next August + migration fears

## Next Steps & Action Items

1. Kody to finalize agency selection (Broken Rubik, Silk, Taffy)
2. Present project overview to Martin with quotes and references
3. Follow up with dev team on InRiver PIM selection rationale
4. William to send:
   - Cool bells and whistles (diagrams, etc.) for project overview
   - Microsoft D365 and Shopify middleware link

## Meeting History

**October 16, 2025**: Initial meeting - SuiteCommerce contract blocker identified  
**June 4, 2025**: B2B requirements discussion with Kai (Shopify B2B), Will  
**June 4, 2025**: Architecture review with Kody, William, Martin

**Last Updated**: October 24, 2025
