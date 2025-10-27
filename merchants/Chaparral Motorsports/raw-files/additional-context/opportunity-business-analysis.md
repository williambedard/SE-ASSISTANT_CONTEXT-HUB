---
**NOTE: This is a PRE-DISCOVERY analysis document created before the October 16, 2025 discovery call.**  
**Status: SUPERSEDED by actual discovery data. See `/raw-files/documents/technical-assessment.md` for confirmed details.**  
**Retention Purpose: Historical reference for prep work and hypothesis validation.**
---

Stakeholders
- Chaparral Motorsports
  - Crystal Ashby — VP of Operations and Marketing. Owns the website replatforming decision, ecommerce operations, marketing, and likely cross-functional coordination with parts, logistics, and retail.
  - Likely stakeholders to confirm on the next call:
    - IT/Engineering Lead (owner of the custom site and integrations)
    - Ecommerce/Digital Product Manager (catalog, merchandising, conversion)
    - Parts/OEM Catalog Manager (fitment data, schematics, supersessions)
    - Logistics/Shipping Manager (carriers, freight/LTL, packing rules)
    - Retail/Store Ops Lead (POS processes, inventory sync)
    - Finance/Payments Lead (payments, BNPL, risk/fraud)
- Shopify
  - Sarah Roberts — Account Executive
  - You — Solutions Engineer (discovery, solution design, migration plan, demo)

GMV
- D2C online: $7–10M annual GMV (current custom platform)
- Retail/POS: present (recent PHP POS implementation), revenue unknown
- B2B/Wholesale: not indicated (confirm)

Pain points
- Custom website is tedious to maintain/update; high engineering overhead
- Partner/app integrations are hard and time-consuming on the custom platform
- Managing automotive fitment (Y/M/M, possibly VIN) is complex
- Need to integrate an OEM parts schematics/microfiche viewer seamlessly into shopping/checkout
- Shipping engine needs improvement, especially for oversized/freight (LTL) rating and packing rules
- Desire to add/expand BNPL options

techstack
- Ecommerce: Custom-built site (storefront, catalog, checkout)
- POS: PHP POS (in-store sales; inventory and customer management TBD)
- Fitment: Custom/unspecified source and tooling for Y/M/M (standards such as ACES/PIES not confirmed)
- OEM schematics viewer: Custom or licensed microfiche/diagram solution (adds OEM parts to cart; integration path TBD)
- Shipping: Current engine unknown; needs freight/LTL and dimensional packing improvements
- Payments: Current processor unknown; interested in Shopify Payments and Shop Pay; wants more BNPL options
- OMS/WMS/ERP/PIM/Tax/Analytics/Marketplace: Not specified (confirm)

A tailored approach for discovery (targeted questions)
Fitment and catalog
- What standards and sources power fitment today (ACES/PIES, SEMA Data, Epicor, TecDoc, OEM feeds)? Update cadence?
- Do you need VIN lookup or only Year/Make/Model/Trim/Engine?
- How many SKUs/part numbers (OEM vs aftermarket)? How are supersessions and compatibility exceptions handled?
- Do you want to enforce compatibility in cart/checkout or only guide via filters?
- Where does fitment data live today (DB, PIM, files), and do you plan to continue owning it or leverage a 3rd-party app/service?

OEM schematics viewer
- Which solution/vendor is used for diagrams? What are the licensing and API/embedding options?
- Can the viewer pass “add to cart” line items with quantities/notes into the ecommerce cart via API?
- How do you handle superseded parts, NLA parts, dealer cost/MAP updates, and availability within the viewer?
- Do you need SEO-friendly diagram/assembly pages or are they behind search/UI only?

Shipping and fulfillment
- Carriers used today (parcel and LTL). Current rating method (live rates, table rates, negotiated)?
- Do you require dimensional packing, freight class, residential liftgate, limited access, hazmat?
- Multi-origin fulfillment, drop-ship from distributors (e.g., Parts Unlimited, WPS, Tucker)? Any EDI feeds?
- Do you split shipments or backorder partials? Service-level promises you must maintain?

