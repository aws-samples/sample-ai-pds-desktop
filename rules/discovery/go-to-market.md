# Go-to-Market — Launch Planning & Sales Strategy

## Purpose
Develop a comprehensive go-to-market plan covering customer segmentation, sales motions, launch sequencing, channel strategy, and messaging. This is the final capability in the AI-PLC Discovery workflow.

## Entry Conditions
- Product Strategy is complete and approved
- User chose to continue to GTM planning

## Exit Artifact
- `06-go-to-market/gtm-plan.md` — Complete go-to-market plan

---

## Step 1: Segmentation

### Market Segmentation
Ask: "Let's define your market segments. Who are the different groups of customers who might buy this?"

Guide toward segmentation dimensions:
- **Company size** (SMB / Mid-market / Enterprise)
- **Industry vertical** (if applicable)
- **Maturity** (early adopters / mainstream / laggards)
- **Use case fit** (which segment has the strongest pain point?)

### Prioritize Segments

<decision question="Which segment should we target FIRST for launch?">
<option description="Start with the segment most likely to buy quickly">Easiest to win (path of least resistance)</option>
<option description="Start with the segment that proves value most dramatically">Best proof point (impressive reference)</option>
<option description="Start with the largest revenue opportunity">Biggest market (volume play)</option>
<option description="I'll tell you which segment to target first">I have a specific segment in mind</option>
</decision>

### Ideal Customer Profile (ICP)
For the target segment, define:
- Company characteristics (size, industry, tech stack)
- Buyer persona (title, responsibilities, goals)
- Trigger events (what causes them to look for a solution NOW?)
- Disqualifiers (signals this customer is NOT a fit)

---

## Step 2: Sales Motion

<decision question="What sales approach fits this product?">
<option description="Customers sign up and use it without talking to sales">Product-led (self-serve)</option>
<option description="Sales team demos and closes deals">Sales-led (relationship)</option>
<option description="Start self-serve, upgrade through sales for enterprise">Hybrid (PLG + Sales)</option>
<option description="Customers discover through a partner or platform">Partner/Channel-led</option>
</decision>

### If Sales-led:
- Ask: "What's the expected deal size and sales cycle length?"
- Ask: "Who are the decision makers vs. influencers in the buying process?"
- Ask: "What's the typical objection you'd expect?"

### If Product-led:
- Ask: "What's the 'aha moment' — when does a user first feel value?"
- Ask: "What should the free/trial experience include?"
- Ask: "What triggers upgrade from free to paid?"

---

## Step 3: Messaging Framework

### Value Proposition
Ask: "Complete this sentence: '{Product name} helps {customer} {achieve outcome} by {mechanism}, unlike {alternative} which {limitation}.'"

### Key Messages by Audience

| Audience | Message Focus |
|---|---|
| Executive buyer | Business impact, ROI, strategic alignment |
| End user | Daily workflow improvement, ease of use |
| Technical evaluator | Architecture, security, integration |

For each audience, ask: "What's the ONE thing they need to believe for this to resonate?"

### Proof Points
Ask: "What evidence supports our claims? (e.g., prototype results, benchmarks, customer quotes, market data)"

---

## Step 4: Launch Sequencing

<decision question="What kind of launch are you planning?">
<option description="Start with a few customers, expand gradually">Phased rollout (beta → GA)</option>
<option description="Launch publicly with marketing push">Big bang launch</option>
<option description="Launch within existing customer base first">Existing customers first</option>
<option description="Different approach for different segments">Segment-specific launches</option>
</decision>

### Launch Timeline
Ask: "What's the target launch timeframe? Any hard deadlines (events, quarters, competitive pressure)?"

### Launch Milestones

Define key milestones:
1. **Alpha/Internal** — When? Who uses it? What are we validating?
2. **Beta/Limited** — How many customers? Selection criteria? Success metrics?
3. **General Availability** — What must be true before GA?
4. **Scale** — When do we accelerate growth investment?

---

## Step 5: Channel Strategy

<decision question="How will customers discover this product?">
<option description="They'll find it through search, content, and word of mouth">Inbound (content + SEO)</option>
<option description="We'll reach out to target accounts directly">Outbound (sales + outreach)</option>
<option description="Partners will recommend/resell it">Partner channel</option>
<option description="It's a feature within our existing product">Embedded (existing distribution)</option>
<option description="Multiple channels">Multi-channel</option>
</decision>

For each selected channel:
- What content/activities drive awareness?
- What's the expected cost per acquisition?
- What's the timeline to see results?

---

## Step 6: Success Metrics (GTM-specific)

Define GTM KPIs:
- **Pipeline:** How much qualified pipeline in first 90 days?
- **Conversion:** What conversion rate from trial/demo to paid?
- **Revenue:** Revenue target for first quarter post-launch?
- **Adoption:** User/account growth rate?
- **Satisfaction:** NPS or CSAT target?

---

## Step 7: Generate GTM Plan

Compile into `06-go-to-market/gtm-plan.md` with sections:
1. Executive Summary
2. Market Segmentation & Target ICP
3. Sales Motion & Buying Process
4. Messaging Framework
5. Launch Sequence & Timeline
6. Channel Strategy
7. Success Metrics & Milestones
8. Resource Requirements
9. Risks & Contingencies

Open in session tab for review.

<decision question="GTM plan is ready. How does it look?">
<option description="Plan is comprehensive — approve it">Approve GTM plan</option>
<option description="Needs adjustments">Revise</option>
<option description="Export as DOCX for stakeholder review">Export as Word</option>
<option description="Also generate a one-page executive summary">Create exec summary</option>
</decision>

---

## Transition: Discovery Complete

After GTM approval:

```
🎉 **AI-PLC Discovery is Complete!**

Here's what we've produced:
- ✅ Pain Points & PR/FAQ (01-envision/)
- ✅ Use Case Repository (02-use-case-intake/)
- ✅ Prioritized Backlog (03-prioritization/)
- ✅ Prototype Specs (04-prototypes/)
- ✅ Product Strategy (05-product-strategy/)
- ✅ Go-to-Market Plan (06-go-to-market/)

All artifacts are saved and ready for the next phase of development.
```

Generate final audit summary and present distribution options (from SKILL.md).

---

## Validation Criteria

A good GTM plan:
- ✅ Segmentation is specific and prioritized
- ✅ Sales motion matches product and customer
- ✅ Messaging is concrete and differentiated
- ✅ Launch sequence has dates and milestones
- ✅ Channel strategy is realistic for resources available
- ✅ Metrics are measurable with defined targets
- ✅ Plan is actionable (team could execute from this document)

---

## Workshop Mode Notes

In workshop mode:
- GTM often involves marketing, sales, and product together — different perspectives
- Segmentation debates can be heated — capture all viewpoints
- Messaging framework benefits from real-time wordsmithing with the group
- Consider splitting: Product team owns strategy sections, Sales owns GTM sections
