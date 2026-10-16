# Discovery Research — Market, Competitive & User Research

## Purpose

An optional opening step of Envision that grounds the pain-point work in evidence. Before gathering pain points, run three research pillars to understand the market, the competition, and the users. This ensures pain points identified in Envision are validated, not assumed.

This is **not a phase of its own**. It runs inside Phase 1 (Envision), so the progress indicator stays on Envision's position (`1/6`) throughout.

> **Progress indicator:** every reply you send during this step ends with the two-line indicator defined in `SKILL.md` — including each question in a run of questions, and short acknowledgements. It never lapses mid-step.

## When to Use

- User accepts the Discovery Research offer made at the start of Envision
- User says they want to validate assumptions before diving into pain points
- Workshop mode where the group needs a shared evidence base

The offer is made by `envision.md` (Step 1) every time Envision begins. This step runs only when the user says yes. Because only Entry Point 1 runs Envision, Entry Points 2 and 3 are never offered research.

## Entry Conditions

- Envision has started (Entry Point 1) and the user accepted the research offer
- User has a product idea, problem space, or market to investigate
- No prior artifacts required

## Exit Artifacts

- `01-envision/research/framing.md` — Problem framing and assumptions
- `01-envision/research/market-signals.md` — Market analytics output
- `01-envision/research/competitive-landscape.md` — Competitive intelligence output
- `01-envision/research/user-needs.md` — User research output
- `01-envision/research/research-summary.md` — Consolidated findings + assumption validation

---

## Step 1: Frame the Research

Gather the research framing inputs conversationally (ONE question at a time):

1. **Company name** — "What company or organization is this for?"
2. **Product intent** — "What problem are you solving, for whom, and why now?"
3. **Target market** — "What industry, customer segments, and geographic focus?"
4. **Known competitors** — "Who else is solving this problem? Include company and product names (e.g. 'Acme Corp (AcmeSign)')."
5. **Assumptions to validate** — "List 3-5 things you believe to be true about the market, users, or competition."
6. **Key research questions** — "What 3-5 specific questions do you need answered before committing to a direction?"
7. **Review sources** — "Where do your target customers leave feedback? (e.g. Trustpilot, G2, Capterra, Reddit, industry forums)"

### Guidance for good framing

- Be specific: "AI tools for enterprise" is too broad. "AI-powered contract review for mid-market legal teams in North America" gives research something to work with.
- Assumptions should be falsifiable — something the research can confirm, challenge, or mark inconclusive.
- Research questions should go beyond the obvious — focus on unknowns that would change your direction.

After gathering all inputs, generate `01-envision/research/framing.md` and present for confirmation.

---

## Step 2: Run Research (Three Pillars)

### Platform-specific execution

**On Quick Desktop:** Offer to run this as a Quick Flow (automated, ~30 min). Guide the user to create or trigger the "Discovery Research" flow with the 7 inputs from Step 1. The flow runs three stages in parallel.

**On Claude Desktop:** Execute the three research pillars sequentially using web search (if available) or ask the user to paste research findings. If web search MCP is configured, run the research directly.

### Pillar 1: Market Signal Analysis

Research prompt:
```
Search for latest market signals, trends, and developments related to {Product Intent} by {Company Name} in {Target Market}.

Find recent news, industry reports, funding announcements, product launches, customer feedback, and market shifts that could impact the product strategy.

Pay special attention to evidence that confirms or challenges these assumptions: {Assumptions to Validate}

Specifically try to answer these questions: {Key Research Questions}
```

Save output to `01-envision/research/market-signals.md` (saved to chosen storage once user approves or skips validation).

### Pillar 2: Competitive Landscape

Research prompt:
```
Analyze the competitive landscape for {Product Intent} by {Company Name} targeting {Target Market}.

Research competitors including {Known Competitors} — their product offerings, pricing models, strengths, weaknesses, market positioning, and customer reviews. Identify market gaps, underserved segments, and competitive positioning opportunities. Include data on competitor funding, team size, and technology approach where available.

Compare how {Company Name} is positioned relative to these competitors.

For each assumption below, note whether the competitive landscape supports or challenges it: {Assumptions to Validate}
```

Save output to `01-envision/research/competitive-landscape.md` (saved to chosen storage once user approves or skips validation).

### Pillar 3: User Needs Research

Research prompt:
```
Research user needs, pain points, and behavior patterns for {Product Intent} by {Company Name} targeting {Target Market}.

Analyze customer feedback from the following review sources: {Review Sources}. Also check forums, support communities, and social media. Identify common frustrations with existing solutions, unmet needs, and feature requests. Synthesize findings into user personas, key pain points, and user journey insights. Include data on technology adoption trends, willingness to pay, and decision-making factors.

For each assumption below, note whether user evidence supports or challenges it: {Assumptions to Validate}

Specifically try to answer these questions: {Key Research Questions}
```

Save output to `01-envision/research/user-needs.md` (saved to chosen storage once user approves or skips validation).

---

## Step 3: Review Gate (Human-in-the-Loop)

After all three pillars complete, present the findings for review.

### Review criteria

For each pillar, ask the user to evaluate:

- **Accuracy** — Do the claims match what you know? Are sources cited?
- **Depth** — Is the analysis surface-level or does it uncover non-obvious insights?
- **Gaps** — What important questions were not answered?
- **Bias** — Does the research present a balanced view?

### Assumption validation summary

Generate a table mapping each assumption to its research verdict:

```markdown
| Assumption | Verdict | Evidence |
|---|---|---|
| {assumption 1} | Confirmed / Challenged / Inconclusive | {brief evidence} |
| {assumption 2} | ... | ... |
```

### Gate decision

<decision question="How does the research look? Is it sufficient to move forward?">
<option description="Research is solid — continue Envision with these findings as context">Approve — continue to pain points</option>
<option description="Some gaps need filling — refine prompts and re-run specific pillars">Re-run with refinements</option>
<option description="Research uncovered something unexpected — let's discuss before proceeding">Discuss findings first</option>
</decision>

If "Re-run": Ask which pillar(s) to re-run and what to change, then repeat Step 2 for those pillars only.

---

## Step 4: Generate Research Summary

Produce `01-envision/research/research-summary.md` consolidating:

1. Key findings across all three pillars
2. Assumption validation table
3. Answers to research questions (or "not answered — needs further investigation")
4. Recommended focus areas for Envision (based on validated pain points)
5. Open questions to carry forward

---

## Return to Envision

When research is approved:

- Save all artifacts to chosen storage (workspace, OneDrive, QuickSuite Space, or Claude Project)
- Update `aipds-state.md` with research completion
- Log in `audit.md`
- Inform the user: "Research findings will be used as context for the rest of Envision (pain points) and later for Product Strategy (competitive positioning)."
- Return to `envision.md` and continue with its next step (Customer Context), with research findings loaded as background context

---

## Workshop Mode Notes

In workshop mode:
- Run the flow before the session (pre-work) or during Day 1 as a group activity
- Project research outputs on screen for group discussion
- Use the assumption validation table as a facilitation tool: "Which challenged assumptions surprise the group?"
- Capture group's additional insights in the audit trail