Payments and BNPL
- Current processor(s), AOV, share of BNPL today, preferred BNPL providers (Shop Pay Installments, Affirm direct, Klarna, Afterpay)?
- Pre-authorization vs capture needs (e.g., backorders, special orders)? Fraud prevention tools and chargeback rate?
- Any category restrictions we should be aware of with BNPL providers?

Retail/POS and inventory
- Scope of PHP POS: inventory source of truth, purchase orders, customer profiles, gift cards/loyalty? Connector in place?
- Do you want to keep PHP POS and sync with Shopify, or consider Shopify POS Plus later?
- Any in-store fitment/fiche lookup needs tied to POS workflows?

Operations/stack and project
- Existing OMS/WMS/ERP/PIM/tax (Avalara/TaxJar) and analytics tools? Any middleware (Celigo, Mulesoft, Boomi)?
- Internal dev resources vs partner reliance; preferred SI; timeline/critical dates; budget and phasing tolerance (MVP vs big-bang)
- SEO and migration constraints (URL redirects, organic traffic dependencies, legacy content)

Key Talking Points
- Lower total cost and faster pace: Shopify Plus removes the platform maintenance burden (hosting, PCI, security, updates) and replaces custom engineering with configuration and apps.
- Fitment and OEM diagrams are proven patterns on Shopify: we’ll use a data-backed fitment model and embed your schematics viewer to add parts directly to cart, including supersessions and compatibility checks.
- Freight-ready shipping: partners like ShipperHQ or Intuitive Shipping handle dimensional packing, accessorials, and LTL rating; multi-origin and dropship workflows are supported.
- Conversion lift with Shop Pay: accelerated checkout across Apple Pay/Google Pay/PayPal and Shop Pay Installments to increase approval rates and AOV.
- Keep your POS path flexible: continue with PHP POS now and sync inventory/orders, or move to Shopify POS Plus later without replatforming again.
- Phased, low-risk migration: launch core D2C quickly, then layer in advanced fitment, schematics, and freight complexity in controlled phases.

Integration capability
- Fitment: Two viable approaches
  - App-first: leverage a specialized automotive fitment app/service (e.g., ACES/PIES-compatible) to power Y/M/M filters, mapping, and product tags/metafields.
  - Custom app: build a private app to ingest your ACES/PIES or OEM mapping, store it in Shopify (metafields, product data), power Y/M/M selectors, and validate at cart/checkout via Functions.
- Schematics viewer: Typically embedded via iframe or a custom app block. Use Storefront/Cart APIs to add selected parts, handle supersessions, and show availability/pricing. If the current viewer lacks modern APIs, we can still integrate via a gateway service or deep links.
- Shipping/freight: ShipperHQ or Intuitive Shipping integrate with Shopify’s Carrier Service API to provide parcel + LTL rating, dimensional packing, accessorials, and advanced rules. Common LTL carriers are supported. Custom rating endpoints are also possible.
- POS/Inventory: If PHP POS has an API/connector, we can enable bi-directional sync (products, inventory, customers, orders) via middleware (e.g., Celigo, Patchworks, VL OMNI) or a lightweight custom connector.
- Payments/BNPL: Shopify Payments with Shop Pay and Shop Pay Installments is native; you can also add Affirm or Klarna if needed. Note: third-party payments may incur additional Shopify transaction fees relative to Shopify Payments.
- Rare friction points: Legacy/locked-down microfiche tools without APIs; niche POS systems with limited data models; but both are solvable with middleware or phased approaches.

Value proposition
- Reduce complexity and cost: Move from a brittle custom stack to a scalable, secure, auto-updating platform with a deep app ecosystem and enterprise APIs.
- Purpose-built for automotive complexity: Support for ACES/PIES-style fitment, custom app extensions, and embedded schematics experiences to sell OEM and aftermarket parts confidently.
- Better checkout and higher conversion: Shop Pay and accelerated wallets deliver measurable conversion gains, with native BNPL to boost approval rates and AOV.
- Operational control for shipping: Enterprise-grade rating and rules for freight, dimensional packing, and multi-origin/dropship—without custom code sprawl.
- Flexible omnichannel: Keep PHP POS or adopt Shopify POS Plus later; unify inventory, customers, and orders over time.
- Faster time-to-value: Launch core commerce quickly, then iterate on fitment, schematics, and freight in phases—minimizing risk and disruption while capturing upside sooner.