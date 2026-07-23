# Prototype Context Generation — PROTOTYPE-*.md Spec Creation

## Purpose
For each selected use case, gather the design and technical context needed to generate a self-contained PROTOTYPE-*.md specification file. These specs are PORTABLE — they work identically in Quick Desktop, Kiro, and Claude Code.

## Entry Conditions
- Top use cases selected from Prioritization (typically 3)
- OR single solution from Solution Analysis

## Exit Artifacts
- `04-prototypes/PROTOTYPE-{slug-1}.md`
- `04-prototypes/PROTOTYPE-{slug-2}.md`
- `04-prototypes/PROTOTYPE-{slug-3}.md`

---

## Step 0: Overview

Present what's about to happen:

```
I'll now create detailed prototype specifications for your top {N} use cases.
For each one, I need to gather:
1. Design context (visual style, branding)
2. Technical requirements (LLM, tools, integrations)
3. Frontend specifications (screens, interactions, devices)

Each spec becomes a PROTOTYPE-*.md file — a portable document that any 
AI development tool can use to build the prototype.

Let's start with: **{Use Case #1 Name}**
```

---

## Step 1: Design Context (per use case)

### Brand / Visual Style

<decision question="Does this prototype need to match existing brand guidelines?">
<option description="I'll fetch colors, fonts, and style from the URL">Yes — I have a brand URL</option>
<option description="Use a clean, professional default style">No — use a neutral style</option>
<option description="I'll describe the look and feel I want">I'll describe it</option>
</decision>

If brand URL:
- Ask for URL
- Fetch and extract: primary colors, typography, logo style, overall aesthetic
- Confirm: "I found these brand elements: {list}. Look right?"

If described:
- Ask: "Describe the visual style — colors, mood, any references?"

### Target Audience
Ask: "Who will USE this prototype? (e.g., dental office manager, patient, admin)"

### Key Workflow
Ask: "Walk me through the happy path — what does the user do from start to finish?"

---

## Step 2: Technical Requirements (per use case)

### For Agentic Use Cases:

<decision question="What LLM provider should the agent use?">
<option description="Amazon Bedrock models (Claude, Titan, etc.)">Amazon Bedrock</option>
<option description="OpenAI API (GPT-4, etc.)">OpenAI</option>
<option description="Anthropic direct API">Anthropic</option>
<option description="I'm not sure yet — recommend one">Recommend for me</option>
</decision>

Ask: "What tools or APIs does the agent need to access?" (e.g., database, email, calendar, external APIs)

Ask: "What data sources does it need to reason over?" (e.g., documents, knowledge bases, real-time data)

### For Application Use Cases:

Ask: "What are the core features? List the top 3-5 things a user must be able to DO."

Ask: "What data does it need? Where does it come from?"

Ask: "Any specific integrations required?" (e.g., connect to EHR, pull from CRM)

---

## Step 3: Frontend Specification (per use case)

<decision question="What devices should the prototype target?">
<option description="Standard desktop web application">Desktop only</option>
<option description="Phone-first responsive design">Mobile only</option>
<option description="Works on all screen sizes">Responsive (all devices)</option>
</decision>

Ask: "What are the key screens or views? (e.g., dashboard, chat interface, settings, report view)"

Ask: "What are the most important user interactions? (e.g., search, upload, chat, configure)"

---

## Step 4: Acceptance Criteria

Ask: "How will you know the prototype is 'good enough'? What must it demonstrate?"

Guide toward specific, testable criteria:
- "A user can {action} and see {result}"
- "The agent correctly handles {scenario}"
- "Data from {source} appears in {location}"

---

## Step 5: Generate PROTOTYPE-*.md

Using the template from `templates/prototype-spec-template.md`, generate the full spec file.

### File Naming Convention
- Slug format: lowercase, hyphens, no special chars
- Example: `PROTOTYPE-intelligent-scheduling-agent.md`
- Example: `PROTOTYPE-patient-communication-dashboard.md`

### Generation Rules
1. Include ALL gathered context — the spec must be self-contained
2. A developer reading ONLY this file should understand what to build
3. Include both functional requirements and design direction
4. Acceptance criteria must be testable
5. Note what's in-scope for prototype vs. production

### Present for Review

Open the generated spec in a session tab.

<decision question="Here's the PROTOTYPE-*.md spec for '{use case name}'. How does it look?">
<option description="Spec captures everything needed — save it">Approve</option>
<option description="Missing something or needs changes">Needs revision</option>
<option description="Let's discuss the scope — it might be too much/little">Discuss scope</option>
</decision>

---

## Step 6: Repeat for Each Use Case

After first spec is approved:
"Great! PROTOTYPE-{slug-1}.md is saved. Let's move to the next use case: **{name}**"

Repeat Steps 1-5 for each selected use case.

### Efficiency for Shared Context
If multiple use cases share design context (same brand, same customer):
- "Should I use the same brand/style for the other prototypes, or does each need its own?"
- Reuse confirmed context; only ask what's different

---

## Step 7: Post-Generation Decision

After ALL specs are generated:

<decision question="All {N} prototype specs are ready. What would you like to do next?">
<option description="Generate HTML prototypes right here in Quick Desktop">Build prototypes now</option>
<option description="Save PROTOTYPE-*.md files for Kiro or Claude Code to build">Hand off specs to dev teams</option>
<option description="Build some here, hand off others to different teams">Mix — build some, hand off others</option>
<option description="Stop here — specs are my deliverable">Stop (specs are enough)</option>
</decision>

If "Build now" → Load `rules/discovery/prototype-building.md`
If "Hand off" → Offer distribution options (Slack, OneDrive, email)
If "Mix" → Ask which to build, which to hand off
If "Stop" → Offer to continue to Product Strategy or end

---

## Transition to Next Phase

### If building:
→ Load `rules/discovery/prototype-building.md`

### If handing off:
<decision question="How should I distribute the PROTOTYPE-*.md specs?">
<option description="Post to a Slack channel for teams to pick up">Share via Slack</option>
<option description="Save to OneDrive where teams can access">Save to OneDrive</option>
<option description="Email specific specs to specific people">Email to individuals</option>
<option description="Just save to workspace — I'll handle distribution">Save only</option>
</decision>

---

## Validation Criteria

A good PROTOTYPE-*.md spec:
- ✅ Self-contained — readable without any other context
- ✅ Has clear use case description and user story
- ✅ Design context is specific (not "make it look nice")
- ✅ Technical requirements are actionable
- ✅ Frontend spec defines screens and interactions
- ✅ Acceptance criteria are testable
- ✅ Scope is appropriate for a prototype (not production)
- ✅ Format matches the cross-platform template exactly

---

## Workshop Mode Notes

In workshop mode:
- Design context gathering can be done once for shared brand
- Different sub-teams may build different prototypes
- Distribute specs at end of Day 1 → teams build on Day 2
- Ensure specs are clear enough that teams NOT present during discovery can build from them
