# Question Format Guide — AI-PLC on Quick Desktop

## Overview

AI-PLC on Quick Desktop uses TWO interaction formats:
1. **Decision cards** — for structured choices (multiple choice, yes/no, selection)
2. **Conversational** — for free-form input (descriptions, URLs, names, feedback)

NEVER mix these. Each question uses exactly ONE format.

---

## Decision Cards

### When to Use
- Multiple-choice selections (2-5 options)
- Yes/No confirmations
- Phase transition decisions
- Mode selection
- Approval gates

### Format
```xml
<decision question="Clear, specific question">
<option description="What happens if they choose this">Short label</option>
<option description="What happens if they choose this">Short label</option>
<option description="What happens if they choose this">Short label</option>
</decision>
```

### Rules
1. **Question text** must be a complete, clear question
2. **Option labels** should be SHORT (2-6 words)
3. **Descriptions** explain consequences (what happens next)
4. **Maximum 5 options** — if more needed, split into two decisions
5. **Never use decision cards for free-text input**
6. **Always include a "none of the above" or "other" option** when the list might not cover all cases

### Examples

**Good:**
```xml
<decision question="How many use cases do you want to evaluate?">
<option description="Quick evaluation with focused scoring">3 or fewer</option>
<option description="Standard evaluation with full scoring framework">4 to 8</option>
<option description="Comprehensive evaluation — may take longer">9 or more</option>
</decision>
```

**Bad (too many options, unclear):**
```xml
<decision question="What?">
<option>A</option>
<option>B</option>
<option>C</option>
<option>D</option>
<option>E</option>
<option>F</option>
<option>G</option>
</decision>
```

---

## Conversational Questions

### When to Use
- Gathering pain points (free text)
- Customer/project name
- URL input
- Use case descriptions
- Feedback on generated content
- Clarification requests
- Numerical input (scores, counts)

### Format
Ask the question naturally in your message. Be specific about what you need.

### Rules
1. **One question per message** — never ask multiple questions
2. **Provide context** for why you're asking
3. **Give examples** when the expected format isn't obvious
4. **Indicate scope** — how much detail do you want?

### Examples

**Good:**
```
What customer pain points should we focus on? 

You can:
- Paste a URL to customer reviews or feedback
- Type them out (as many as you have)
- Describe the general problem area and I'll help structure it

Take your time — this is the foundation for everything that follows.
```

**Bad:**
```
Pain points?
```

---

## Confirmation Gates

After generating ANY artifact, present it for review using this pattern:

1. Open the artifact in a session tab
2. Ask for approval:

```xml
<decision question="I've generated the PR/FAQ. How does it look?">
<option description="Move on to the next phase">Approve — looks good</option>
<option description="Tell me what to change and I'll revise">Needs revision</option>
<option description="This isn't right — let's discuss the direction">Major concerns</option>
</decision>
```

If "Needs revision" → ask what to change (conversational)
If "Major concerns" → open discussion about direction (conversational)

---

## Workshop Mode Adaptations

In workshop mode, decision cards serve as GROUP consensus mechanisms:

```xml
<decision question="Does the group agree with these prioritized use cases?">
<option description="Move forward with this ranking">Group agrees</option>
<option description="Capture the disagreement and adjust">Someone disagrees</option>
<option description="More discussion needed before deciding">Need more debate</option>
</decision>
```

If "Someone disagrees":
- Ask: "What's the concern? Who disagrees and what would they change?"
- Log dissent in audit trail
- Revise and re-present

---

## Question Sequencing

### Phase Entry
When entering a new phase, ALWAYS:
1. Announce the phase: "We're now entering **Use Case Intake**"
2. Briefly explain what will happen
3. Ask the first question for that phase

### Phase Exit
When completing a phase, ALWAYS:
1. Present the artifact
2. Confirm approval
3. Offer phase transition decision

### Never Ask
- Multiple questions in one message
- The same question twice (unless user explicitly asks to reconsider)
- Questions whose answers you already have from prior context
- Technical questions (this is for PMs and business leaders)
