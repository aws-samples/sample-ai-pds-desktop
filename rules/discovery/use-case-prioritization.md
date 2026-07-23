# Use Case Prioritization — Dual Scoring Frameworks

## Purpose
Score and rank all documented use cases using framework-appropriate scoring. Agentic use cases and Application use cases have DIFFERENT scoring dimensions. The output is a prioritized backlog with the top 3 selected for prototyping.

## Entry Conditions
- Use Case Intake is complete (all use cases documented and classified)
- Each use case has been tagged as Agentic or Application

## Exit Artifacts
- `03-prioritization/scoring.md` — Detailed scores with rationale
- `03-prioritization/ranking.md` — Final ranked list with recommendations

---

## Step 1: Confirm Scoring Approach

Present the dual-framework approach:

```
We'll score your use cases using two specialized frameworks:

**Agentic Use Cases** ({N} total) → Scored on:
- Automation potential, decision complexity, tool integration breadth,
  error tolerance, conversation depth, data access patterns

**Application Use Cases** ({M} total) → Scored on:
- User impact, technical feasibility, data readiness, 
  integration complexity, time to value, scalability

Each dimension is scored 1-5 and weighted. I'll guide you through each one.
```

<decision question="How would you like to approach scoring?">
<option description="I'll ask you to rate each dimension for each use case">Guided scoring (you score, I organize)</option>
<option description="I'll propose scores based on what I know and you adjust">AI-proposed (I score, you validate)</option>
<option description="Quick relative ranking without detailed scoring">Fast ranking (less rigorous but faster)</option>
</decision>

---

## Step 2: Score Agentic Use Cases

For each Agentic use case, apply the framework from `templates/scoring-agentic.md`:

### Dimensions (each scored 1-5):

| Dimension | Weight | What It Measures |
|---|---|---|
| Automation Potential | 25% | How much human work can be eliminated? |
| Decision Complexity | 20% | How complex are the decisions the agent must make? |
| Tool Integration Breadth | 15% | How many tools/APIs must be orchestrated? |
| Error Tolerance | 15% | How forgiving is the domain of AI mistakes? |
| Conversation Depth | 10% | How much multi-turn interaction is needed? |
| Data Access Patterns | 15% | How accessible is the required data? |

### Scoring Process (Guided)
For each use case, present:
```
**Scoring: {Use Case Name}** (Agentic)

Rate each dimension 1-5:
```

Then ask each dimension one at a time with anchor descriptions:
```
**Automation Potential** (Weight: 25%)
How much of the current manual process can this agent automate?

1 = Minimal automation (mostly human with AI assist)
2 = Some steps automated (20-40% of workflow)
3 = Significant automation (40-60% of workflow)  
4 = High automation (60-80% of workflow)
5 = Near-complete automation (80%+ with human oversight)

What score for "{use case name}"?
```

### Scoring Process (AI-Proposed)
Present all scores at once with rationale:
```
| Dimension | Score | Rationale |
|---|---|---|
| Automation Potential | 4 | {reason} |
| Decision Complexity | 3 | {reason} |
| ... | ... | ... |
| **Weighted Total** | **3.7** | |
```

Ask: "Do these scores feel right? Any you'd adjust?"

---

## Step 3: Score Application Use Cases

For each Application use case, apply the framework from `templates/scoring-application.md`:

### Dimensions (each scored 1-5):

| Dimension | Weight | What It Measures |
|---|---|---|
| User Impact | 25% | How many users benefit and how significantly? |
| Technical Feasibility | 20% | How achievable with current tech/resources? |
| Data Readiness | 15% | Is the required data available and clean? |
| Integration Complexity | 15% | How many systems must connect? |
| Time to Value | 15% | How quickly can users see benefit? |
| Scalability | 10% | Can it grow with demand? |

### Same scoring process as Agentic (guided or AI-proposed)

---

## Step 4: Generate Rankings

After all use cases are scored:

### Combined Ranking Table
```markdown
## Prioritized Use Cases

| Rank | Name | Type | Score | Key Strength | Key Risk |
|---|---|---|---|---|---|
| 1 | {name} | Agentic | 4.2/5.0 | {strength} | {risk} |
| 2 | {name} | Application | 3.9/5.0 | {strength} | {risk} |
| 3 | {name} | Agentic | 3.7/5.0 | {strength} | {risk} |
| 4 | {name} | Application | 3.5/5.0 | {strength} | {risk} |
...
```

### Visualization (Quick Desktop Enhancement)
Generate an interactive Highcharts visualization:
- Bar chart showing all use cases ranked by score
- Color-coded by type (Agentic = blue, Application = green)
- Hover shows dimension breakdown
- Also generate scatter plot: Score vs. Effort for portfolio view

### Trade-off Analysis
For the top 5, present:
```
**Trade-off Analysis:**

- UC #1 scores highest but has higher implementation risk because...
- UC #2 is lower risk but impacts fewer users because...
- UC #3 is a quick win — fast time to value but limited scope because...
```

---

## Step 5: Select Top 3

<decision question="Based on the scoring, here are my recommended top 3 for prototyping. Do you agree?">
<option description="These 3 are right — proceed to prototype specs">Agree with top 3</option>
<option description="I want to swap one or more selections">Adjust selection</option>
<option description="I want more than 3 prototypes">Select more than 3</option>
<option description="I only want 1 or 2 prototypes">Select fewer</option>
</decision>

If adjusting, ask which to swap and why (log rationale in audit).

---

## Step 6: Save Artifacts

Save:
1. `03-prioritization/scoring.md` — Full scoring details with all dimensions and rationale
2. `03-prioritization/ranking.md` — Final ranked list with selections highlighted

Offer Excel export:
<decision question="Would you like the scoring as an Excel spreadsheet too?">
<option description="Useful for sharing with stakeholders">Yes, generate Excel</option>
<option description="Markdown is sufficient">No, markdown only</option>
</decision>

---

## Transition to Next Phase

"Top {N} use cases selected for prototyping. Next, I'll gather the context needed to write detailed prototype specifications for each one."

→ Load `rules/discovery/prototype-context-generation.md`

---

## Validation Criteria

A good Prioritization output has:
- ✅ All use cases scored consistently with the appropriate framework
- ✅ Scores have clear rationale (not arbitrary numbers)
- ✅ Ranking includes both strengths and risks
- ✅ Trade-off analysis helps justify selection
- ✅ Visualization makes comparisons intuitive
- ✅ User has explicitly confirmed top selections
- ✅ Any score adjustments logged in audit with reasoning

---

## Workshop Mode Notes

In workshop mode:
- Scoring often triggers debate — this is GOOD
- Each stakeholder may rate differently — capture the range and discuss outliers
- If group can't agree, use "fist of five" approach: "Everyone rate 1-5, I'll average"
- Log dissent: "Marketing rated this 5, Engineering rated this 2 because..."
- Final selection may involve political/strategic factors beyond pure score — that's OK, log it
