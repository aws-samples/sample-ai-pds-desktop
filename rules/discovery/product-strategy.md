# Product Strategy — Positioning, Business Model & KPIs

## Purpose
Develop a comprehensive product strategy for the selected use case / prototype. Covers positioning, differentiation, business model, KPI definition, and competitive analysis.

## Entry Conditions
- At least one prototype built or spec approved
- User chose to continue to Product Strategy

## Exit Artifact
- `05-product-strategy/strategy.md` — Complete product strategy document

---

## Step 1: Context Setting

Identify which use case we're developing strategy for:

If multiple prototypes were built:
<decision question="Which use case should we develop product strategy for?">
<option description="{Use Case 1 name}">{slug-1}</option>
<option description="{Use Case 2 name}">{slug-2}</option>
<option description="{Use Case 3 name}">{slug-3}</option>
<option description="Develop strategy that covers all selected use cases">All as one product</option>
</decision>

---

## Step 2: Positioning & Differentiation

### Vision Statement
Ask: "In one sentence, what is this product's reason for existing? Who is it for and what change does it create in their world?"

### Target Customer
Ask: "Describe the ideal customer for this product. What's their role, company size, industry, and key challenge?"

### Competitive Landscape
Offer research:

<decision question="Would you like me to research the competitive landscape?">
<option description="I'll search for existing solutions in this space">Yes — research competitors</option>
<option description="I already know the landscape">No — I'll tell you about competitors</option>
<option description="There aren't direct competitors (new category)">Skip — this is a new category</option>
</decision>

If researching:
- Use `web_search` to find competing products/solutions
- Summarize key competitors with strengths/weaknesses
- Identify white space and differentiation opportunities

### Differentiation
Ask: "What makes this solution different from alternatives? Why would customers choose THIS over doing nothing, building in-house, or buying from competitors?"

Guide toward:
- Technical differentiation (what's unique about the approach?)
- Experience differentiation (what's unique about using it?)
- Business model differentiation (what's unique about how it's offered?)

---

## Step 3: Business Model

<decision question="What business model fits this product?">
<option description="Monthly/annual subscription fee">SaaS subscription</option>
<option description="Pay per use / per transaction / per API call">Usage-based</option>
<option description="Free basic tier, paid premium features">Freemium</option>
<option description="One-time purchase or perpetual license">One-time license</option>
<option description="Built into existing product — no separate pricing">Feature within existing product</option>
<option description="I'm not sure yet — help me decide">Help me decide</option>
</decision>

If "Help me decide":
- Present trade-offs of each model for their specific product
- Consider: customer segment, usage patterns, competitive norms, revenue predictability

### Revenue Dimensions
Ask: "What drives revenue? What's the unit of value?" (e.g., per user/month, per transaction, per document processed)

### Pricing Anchors
Ask: "What do customers pay today for alternatives or workarounds? What's their budget range?"

---

## Step 4: KPI Definition

### Product KPIs

Present categories and ask for input:

```
Let's define the KPIs that will tell us this product is succeeding. 
I'll suggest categories — tell me what metrics matter most:

**Adoption:** How do we measure uptake?
**Engagement:** How do we know users find value?
**Outcome:** What business result are we driving?
**Retention:** How do we know users stay?
```

For each KPI, capture:
- **Metric name**
- **Definition** (exactly how it's measured)
- **Target** (what's "good"?)
- **Baseline** (what's it today, if applicable?)
- **Timeframe** (when should we hit the target?)

### North Star Metric
Ask: "If you could only track ONE number, what would tell you this product is succeeding?"

---

## Step 5: Risk Assessment

Ask: "What could prevent this product from succeeding? What are you most worried about?"

Organize risks into:
| Category | Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|---|
| Technical | {risk} | H/M/L | H/M/L | {mitigation} |
| Market | {risk} | H/M/L | H/M/L | {mitigation} |
| Organizational | {risk} | H/M/L | H/M/L | {mitigation} |

---

## Step 6: Generate Strategy Document

Compile all inputs into `05-product-strategy/strategy.md` with sections:
1. Executive Summary
2. Vision & Positioning
3. Target Customer Profile
4. Competitive Landscape & Differentiation
5. Business Model & Pricing
6. Key Performance Indicators
7. Risk Assessment & Mitigations
8. Strategic Recommendations

Open in session tab for review.

<decision question="Product strategy document is ready. How does it look?">
<option description="Strategy is solid — approve and continue">Approve</option>
<option description="Needs adjustments in specific sections">Revise sections</option>
<option description="Want to export as DOCX for exec review">Export as Word document</option>
</decision>

---

## Transition to Next Phase

"Product strategy is complete. Would you like to develop a Go-to-Market plan for how to launch and sell this?"

→ Load `rules/discovery/go-to-market.md`

---

## Validation Criteria

A good Product Strategy document:
- ✅ Clear, specific positioning (not generic)
- ✅ Target customer is concrete (not "everyone")
- ✅ Competitive analysis is evidence-based
- ✅ Differentiation is defensible and specific
- ✅ Business model aligns with customer behavior
- ✅ KPIs are measurable with defined targets
- ✅ Risks are honest with realistic mitigations
- ✅ Reads as a decision-enabling document (not a wish list)
