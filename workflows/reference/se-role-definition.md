# Solutions Engineer Role Definition

**Organization:** Shopify Commercial  
**Last Updated:** October 2025  
**Note:** Merchant Success Managers are now called Customer Success Managers (CSMs) as of July 1, 2025

> **💡 MM SE Playbook:** For a comprehensive snapshot of the MM SE approach (sales process, discovery, demoing, tooling, etc.), see [`se-playbook-reference.md`](./se-playbook-reference.md) or access via:  
> `@gworkspace Read file 1mhfgBFdrhrnxseelSJYUi2d7H_TVm50oIxok1tROtM4`

---

## Role Overview

### Primary Purpose
**Own the technical win in the sales cycle:** qualify, de-risk, and design a viable Shopify solution that meets business and technical requirements so the buyer can say "yes" with confidence.

**Translation:** Translate merchant objectives into a feasible architecture on Shopify (native first), quantify trade-offs, and secure stakeholder alignment across merchant, partner, and internal teams.

---

## Key Responsibilities Across Merchant Lifecycle

### Early Evaluation
- Qualify technical fit
- Surface constraints
- Advise on best-practice patterns
- Shape RFPs

### Solution Design
- Lead technical discovery
- Map requirements
- Propose architectures
- Produce solution materials
- Validate feasibility with product/engineering as needed

### Proof and Validation
- Demos and targeted demonstrations
- Prototypes/POCs for feasibility
- Reference architectures
- Security/compliance guidance
- Integration strategy
- TCO/ROI framing

### Commit/Contracting
- Finalize solution assumptions
- Document dependencies
- Define acceptance criteria
- Prepare handoff artifacts for delivery

### Implementation Advisory
- **Limited, milestone-based advisory** to keep implementation aligned with the sold solution
- Not day-to-day implementation management
- Platform validation and unblocking
- **Tracked via Salesforce Launch Cases** (RecordType = "Launch")

### Launch Readiness
- Participate in go-live checks
- Focus on platform fit and non-functional readiness
- Validate performance, scale, support pathways
- **Complete launch readiness checklist** before go-live approval

### Post-Launch Exit
- Hand off ongoing ownership to CSM (adoption/expansion)
- Support handles incidents
- **SE exits launch + 0-2 weeks** after go-live validation
- **SE re-engages only for net-new scope**

---

## Post-Sales Deep Dive: Launch Case Management

### What is a Launch Case?

**Salesforce Object:** Case (RecordType = "Launch")

**Purpose:** Track SE post-sales implementation advisory from contract signing through go-live and CSM handoff

**Key Distinction:**
- **Opportunity** = Pre-sales work (discovery → contract)
- **Launch Case** = Post-sales work (implementation → go-live → exit)

### Launch Case Lifecycle

**Typical Statuses:**
1. **Awaiting Handover** - Case created but not yet assigned to SE
2. **Explore** - Initial discovery and scoping phase, implementation planning
3. **Build** - Implementation in progress, SE available for platform questions
4. **Test** - Solution built, UAT in progress, launch prep starting
5. **Launch** - Go-live imminent or recently completed, SE providing launch support
6. **On Hold** - Implementation paused temporarily, waiting on merchant
7. **Closed** - Launch complete, CSM handoff done, SE exited

**Duration:** 4-12 weeks from kickoff to closure (varies by complexity)

### SE Advisory During Implementation

**SE Role:** Consultative platform advisor - NOT project manager or implementation owner

**Partner/Agency Owns:**
- Implementation plan and timeline
- Migration execution
- Theme/app development
- Project management
- Launch readiness validation

**SE Provides:**
- Platform guidance when consulted
- Answers to Shopify-specific questions
- Architectural advisory (when asked)
- Escalation to Shopify support if needed

**SE Does NOT:**
- Define implementation milestones
- Own project timeline
- Validate completion of tasks
- Execute hands-on configuration
- Manage partner/merchant work

**Typical SE Involvement:**
- Kickoff call: Review pre-sales context with partner
- Ad-hoc consultations: Answer platform questions as they arise
- Launch day: Available for platform questions/escalations

