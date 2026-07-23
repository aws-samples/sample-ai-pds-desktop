# Prototype Building — HTML Artifact Generation on Quick Desktop

## Purpose
Build interactive HTML prototypes from PROTOTYPE-*.md specifications. Quick Desktop generates HTML-only prototypes that render inline — no dev setup, no localhost, no package management required.

## Entry Conditions
- PROTOTYPE-*.md specs exist (from Spec Generation or Entry Point 3)
- User chose to build prototypes in Quick

## Exit Artifacts
- HTML artifact files rendered inline in session tabs
- Exported standalone HTML files saved to storage location
- Updated PROTOTYPE-*.md with iteration notes (if modified)

---

## Important Context

**What Quick CAN build:**
- Single-page interactive HTML applications
- Chat interfaces with simulated AI responses
- Dashboards with charts (Highcharts)
- Multi-screen apps with tab/page navigation
- Forms with validation
- Responsive layouts
- Data visualization
- Simulated API responses with mock data

**What Quick CANNOT build:**
- Backend servers (no Node.js/Python server)
- Database connections (mock data only)
- Real LLM API calls (simulated responses)
- Package installations (no npm/pip)
- Multi-file applications (single HTML artifact)
- Authentication systems

**For full-stack prototypes:** Use PROTOTYPE-*.md in Kiro or Claude Code.

---

## Step 1: Select Which to Build

If multiple PROTOTYPE-*.md specs exist:

<decision question="Which prototypes would you like to build as HTML?">
<option description="Build all selected prototypes sequentially">Build all {N}</option>
<option description="Pick specific ones to build now">Select specific ones</option>
<option description="Start with the highest-priority one">Build #1 first, decide on others later</option>
</decision>

---

## Step 2: Read Spec & Plan

For each PROTOTYPE-*.md:

1. Read the full specification
2. Present a build plan:

```
**Building: {Use Case Name}**

Based on the spec, here's my plan:
- **Type:** {Single-page app / Chat interface / Dashboard / Multi-view}
- **Screens:** {list from spec}
- **Key interactions:** {list}
- **Mock data:** {what I'll simulate}
- **Limitations:** {what won't work in HTML-only}

I'll generate this as an interactive HTML artifact you can see and test immediately.
```

<decision question="Ready to build?">
<option description="Generate the prototype">Build it</option>
<option description="I want to adjust the plan first">Modify the plan</option>
<option description="Skip this one, move to the next">Skip</option>
</decision>

---

## Step 3: Generate HTML Prototype

### Build Guidelines

1. **Use the html_design skill** for styling (Quick's design tokens)
2. **Use Highcharts** for any data visualization
3. **Make it interactive** — buttons work, tabs switch, forms submit (client-side)
4. **Include realistic mock data** — don't use "Lorem ipsum" or "Test User"
5. **Match brand context** from the PROTOTYPE-*.md spec
6. **Responsive** unless spec says desktop-only
7. **Self-contained** — everything in one HTML file (inline CSS/JS)

### For Agentic Use Cases (Chat Interface)
- Build a chat UI with simulated responses
- Include 3-5 pre-scripted conversation turns showing the happy path
- Show tool usage (e.g., "Searching database..." → results appear)
- Include a text input that triggers simulated responses

### For Application Use Cases (Dashboard/Form)
- Build functional navigation between screens
- Populate with realistic mock data
- Include interactive elements (filters, sorts, expandable rows)
- Show the complete user workflow from the spec's happy path

### Render in Session Tab
Open the generated HTML artifact in a session tab for immediate preview.

---

## Step 4: Iteration Loop

After presenting the prototype:

<decision question="Here's the prototype. What do you think?">
<option description="This looks great — save and move on">Approve</option>
<option description="I want to change something specific">Iterate (tell me what to change)</option>
<option description="The approach isn't right — let's rethink">Major revision needed</option>
<option description="Show it to me on mobile view">Preview on mobile</option>
</decision>

### If iterating:
Ask: "What would you like to change?"

Accept natural language instructions:
- "Make the header blue instead of green"
- "Add a sidebar with navigation"
- "The chart should show monthly data, not daily"
- "Add a loading state when the user clicks submit"
- "Make the chat responses longer and more detailed"

Regenerate and re-present. Repeat until approved.

### Iteration Limits
- Track iterations (typically 3-5 is enough)
- After 5 iterations, ask: "We've iterated several times. Would you like to continue refining, or is this close enough for validation purposes?"

---

## Step 5: Export & Save

Once approved:

1. Save the HTML file to storage: `04-prototypes/{slug}/prototype.html`
2. Update the PROTOTYPE-*.md with any changes made during iteration
3. Log in audit

<decision question="Prototype approved! How would you like to save it?">
<option description="Save HTML file for standalone viewing">Save as HTML file</option>
<option description="Keep the session tab — I'll export later">Keep in session only</option>
<option description="Push to Slack for team to see">Share to Slack</option>
</decision>

---

## Step 6: Repeat or Continue

If more prototypes to build:
"**{Name}** is done! Moving to the next: **{next name}**"

After all prototypes are built:

<decision question="All {N} prototypes are built. What's next?">
<option description="Continue to Product Strategy for the lead use case">Continue to Product Strategy</option>
<option description="I want to refine one of the prototypes more">Go back and iterate</option>
<option description="Distribute prototypes to stakeholders for feedback">Share for feedback</option>
<option description="I'm done — these prototypes are my deliverable">Stop here</option>
</decision>

---

## Transition to Next Phase

If continuing:
- Ask which use case to develop strategy for (if multiple prototypes)
- → Load `rules/discovery/product-strategy.md`

---

## Validation Criteria

A good HTML prototype:
- ✅ Matches the PROTOTYPE-*.md spec's requirements
- ✅ Is interactive (not just a static mockup)
- ✅ Uses realistic mock data
- ✅ Matches brand/style from design context
- ✅ Demonstrates the happy path end-to-end
- ✅ Is visually polished (not developer-grade UI)
- ✅ User has approved it after iteration
- ✅ Works standalone (no external dependencies)

---

## Workshop Mode Notes

In workshop mode:
- Build prototypes with audience watching (live coding demo feel)
- Narrate what you're doing: "I'm creating the chat interface with..."
- Take group feedback in real-time during iteration
- Quick iterations are impressive in live settings — aim for 2-3 visible improvements
- Save screenshots of key iterations for the presentation
