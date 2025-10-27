# Injectors Direct - Technical Assessment

**Last Updated**: October 24, 2025 (synced from Drive)  
**Notebook LM**: https://notebooklm.google.com/notebook/cb39ec2f-5a24-4c26-84c0-bd17d5f4ed99  
**Demo Store**: https://will-us-catalogs.myshopify.com/  
**Demo Repo**: https://github.com/williambedard/wills-us-catalogs/tree/injectors-direct-demo

## Executive Summary

Injectors Direct is a $25M/year diesel truck parts distributor migrating from WooCommerce to Shopify. They require a sophisticated **core deposit management system** where customers purchase remanufactured parts and must return old "cores" (used parts) to avoid deposit charges.

**Markets**: US, CA, Mexico, AU

## Core Deposit Business Model

### Deposit Structure
**Injectors**: $100 per injector  
**High Pressure Fuel Pumps**: $200 per pump  
**Fuel Lines**: $100 per set
- **Duramax 2001-2010**: 8-piece sets
- **Cummins 2019-current**: 6-piece sets

### Payment Options

#### Option 1: Credit Card Hold (Card on File)
- Hold placed on credit card (no immediate charge)
- **28 days**: Return cores to release hold
- **28-60 days**: Card charged, cores eligible for full refund if intact
- **60-120 days**: 75% refund for intact cores
- **120+ days**: No refund (contact for options)

#### Option 2: Pay Deposit Upfront
- Credit card charged immediately for deposit amount
- **60 days**: Full refund for intact returned cores
- **60-120 days**: 75% refund for intact cores
- **120+ days**: No refund (contact for options)

#### Option 3: Return Cores First
- Customer ships old cores before ordering
- No deposit charged
- Order ships when cores received

### Core Return Requirements
- **Condition**: Physically intact, rebuildable
- **Packaging**: Original protective caps and packaging preferred
- **Matching**: Like-for-like cores (same engine model as replacement)
- **Damage**: Disassembled/damaged cores receive partial credit only

## Technical Implementation (COMPLETE SYSTEM)

### System Architecture

**Current Status**: Full production-ready deposit management system implemented on demo store  
**Complexity Level**: Advanced (bundle synchronization, custom pricing, metafield-driven calculations)

### Core Components

#### 1. Deposit Variant Picker Block
**File**: `blocks/deposit-variant-picker.liquid`

**Functionality**:
- Product filtering (only shows for products with `has_deposit_options` tag)
- Metafield integration for deposit amount calculations
- Dynamic UI updates based on selected payment option
- Form validation (prevents checkout without deposit selection)
- Sequential cart addition (main product → deposit product)
- Bundle creation with unique timestamp-based IDs
- 20+ customizable schema settings

**Metafield Structure** (Current - Flat Amounts):
```liquid
{{ variant.metafields.custom.deposit_for_injectors.value }}          // $450.00
{{ variant.metafields.custom.deposit_for_fuel_lines.value }}         // $100.00
{{ variant.metafields.custom.deposit_for_high_pressure_fuel_pumps.value }} // $200.00
```

#### 2. Cart Bundle Management
**File**: `assets/component-cart-items.js`

**Functionality**:
- Bundle synchronization (deposit quantities match main product)
- Orphan cleanup (removes deposits when main products deleted)
- API integration (`/cart.js`, `/cart/change.js`)
- Section re-rendering after sync operations
- Error handling for failed cart operations

#### 3. Cart Display Templates
**Files**: `snippets/cart-products.liquid`, `snippets/cart-summary.liquid`

**Features**:
- Unit price display (custom `_display_price` for deposits)
- Subtotal calculations (manual quantity × custom unit price)
- Control restrictions (disabled quantity/removal for deposit products)
- Cart total override (custom calculation including deposits)
- Property filtering (hides technical `_` prefixed properties)

### Bundle Linking System

**Main Product Properties**:
```javascript
{
  'deposit_option': 'credit_card_on_file',
  'bundle_id': '1703876543210'  // Clean timestamp
}
```

**Deposit Product Properties**:
```javascript
{
  '_display_price': '$900.00',
  'bundle_id': '1703876543210',  // Matching ID
  '_is_deposit': 'true'
}
```