**See:** [`launch-case-management.md`](../core/launch-case-management.md)

### Launch Day Support

**SE Role:** Available for platform questions if partner/merchant needs assistance

**SE Availability:**
- Available during business hours on launch day (if scheduled)
- Answer platform-specific questions
- Escalate to Shopify Plus support if needed

**SE Does NOT:**
- ❌ Execute DNS cutover or store configuration
- ❌ Validate launch readiness (partner's responsibility)
- ❌ Troubleshoot merchant/partner code
- ❌ Manage launch logistics
- ❌ "Monitor" the launch - only reactive support

### CSM Handoff Process

**Timing:** Launch + 0-2 weeks

**Handoff Trigger:** 
- Launch complete and stable
- Post-launch issues resolved or documented
- No critical blockers

**Handoff Deliverables:**
- Handoff document created (`merchants/[Merchant]/raw-files/handoff-docs/csm-handoff.md`)
- Knowledge transfer session with CSM
- Context on solution architecture and key decisions
- Outstanding issues or future scope documented

**After Handoff:**
- Case status → Closed
- CSM owns ongoing merchant relationship
- SE exits (no ongoing advisory)

**SE Re-Engagement:**
- Only for net-new scope (new products, major features)
- Requires new Opportunity → new Launch Case

### SE Role Boundaries in Post-Sales

#### ✅ SE DOES (Consultative)
- Answer platform questions when asked
- Provide guidance on Shopify best practices
- Escalate platform issues to Shopify support
- Review architecture if consulted

#### ❌ SE DOES NOT (Execution)
- Build themes, apps, or integrations
- Configure store settings hands-on
- Own implementation timeline or milestones
- Validate launch readiness
- Manage project or partner work
- Troubleshoot partner/merchant code
- Perform hands-on migration or testing

**Remember:** SE = Answer questions, NOT own implementation

### Post-Sales Folder Structure

**Merchant folders support BOTH pre-sales and post-sales work:**

```
merchants/[Merchant]/
  pre-sales/                   # Opportunity work
    briefing-document.md
    discovery-assessment.md
    technical-assessment.md
  post-sales/                  # Launch Case work
    launch-plan.md             # Milestone tracking integrated
    launch-readiness-checklist.md
  raw-files/                   # SHARED context (continuity)
    config.md                  # Contains BOTH Opp AND Case details
    documents/
    emails/
    meeting-notes/
    case-notes/                # Launch Case specific notes
    handoff-docs/              # CSM handoff materials
```

**Context Continuity:** raw-files/ shared between pre-sales and post-sales ensures seamless context from discovery through launch

---

## Role Boundaries

### ✅ What SEs DO

#### 1. Pre-Sales Activities
- **Technical discovery:** stakeholders, systems, requirements, constraints, data flows, risks
- **Solution design:** reference architecture, integration patterns (payments, ERP, PIM, OMS, ESP, CDP, IDP/SSO)
- **Extensibility approach:** Checkout Extensibility, Functions, Flow
- **Platform considerations:** B2B/Markets/POS, performance and scale guardrails
- **Validation:** POCs, targeted demos, feasibility spikes
- **Security/compliance:** guidance with internal security/legal teams
- **Scoping inputs:** assumptions, dependencies, NFRs, acceptance criteria, phasing/green-path recommendations
- **Commercial support:** RFP/RFI responses, SoW assumptions, success criteria, TCO/ROI rationale

#### 2. Technical Advisory During Implementation
- **Milestone-based check-ins:** validate architectural decisions
- **Platform unblocking:** answer platform questions, confirm approach within guardrails
- **Escalation routing:** connect to Product, Engineering, Support/IR for platform questions
- **Risk management:** call out deviations from sold solution, recommend course corrections

#### 3. Platform Expertise and Question Answering
- **Deep knowledge:** core platform, APIs, rate limits, identity/SSO, Checkout/Payments, Markets, POS, B2B, data models, migrations, operational considerations
- **Best practices:** native-first approach, partner/app selection, headless vs. theme trade-offs, performance budgets, integration boundaries

#### 4. Launch Support and Validation
- **Go-live checks:** platform readiness, key configurations, integration health
- **Non-functional readiness:** scale, performance expectations, monitoring/alerting, support/escalation pathways
- **Launch coordination:** coordinate with internal teams for launch watch if needed
- **Handoff completion:** ensure all handoffs are complete

#### 5. Other Key Responsibilities
- **Stakeholder alignment:** merchant business/tech, partner delivery, internal product/engineering
- **Documentation:** produce solution artifacts that partners and post-sales can execute against
- **Enablement:** brief CSM, Support, PS, and partners on solution intent

---

### ❌ What SEs DON'T DO

#### 1. Not Implementation Delivery
- ❌ No building themes, apps, integrations, or writing production code
- ❌ No managing sprints, running standups, performing QA/UAT execution
- ❌ No project management
- ❌ No configuring merchant stores end-to-end
- ❌ No running cutover plans or migrating data

#### 2. Not Post-Launch Ownership
- ❌ No ongoing account ownership
- ❌ No adoption programs or renewals/expansion motions (CSM-owned)
- ❌ No continuous optimization services (CRO/SEO/web performance) beyond advisory
- ❌ PS/partners handle services work

#### 3. Not Merchant Support
- ❌ No ticket queue ownership or incident management (Plus Support/IR own break/fix)
- ❌ No SLAs for operational support
- ❌ SEs may assist with context/escalation but do not own resolution

---

## Working with Partners/Agencies

### When Partners Get Involved
Often during **late pre-sales or immediately post-contract** to scope/build. Earlier for solution shaping if a specific SI/agency is already preferred or required for feasibility input.

### SE's Relationship with Partner During Implementation
- **Technical authority** on platform guardrails and intent of the sold solution
- **Advisory and unblocker,** not the delivery lead
- Attend architecture checkpoints
- Validate key decisions map to Shopify best practices

### What SE Hands Off to Partner
- ✅ Solution Design Document and reference architecture
- ✅ Integration inventory and data-flow diagrams
- ✅ Systems of record and event boundaries
- ✅ NFRs and acceptance criteria
- ✅ Risk/assumptions register
- ✅ Implementation options and phase plan/green-path guidance
- ✅ App/partner recommendations
- ✅ API/rate limit expectations
- ✅ Security/SSO requirements
- ✅ Launch checklist and support/escalation pathways

### What SE Still Owns While Partner Builds
- ✅ Answer platform questions
- ✅ Confirm Shopify-feasible patterns
- ✅ Coordinate internal escalations
- ✅ Validate material changes against the sold solution
- ✅ Participate in milestone reviews
- ✅ Launch readiness from platform POV

---

## Internal Collaboration

### Who SEs Work With

**AE/Account Team**
- Sales strategy and deal progression

**CSM (Customer Success Manager)**
- Launch readiness and post-launch handoff
- Success plan inputs

**Professional Services (PS)**
- Solution Architects/Technical Architects for complex builds
- Delivery Managers for PS-led projects

**Product/Engineering**
- Roadmap alignment
- Constraints and escalations

**Security, Legal, Deal Desk, Revenue Ops**
- Compliance, terms, approvals

**Partner Managers**
- Partner selection, enablement, coordination

**Support/Incident Response**
- Readiness and launch watch as needed

---

### Handoff Points

**AE → SE**
- At first qualified technical discovery

**SE → PS (SA/TA/DM) or Partner**
- At contracting/implementation kickoff
- With full solution artifacts

**SE → CSM**
- At launch planning
- With success criteria and runbook context
- CSM owns ongoing value

---

### Who Takes Over Post-Launch

**CSM**
- Adoption, success planning
- Expansion/renewals
- Orchestration of ongoing resources

**Support/IR**
- Incidents/escalations

**PS/Partner**
- Continued implementation/optimization work if in scope

---

## Typical Engagement Timeline

### Duration of SE Involvement
**From first technical discovery through contracting and implementation advisory up to launch + 0–2 weeks**

For enterprise cycles, total calendar time can span months, but **SE intensity is highest pre-contract and around key implementation milestones.**

---

### Key SE-Active Milestones

1. **Technical discovery and qualification**
2. **Solution proposal/architecture and RFP responses**
3. **Feasibility/POC and security/compliance reviews**
4. **SoW inputs and acceptance criteria alignment**
5. **Implementation kickoff handoff**
6. **Architecture checkpoints/milestones**
7. **Launch readiness and go/no-go support**

---

### When SE Steps Back/Exits

**After launch validation/hypercare window (0-2 weeks post-launch)** and completion of final handoffs to CSM/Support.

**SE re-engages only for:**
- Net-new scope
- Material changes to solution

---

## Documentation & Communication

### What SEs Document

**Discovery & Requirements**
- Discovery notes
- Business, functional, and non-functional requirements

**Architecture & Design**
- Reference architecture
- Integration map
- Systems of record
- Data flows
- Rate limits

**Planning & Risk Management**
- Assumptions
- Risks
- Dependencies
- Acceptance criteria
- Phasing

**Decision Documentation**
- Implementation options/decision log
- App and partner recommendations

**Security & Compliance**
- Security/compliance guidance
- Performance expectations

**Launch Preparation**
- Launch readiness checklist
- Support/escalation pathways

**Validation**
- POC outcomes
- Measurable success criteria

---

### Who Needs Access

**Internal**
- AE/account team
- CSM
- PS (SA/TA/DM)
- Support/IR (as needed)
- Partner Manager
- Product/Engineering (if engaged)

**External**
- Partner/agency
- Merchant's delivery stakeholders (sanitized as appropriate)

---

### Tools/Systems Used Daily

**Communication**
- Slack (internal and shared channels)
- Email
- Video conferencing

**CRM & Documentation**
- Salesforce (opportunity, activities, solution notes)
- Vault/GSD for solution artifacts and handoffs
- Internal documentation systems

**Technical**
- GitHub or code sandboxes for POCs/samples (non-production)
- Ticketing/Support systems for coordinated escalations (read/assist, not own)

---

### Communication Practices

✅ **Single-threaded internal coordination** via AE/CSM/DM depending on phase  
✅ **Shared Slack channels** and scheduled checkpoints with merchant/partner  
✅ **Clear written artifacts** and decision logs to prevent drift from sold solution  
✅ **Early escalation on risks** tied back to acceptance criteria and NFRs  

---

## Clear Boundaries Summary

### SE vs Partner
**SE:** Designs and validates  
**Partner:** Implements and delivers

### SE vs PS
**SE:** Leads pre-sales solutioning  
**PS (SA/TA/DM):** Leads scoped delivery and specialized technical services

### SE vs CSM
**SE:** Supports launch readiness and exits  
**CSM:** Owns post-launch value, adoption, and expansion

---

## Quick Reference: SE Engagement Phases

| Phase | SE Involvement | Partner Involvement | CSM Involvement |
|-------|----------------|---------------------|-----------------|
| **Discovery** | Lead | Sometimes consulted | Minimal |
| **Solution Design** | Lead | Sometimes consulted | Early planning |
| **Contracting** | Finalize solution | Getting scoped/onboarded | Success criteria |
| **Implementation** | Milestone advisory | Leads execution | Launch planning |
| **Launch** | Platform validation | Final execution | Transition prep |
| **Post-Launch** | Exit (0-2 weeks) | Ongoing if scoped | Owns ongoing |

---

## SE Intensity Throughout Engagement

```
High  |     ████████░░░░░░░░░░░░
      |     Discovery & Design
      |
Med   |                ░░██░░██░░
      |                Milestones
      |
Low   |                        ░░░
      |                Post-Launch
      |___________________________________
        Pre-Sales → Implementation → Launch
```

---

## This Definition Shapes the Framework

This role definition directly impacts:

1. **Templates** - Post-sales templates focus on advisory role, not execution
2. **Workflows** - Clear partner involvement and SE exit points
3. **Documentation** - Handoff-focused, not ongoing tracking
4. **MCP Usage** - Front-loaded research, validation during advisory
5. **Time Allocation** - Intensity in pre-sales, lighter touch during implementation

---

**Remember:** You're the technical authority and validator, not the implementer. Design → Validate → Hand Off → Exit.

