# Envision Phase — Pain Point Gathering & PR/FAQ Generation

## Purpose

Guide the user from raw customer pain points to a structured PR/FAQ document using the Working Backwards method. This is the foundation of all discovery work.

## Entry Conditions

- User selected Entry Point 1 (Pain Points)
- No PROTOTYPE-*.md files exist

## Exit Artifacts

- `01-envision/pain-points.md` — Confirmed list of customer pain points
- `01-envision/prfaq.md` — Working Backwards PR/FAQ document

---

## Step 1: Customer Context (Quick Desktop Enhancement)

Before gathering pain points, check if Quick has context about this customer:

Ask: "What customer or problem area are we exploring?"

Then offer context gathering:

From a URL Free-form text Pull from my connected context AI-assisted research

### If "From a URL"

1. Ask for the URL
2. Fetch the URL content using `url_fetch`
3. Extract pain points from the content
4. Present extracted pain points for confirmation

### If "Free-form text"

1. Ask user to share pain points in any format
2. Accept bullet points, paragraphs, pasted content — any format
3. Organize into structured list
4. Present for confirmation

### If "Pull from connected context" (Quick-specific)

1. Search Knowledge Graph for customer entity and related observations
2. Search email for customer-related threads mentioning problems, complaints, requests
3. Search Slack for customer discussions mentioning pain points
4. Compile findings
5. Present for user confirmation (never auto-use without confirmation)

### If "AI-assisted research"

1. Use `web_search` to research the customer's industry, competitors, and common pain points
2. If customer has public reviews (G2, Trustpilot, app stores), fetch those
3. Present research findings
4. Ask user to confirm which are relevant

---

## Step 2: Pain Point Synthesis

After gathering raw input, synthesize into structured format:

For each pain point, capture:

- **Pain point title** (concise, descriptive)
- **Description** (1-2 sentences)
- **Who feels it** (persona/role)
- **Severity** (Critical / High / Medium / Low)
- **Frequency** (Daily / Weekly / Monthly / Occasionally)
- **Current workaround** (if any)

Present the structured list:

```markdown
## Confirmed Pain Points

| # | Pain Point | Who | Severity | Frequency |
|---|---|---|---|---|
| 1 | {title} | {persona} | {severity} | {frequency} |
| 2 | {title} | {persona} | {severity} | {frequency} |
...

```

Ask for confirmation:

Confirmed — proceed to PR/FAQ Add more Edit the list

---

## Step 3: PR/FAQ Generation (Working Backwards)

Once pain points are confirmed, generate the PR/FAQ using the template from `templates/prfaq-template.md`.

### Generation Process

1. Identify the PRIMARY pain point (highest severity × frequency)
2. Frame the solution as an announcement — what would the press release say?
3. Write from the customer's perspective — how does their life improve?
4. Include specific, measurable outcomes where possible
5. Generate FAQ sections addressing skepticism and implementation

### Presentation

- Open the PR/FAQ in a session tab for review
- The document should feel like a real press release, not a template
- Include both Customer FAQ and Internal FAQ sections

### Approval Gate

Approve PR/FAQ Needs wordsmithing Revise the approach Discuss first

If revision needed:

- Ask what specifically to change
- Revise and re-present
- Repeat until approved

---

## Step 4: Save Artifacts

Once PR/FAQ is approved:

1. Save `01-envision/pain-points.md` with the confirmed pain point list
2. Save `01-envision/prfaq.md` with the approved PR/FAQ
3. Update `aiplc-state.md`
4. Log in `audit.md`

---

## Transition to Next Phase

After Envision completes, the workflow ALWAYS proceeds to Solution Analysis:

"Your PR/FAQ is saved. Now I'll analyze the solution space — does the PR/FAQ point to a single clear solution, or multiple possible approaches?"

→ Load `rules/discovery/solution-analysis.md`

---

## Validation Criteria

A good Envision output has:

- ✅ At least 3 distinct pain points identified
- ✅ Each pain point has severity and frequency rated
- ✅ PR/FAQ has a clear, single customer-centric narrative
- ✅ PR/FAQ includes specific outcomes (not vague promises)
- ✅ Customer FAQ addresses at least 3 likely questions
- ✅ Internal FAQ addresses feasibility concerns
- ✅ User has explicitly approved the PR/FAQ

---

## Workshop Mode Notes

In workshop mode:

- After pain point gathering, present to group: "Does the group agree these are the key pain points? Any missing?"
- PR/FAQ iteration may take 2-3 rounds with group feedback
- Log dissenting views: "Team member suggested X but group chose Y"
- Consider splitting into breakout discussions if pain points are contentious