### Cart Behavior

**Adding Products**: Main + deposit added simultaneously with matching quantities  
**Quantity Changes**: Deposit quantities auto-sync to main product  
**Product Removal**: Removing main product removes corresponding deposit  
**Deposit Control**: Deposit products cannot be edited directly (disabled)  
**Visual Indicators**: Clear messaging about automated deposit control

## Critical Technical Limitations & Workarounds

### PRICING CALCULATION WORKAROUNDS (CURRENT)

**Challenge**: Current system uses client-side template workarounds for custom deposit pricing.

**Cart Item Subtotal Workaround** (`snippets/cart-products.liquid`):
```liquid
# WORKAROUND: Manual subtotal calculation
assign custom_unit_price_str = custom_price_display | remove: '$' | remove: ','
assign custom_unit_price_cents = custom_unit_price_str | times: 100
assign custom_line_price_cents = custom_unit_price_cents | times: item.quantity
```

**Cart Total Workaround** (`snippets/cart-summary.liquid`):
```liquid
# WORKAROUND: Manual cart total bypassing cart.total_price
# Loop through items, sum regular products + custom deposit pricing
```

**⚠️ Why These Are Workarounds**:
- **Theme-Only Logic**: Pricing only works in cart templates, not during checkout
- **No Server Validation**: Custom pricing not validated server-side
- **Checkout Disconnect**: Shopify checkout uses actual product prices, not custom displays
- **Manual Maintenance**: Complex template logic bypasses Shopify's cart calculations

### PROPER SOLUTION: Shopify Functions Required

**Cart Validation Function** (Mandatory for Production):
```javascript
export default (input) => {
  // Validate deposit product pricing against metafield calculations
  // Ensure main products have corresponding deposits
  // Verify bundle_id consistency and quantities
  return { errors };
};
```

**Cart Transform Function** (Recommended):
```javascript
export default (input) => {
  // Transform deposit pricing based on main product metafields
  // Update quantities for bundle synchronization
  // Apply correct deposit amounts server-side
  return { operations };
};
```

**Benefits**:
- ✅ Server-side validation during checkout
- ✅ Performance (no client-side calculations)
- ✅ Reliability (consistent cart ↔ checkout pricing)
- ✅ Maintainability (centralized logic)
- ✅ Scalability (proper architecture for complex pricing)

## SYSTEM UPGRADE: Quantity-Based Metafields

### Current Limitation
Flat dollar amounts in metafields don't scale with varying quantities/configurations.

### Recommended Upgrade: Quantity-Based Structure

**New Metafield Structure**:
```liquid
{{ variant.metafields.custom.quantity_injectors.value }}           // 4
{{ variant.metafields.custom.quantity_fuel_lines.value }}          // 8
{{ variant.metafields.custom.quantity_fuel_pumps.value }}          // 1
{{ variant.metafields.custom.fuel_line_type.value }}               // "duramax_2001_2010"
```

**Rate Structure**:
```javascript
const DEPOSIT_RATES = {
  injector: 100,           // $100 per injector
  fuel_pump: 200,          // $200 per fuel pump
  fuel_lines: {
    duramax_2001_2010: { rate: 100, set_size: 8 },
    cummins_2019_current: { rate: 100, set_size: 6 }
  }
};
```

**Enhanced Calculation**:
```javascript
function calculateDepositAmount(variantMetafields) {
  let totalDeposit = 0;
  
  // Injectors: $100 × quantity
  totalDeposit += (variantMetafields.quantity_injectors || 0) * DEPOSIT_RATES.injector;
  
  // Fuel pumps: $200 × quantity
  totalDeposit += (variantMetafields.quantity_fuel_pumps || 0) * DEPOSIT_RATES.fuel_pump;
  
  // Fuel lines: Rate based on type and quantity (set-based)
  const fuelLineQty = variantMetafields.quantity_fuel_lines || 0;
  const fuelLineType = variantMetafields.fuel_line_type;
  if (fuelLineQty > 0 && DEPOSIT_RATES.fuel_lines[fuelLineType]) {
    const config = DEPOSIT_RATES.fuel_lines[fuelLineType];
    const sets = Math.ceil(fuelLineQty / config.set_size);
    totalDeposit += sets * config.rate;
  }
  
  return totalDeposit;
}
```

