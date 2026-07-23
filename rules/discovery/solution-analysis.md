# Solution Analysis — Single vs. Multiple Solution Detection

## Purpose
Analyze the approved PR/FAQ to determine whether it points to a single clear solution or multiple possible approaches. This determines the workflow path forward.

## Entry Conditions
- PR/FAQ has been approved in the Envision phase
- Pain points are documented and confirmed

## Exit
- **Single solution** → proceed directly to Prototype Spec Generation (1 use case)
- **Multiple solutions** → extract use cases and merge with Use Case Intake path

---

## Step 1: Analyze the PR/FAQ

Read the approved PR/FAQ and identify:
1. How many DISTINCT solution approaches are implied?
2. Are there multiple ways to solve the stated pain points?
3. Does the PR/FAQ describe one product or multiple features/products?

### Analysis Criteria

**Single Solution indicators:**
- PR/FAQ describes ONE clear product/feature
- All pain points converge on the same solution
- The FAQ doesn't mention alternative approaches
- There's one obvious "what to build"

**Multiple Solution indicators:**
- PR/FAQ mentions several distinct capabilities
- Pain points could be solved by different approaches
- FAQ discusses trade-offs between approaches
- There are both "quick win" and "transformative" options
- Solution could be Agentic OR traditional application (or both)

---

## Step 2: Present Analysis

### If Single Solution Detected

Present your analysis:

```
Based on the PR/FAQ, I see **one clear solution direction**:

**Solution:** {concise description}
**Type:** {Agentic | Application | Hybrid}
**Addresses:** Pain points #{list}
**Confidence:** {High/Medium} — {brief rationale}
```

<decision question="The PR/FAQ points to a single solution. Would you like to proceed directly to prototype specification?">
<option description="Generate a PROTOTYPE-*.md spec for this solution">Yes — create prototype spec</option>
<option description="I actually see multiple approaches we should evaluate">Wait — I see multiple options</option>
<option description="Let me think about this before deciding">Give me a moment</option>
</decision>

If single solution confirmed → Load `rules/discovery/prototype-context-generation.md` (for 1 use case)

### If Multiple Solutions Detected

Present your analysis:

```
Based on the PR/FAQ, I've identified **{N} potential solution approaches**:

| # | Solution | Type | Addresses Pain Points | Effort |
|---|---|---|---|---|
| 1 | {name} | Agentic | #1, #3, #5 | Medium |
| 2 | {name} | Application | #2, #4 | High |
| 3 | {name} | Agentic | #1, #2, #3 | Low |
...
```

<decision question="I've identified {N} possible solutions from the PR/FAQ. How would you like to proceed?">
<option description="Document all as use cases and score them with the prioritization framework">Prioritize all {N} solutions</option>
<option description="I already know which one(s) to pursue — skip prioritization">I know which to pick</option>
<option description="Let me add more solutions you didn't identify">Add more options first</option>
</decision>

If "Prioritize all" → Extract into use case format → Load `rules/discovery/use-case-intake.md` (pre-populated)
If "I know which to pick" → Ask which ones → Load `rules/discovery/prototype-context-generation.md`
If "Add more" → Ask for additional solutions → update list → re-present decision

---

## Step 3: Use Case Extraction (if multiple solutions)

When transitioning to Use Case Intake with pre-populated data:

For each identified solution, create a preliminary use case card:
- **Name:** {solution name}
- **Description:** {from PR/FAQ analysis}
- **Type:** Agentic | Application
- **Pain points addressed:** {list}
- **Source:** "Extracted from PR/FAQ Solution Analysis"

Pass these to the Use Case Intake phase as pre-populated entries. The user will have a chance to:
- Edit descriptions
- Add additional use cases
- Remove solutions they don't want to evaluate
- Add details (users, integration needs, etc.)

---

## Validation Criteria

A good Solution Analysis:
- ✅ Clearly identifies single vs. multiple path
- ✅ Each solution has a descriptive name
- ✅ Type classification (Agentic/Application) for each
- ✅ Maps solutions back to specific pain points
- ✅ Relative effort estimation (Low/Medium/High)
- ✅ User confirms the path forward

---

## Audit Logging

Log in `audit.md`:
```
### {timestamp} — Phase: Solution Analysis
**Analysis result:** {Single/Multiple} solution(s) identified
**Solutions found:** {list of solution names}
**User decision:** {chosen path}
**Rationale:** {why user chose this path}
```
