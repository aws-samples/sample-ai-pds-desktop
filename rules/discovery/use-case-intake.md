# Use Case Intake — Structured Documentation of N Use Cases

## Purpose
Guide the user through documenting ALL their use case ideas in a structured, categorized format. Supports any number of use cases (3, 5, 10, 20+). Each use case is classified as Agentic or Application.

## Entry Conditions
- User selected Entry Point 2 (Use Cases), OR
- Multiple solutions extracted from Solution Analysis (pre-populated)

## Exit Artifact
- `02-use-case-intake/use-cases.md` — Complete use case repository

---

## Step 1: Determine Scope

If NOT pre-populated from Solution Analysis:

Ask: "How many use cases do you want to evaluate? Give me a rough count — it can be approximate."

<decision question="Roughly how many use cases do you have in mind?">
<option description="Quick focused evaluation">3 or fewer</option>
<option description="Standard evaluation — covers most scenarios">4 to 8</option>
<option description="Comprehensive evaluation of many ideas">9 or more</option>
</decision>

This sets expectations for session length and depth.

---

## Step 2: Gather Use Cases

### For each use case, gather:

1. **Name** — Short, descriptive title (2-5 words)
2. **Description** — What does this solve? (1-3 sentences)
3. **Primary user** — Who uses this? (role/persona)
4. **Pain point addressed** — What problem does it solve?
5. **Type classification** — Agentic or Application (AI helps classify)

### Intake Approach

Ask use cases ONE AT A TIME:

```
Let's document use case #{N}.

What's the use case? Give me a name and brief description. 
I'll ask follow-up questions to fill in the details.
```

After user provides initial description, ask focused follow-ups:
- "Who is the primary user of this?"
- "What pain point does it address?"

Then CLASSIFY the type:

### Type Classification Logic

**Agentic Use Case** — If the solution:
- Orchestrates multiple tools/APIs autonomously
- Makes decisions with minimal human intervention
- Has a conversation/chat interface
- Retrieves, reasons over, and acts on information
- Involves multi-step workflows with branching logic
- Examples: AI assistant, automated research agent, intelligent scheduler

**Application Use Case** — If the solution:
- Has a traditional UI (forms, dashboards, CRUD)
- User drives all actions explicitly
- Processes data in predictable patterns
- Has well-defined input/output without reasoning
- May use AI/ML but as a feature, not the core architecture
- Examples: Analytics dashboard, workflow automation tool, recommendation engine

Present classification with rationale:

```
I'd classify this as **{Agentic/Application}** because:
- {reason 1}
- {reason 2}

Does that classification feel right?
```

<decision question="Do you agree with the {Agentic/Application} classification for '{use case name}'?">
<option description="The classification is correct">Yes, that's right</option>
<option description="I think it should be the other type">No, it's actually {opposite}</option>
<option description="It's a mix — has elements of both">It's a hybrid</option>
</decision>

---

## Step 3: Progressive Summary

After every 3 use cases documented, present a running summary:

```markdown
## Use Cases Documented So Far ({N} of ~{total})

| # | Name | Type | Primary User | Pain Point |
|---|---|---|---|---|
| 1 | {name} | Agentic | {user} | {pain point} |
| 2 | {name} | Application | {user} | {pain point} |
| 3 | {name} | Agentic | {user} | {pain point} |
```

<decision question="We have {N} use cases documented. Continue?">
<option description="Document the next use case">Add more</option>
<option description="I think we have all the important ones">That's all — proceed to gap analysis</option>
<option description="Let me edit what we have so far">Revise existing ones</option>
</decision>

---

## Step 4: Gap & Overlap Analysis

After all use cases are captured, perform analysis:

### Overlap Detection
- Identify use cases that solve similar problems
- Flag potential merges: "UC #2 and UC #5 both address scheduling — should they be one?"

### Gap Detection  
- Compare against pain points (if from Entry Point 1): "Pain point #3 (slow reporting) doesn't have a use case addressing it. Should we add one?"
- Check for missing personas: "All use cases target admins — are there end-user-facing opportunities?"

### Coverage Analysis
- How many are Agentic vs. Application?
- Are pain points evenly covered or concentrated?

Present findings:

```
## Gap & Overlap Analysis

**Overlaps detected:**
- UC #2 and UC #5 address similar problems — consider merging

**Gaps:**
- Pain point #3 has no corresponding use case
- No use cases target the end-user persona

**Distribution:**
- Agentic: {N} use cases
- Application: {M} use cases
```

<decision question="I've found some overlaps and gaps. How do you want to proceed?">
<option description="Merge overlapping UCs, add ones for gaps">Address overlaps and gaps</option>
<option description="Merge overlaps but skip gaps">Just fix overlaps</option>
<option description="Keep everything as-is and proceed to scoring">Proceed as-is</option>
</decision>

---

## Step 5: Generate Use Case Repository

Save the final use case repository as `02-use-case-intake/use-cases.md`:

Use the format from `templates/use-case-card.md` for each use case.

Also offer Excel export:
<decision question="Would you like the use case repository as an Excel file too?">
<option description="Useful for sharing with stakeholders who prefer spreadsheets">Yes, generate Excel</option>
<option description="Markdown is sufficient">No, markdown only</option>
</decision>

---

## Transition to Next Phase

"All {N} use cases are documented and classified. Next, we'll score and prioritize them to select the top 3 for prototyping."

→ Load `rules/discovery/use-case-prioritization.md`

---

## Validation Criteria

A good Use Case Intake output has:
- ✅ At least 3 use cases documented
- ✅ Each has: name, description, primary user, pain point, type
- ✅ Type classification (Agentic/Application) confirmed for each
- ✅ Gap and overlap analysis performed
- ✅ User has confirmed the final list
- ✅ Repository saved in structured format

---

## Workshop Mode Notes

In workshop mode:
- Use cases often come from multiple stakeholders — capture WHO suggested each
- Group may disagree on classifications — log debates
- Consider round-robin: each person contributes one use case per round
- Limit to 15-20 max in a single session for time management
- Use sticky note metaphor: "Everyone share your top 3 ideas, then we'll organize"