**Benefits**:
1. Accurate scaling with actual quantities
2. Flexible configuration for new part types
3. Set-based logic (8-piece vs 6-piece fuel lines)
4. Business logic centralization
5. Future-proof for complex combinations

### Impact on Cart Calculations

**Current (Workarounds Required)**:
```liquid
<!-- Manual cart total calculation -->
assign custom_unit_price_str = custom_price_display | remove: '$'
assign custom_line_price_cents = custom_unit_price_cents | times: item.quantity
```

**Upgraded (Standard Shopify)**:
```liquid
<!-- Standard Shopify pricing works automatically -->
{{ item.final_line_price | money }}
{{ cart.total_price | money }}
```

### Admin & Draft Order Benefits

**Current Limitation**:
- Deposit variants have $0.00 unit prices
- Draft orders show $0.00 for deposits
- Admin can't see actual deposit costs
- Quantity changes don't reflect in totals

**Quantity-Based Solution**:
- Each deposit variant gets real unit price
- Draft orders show actual deposit costs per unit
- Quantity changes automatically update totals
- Admin sees real pricing for manual orders

**Admin Draft Order Example**:
```
Main Product: Injector Set (6 pieces) - $2,400.00
├─ Injector Cores (6 × $100) - $600.00    ← Real unit pricing
├─ Fuel Pump Core (1 × $200) - $200.00    ← Visible in admin
└─ Total: $3,200.00                        ← Accurate totals
```

## Shopify Functions Impact

### Current System (Complex Functions Required):
**Heavy Cart Transform Function** needed for pricing manipulation (~200+ lines)

### Quantity-Based System (Lightweight):
**Simple Cart Validation Function** for business rules only (~50 lines)

| Aspect | Current | Quantity-Based |
|--------|---------|----------------|
| **Price Manipulation** | ✅ Required | ❌ Not needed |
| **Metafield Calculations** | ✅ In function | ❌ Pre-calculated |
| **Cart Transform** | ✅ Heavy ops | ❌ Not required |
| **Validation Only** | ❌ Mixed | ✅ Pure logic |
| **Function Weight** | 🔴 Heavy | 🟢 Light |
| **Performance** | 🔴 Complex | 🟢 Simple |
| **Maintainability** | 🔴 Mixed concerns | 🟢 Single responsibility |

## Integration Requirements

**ERP**: Fishbowl  
**Requirements**:
- Real-time inventory updates
- Order hold/release for "Return Cores First" option
- Core tracking and processing workflow
- Reporting on deposit status and aging

## Payment Processing

**Current**: Authorize.net  
**Future**: Shopify Payments  
**Target Rate**: Maintain or improve 1.90% processing rate  
**Reduce Chargebacks**: Through clearer customer experience

## Migration Requirements

**Transition Period**: 30-60 day overlay  
**Challenge**: Handle customers with existing deposits on old system  
**In-Flight Workflows**: Preserve all deposit workflows during migration  
**Data Continuity**: Customer payment methods must be maintained  
**Timeline**: Live by end of year/early next year (winter quiet period)

## Business Volume

- 30,000-40,000 orders per year
- $1,300-$1,400 average order value
- $2-3 million monthly transactions
- High-value deposits ($100-$900 per order)

## Performance Optimizations

- Removed verbose console logging
- Clean bundle ID structure (timestamp only)
- CSS-based description switching (not JavaScript)
- Minimal DOM re-rendering
- Cart bubble removed (eliminated sync timing issues)

## Migration Path to Production

1. **Create quantity-based metafields** for all variants
2. **Update deposit calculation logic** to quantity × rate formulas
3. **Set real unit prices** on deposit variants (replacing $0.00)
4. **Remove cart calculation workarounds** from templates
5. **Test draft order creation** for admin functionality
6. **Update business processes** to leverage accurate admin pricing
7. **Implement Shopify Functions**:
   - Phase 1: Cart Validation Function
   - Phase 2: Cart Transform Function (if needed)
   - Phase 3: Cleanup template workarounds

**Last Updated**: October 24, 2025
