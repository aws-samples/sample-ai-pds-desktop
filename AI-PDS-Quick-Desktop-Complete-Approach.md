# AI-PDS: AI-PLC Implementation on Amazon Quick Desktop

## Complete Approach Document

**Program:** AI-PDS (AI Product Discovery & Strategy)  
**Implementation:** AI-PLC (AI-Driven Product Life Cycle)  
**Version:** 1.0 | 2026-07-21 | Author: Rachna Chadha

---

## Naming Convention

| Term | Meaning |
|---|---|
| **AI-PDS** | AI Product Discovery & Strategy — the **program** name (umbrella brand) |
| **AI-PLC** | AI-Driven Product Life Cycle — the **implementation** (workflow, repo, rules, artifacts) |

---

## 1. Executive Summary

AI-PLC is a markdown-based workflow that guides Product Managers, business leaders, and non-technical roles through product discovery and strategy using natural language conversation. It currently runs on Claude Code and Kiro via [sample-ai-plc](https://github.com/aws-samples/sample-ai-plc). 

This document defines the approach for implementing AI-PLC on Amazon Quick Desktop — giving customers who prefer Quick Desktop another tool choice to run the same AI-PDS workflow.

**Proven at scale:** Henry Schein One — 17 leaders, 4 working prototypes in <24 hours, 2 heading to production.

---

## 2. Why Quick Desktop as an Option?

AI-PDS is tool-agnostic. Customers choose the tool that fits them:
- **Kiro** — for customers who like working in an IDE
- **Claude Code** — for customers comfortable in the terminal
- **Quick Desktop** — for customers who want a less technical interface and easy PoC creation

**Quick Desktop's key advantages:**

1. **Easy PoC creation** — creates working prototypes through a conversational, non-technical interface. No IDE, no terminal, no git setup. Product leaders can generate PoCs without developer tooling.

2. **Slack integration** — pull customer pain points from Slack conversations, share artifacts to channels in real-time during workshops, distribute PROTOTYPE-*.md specs to teams via Slack.

3. **Email integration** — mine customer emails for pain points and feature requests, send Discovery artifacts directly to stakeholders, share outputs without leaving the session.

4. **Knowledge graph (KB) integration** — auto-surface existing customer context (pain points, prior conversations, meeting notes) that enrich the discovery process without manual re-entry.

These integrations **enhance the outputs** from AI-PLC — the same workflow produces richer results because Quick can pull context the user would otherwise have to type manually.

### Discovery Document: Split Output (Applies to Quick AND Kiro Next)

Currently in Kiro/Claude Code, all phase outputs are bundled into one monolithic `discovery-document.md`. This will be **split into separate per-phase artifacts** — both on Quick Desktop (implemented now) and on Kiro (next update). See Section 8 for the split structure.

---

## 3. The AI-PLC Capability Model (6 Capabilities)

The framework is modular — start from any capability, stop at any stage with a standalone deliverable.

| # | Capability | What Happens | Exit Artifact |
|---|---|---|---|
| 1 | **Envision** | Pain point gathering (URL-based, free-text, or AI-assisted research), VoC synthesis, PR/FAQ (Working Backwards), solution analysis (single vs. multiple) | PR/FAQ |
| 2 | **Use Case Intake** | Document N use cases (3, 5, 10, 20+), categorize Agentic vs. Application, gap/overlap analysis | Use Case Repository |
| 3 | **Prioritize** | Dual scoring frameworks (Agentic vs. Application), weighted multi-dimension scoring, top 3 selection | Prioritized Backlog |
| 4 | **Prototype** | Generate PROTOTYPE-*.md specs. Decision: build now OR hand off to distributed teams | PROTOTYPE-*.md files |
| 5 | **Product Strategy** | Positioning, business model, KPI definition, competitive analysis | Strategy Document |
| 6 | **Go-to-Market** | Segmentation, sales motions, launch sequencing, channel prioritization | GTM Plan |

**Key principles:**
- Every stage is an exit point — customers get value at any stopping point
- Fully auditable (all decisions logged in `audit.md`)
- Supports Mob Discovery (core team discovers → specs distributed → parallel build)
- Tool-agnostic — same workflow on Claude Code, Kiro, or Quick Desktop

---

## 4. Three Entry Points

| Entry Point | You have... | What happens |
|---|---|---|
| **1. Pain Points** | Customer feedback, reviews, research, or a problem area | AI guides pain point gathering → PR/FAQ (Working Backwards) → Solution Analysis → if multiple solutions, merges into Use Case Prioritization |
| **2. Use Cases** | Multiple use case ideas needing evaluation | AI helps document all use cases → scores with dual frameworks → selects top 3 → generates PROTOTYPE-*.md specs |
| **3. Existing Specs** | PROTOTYPE-*.md files from a prior session or another team | Skips all discovery → builds prototypes directly from specs |

### Engagement Paths

| Path | Capabilities Used | Deliverable |
|---|---|---|
| Quick Discovery | Envision only | PR/FAQ or PRD |
| Structured Opportunity | Envision + Intake | Use Case Repository |
| Investment-Ready Backlog | + Prioritize | Ranked Use Case Backlog |
| Validated Concept | + Prototype | Prototype + Build Decision |
| Strategic Foundation | + Product Strategy | Full Product Strategy |
| Complete AI-Ready Package | All Six | AI SDLC Context Package |

### Flow Diagram

```
Entry Point 1          Entry Point 2          Entry Point 3
─────────────          ─────────────          ─────────────
Pain Points            Use Cases              Existing Specs

     │                      │                      │
     ▼                      ▼                      ▼
Envision               Use Case Intake        Skip Discovery
(PR/FAQ)               (Document all)         Build directly
     │                      │
     ▼                      ▼
Solution Analysis      Prioritize
┌─single─┐             (Dual frameworks)
│        │                  │
▼        ▼                  ▼
Build   Multiple ──────► Top 3 Selected
now     solutions        │
│                       ▼
│              Prototype Spec Generation
│                       │
│              ┌────────┼────────┐
│              ▼                 ▼
│         Build now        Hand off specs
│              │                 │
▼              ▼                 (stop)
Prototype Building
     │
     ▼
Product Strategy → Go-to-Market → Discovery Complete
```

---

## 5. Current Architecture (Claude Code / Kiro)

### Repository Structure

```
sample-ai-plc/
├── aiplc-rules/
│   ├── aws-aiplc-rules/
│   │   └── core-workflow.md              ← Main orchestration
│   └── aws-aiplc-rule-details/           ← Phase-specific rules (loaded on demand)
│       ├── common/
│       │   ├── process-overview.md
│       │   ├── session-continuity.md
│       │   ├── content-validation.md
│       │   ├── question-format-guide.md
│       │   ├── welcome-message.md
│       │   └── ascii-diagram-standards.md
│       ├── discovery/
│       │   ├── discovery-mode-selection.md
│       │   ├── envision.md
│       │   ├── solution-analysis.md
│       │   ├── use-case-intake.md
│       │   ├── use-case-prioritization.md
│       │   ├── prototype-context-generation.md
│       │   ├── prototype-building.md
│       │   ├── prototype-validation.md
│       │   ├── product-strategy.md
│       │   └── go-to-market.md
│       └── inception/
│           └── workspace-detection.md
└── README.md
```

### How It Works Today

1. **Setup:** User copies `core-workflow.md` as `CLAUDE.md` (Claude Code) or into `.kiro/steering/` (Kiro). Rule detail folder goes alongside.

2. **Execution:** AI reads `core-workflow.md` as system prompt:
   - Displays welcome message
   - Runs workspace detection (checks for existing PROTOTYPE-*.md)
   - Determines entry point
   - Loads phase-specific rules on demand
   - Asks questions using `[Answer]:` tag format
   - Generates artifacts into `aiplc-docs/`
   - Maintains `audit.md` for decision logging
   - Saves `aiplc-state.md` for session resumption

3. **Interaction model:**
```
AI: How would you like to start Discovery?

[A] Start from customer pain points (create PR/FAQ)
[B] I already have use cases to prioritize

[Answer]:
```

### Key Design Patterns

| Pattern | How it's used |
|---|---|
| Rule loading on demand | AI only reads phase rules when entering that phase |
| `[Answer]:` format | Standardized question/response with multiple choice |
| Audit trail | Every user input logged verbatim with timestamps |
| Session state | `aiplc-state.md` tracks current phase and progress |
| Portable specs | PROTOTYPE-*.md files are self-contained |
| Workspace detection | On start, AI checks what exists to determine where to resume |
| Dual scoring | Separate prioritization for Agentic vs. Application use cases |
| Exit points | Stop at any phase with a complete deliverable |

### What Claude Code / Kiro Can Do That Quick Cannot

- Full local prototype builds (`pip install`, `npm install`, localhost deployment)
- File system orchestration (create project dirs, write arbitrary files)
- Package management and server deployment

---

## 6. Quick Desktop Implementation

### Skill Structure

```
ai-plc/
├── SKILL.md                              ← Orchestrator (ported from core-workflow.md)
├── rules/
│   ├── common/
│   │   ├── process-overview.md
│   │   ├── session-continuity.md
│   │   ├── content-validation.md
│   │   └── question-format-guide.md      ← Adapted for decision cards
│   └── discovery/
│       ├── envision.md
│       ├── solution-analysis.md
│       ├── use-case-intake.md
│       ├── use-case-prioritization.md
│       ├── prototype-context-generation.md
│       ├── prototype-building.md         ← Adapted for HTML artifacts
│       ├── product-strategy.md
│       └── go-to-market.md
├── templates/
│   ├── prfaq-template.md
│   ├── use-case-card.md
│   ├── scoring-agentic.md
│   ├── scoring-application.md
│   └── prototype-spec-template.md
└── examples/
    └── henry-schein-one/
```

### How It's Invoked

User says: "Start AI-PLC", "Help me with product discovery", "I want to prioritize use cases", or "Build a prototype from these specs". Quick loads the skill and the orchestrator takes over.

### Key Adaptations

| Aspect | Claude Code / Kiro | Quick Desktop |
|---|---|---|
| Instruction loading | `core-workflow.md` as CLAUDE.md or steering | `SKILL.md` auto-loaded on invocation |
| Sub-rule loading | AI reads files from filesystem | Skill reads companion files from skill folder |
| Question format | `[Answer]:` tag | Decision cards for choices; conversational for free-form |
| Output storage | `aiplc-docs/` in project dir | User-selected: OneDrive / workspace / export |
| Session state | `aiplc-state.md` file | Conversation persistence + state file backup |
| Audit trail | `audit.md` file | Conversation IS audit + generated audit.md |
| Workspace detection | Check filesystem for PROTOTYPE-*.md | Check user's folder or ask entry point |
| Prototype building | pip/npm install, localhost deploy | HTML artifact inline + PROTOTYPE-*.md for Kiro handoff |
| Web research | Built-in web tool | web_search + url_fetch + KG + file_rag_search |
| Customer context | Manual input only | Auto-pull from Slack, email, KG |

---

## 7. How Quick Desktop Workflows Are Used (Phase by Phase)

### Phase 0: Initialization

```
User: "Start AI-PLC for [customer name]"
```

1. Loads `SKILL.md` orchestrator + `common/process-overview.md`
2. Displays welcome message
3. Checks knowledge graph for customer context (pain points from emails, Slack, meetings)
4. Checks if project folder has existing PROTOTYPE-*.md files
5. Presents entry point selection via decision card:

```xml
<decision question="How would you like to start AI-PLC Discovery?">
<option description="Explore customer pain points → PR/FAQ → solutions">Start from customer pain points</option>
<option description="Document and prioritize multiple use case ideas">I already have use cases to prioritize</option>
<option description="Build prototypes from existing PROTOTYPE-*.md files">I have prototype specs ready</option>
</decision>
```

### Phase 1: Envision

1. Loads `discovery/envision.md` rules
2. Asks how to gather pain points:

```xml
<decision question="How do you want to provide customer pain points?">
<option description="Paste a URL to customer reviews, feedback, or research">From a URL</option>
<option description="Type or paste pain points directly">Free-form text</option>
<option description="Quick searches your email, Slack, and KG for this customer">Pull from my connected context</option>
</decision>
```

3. If "connected context" → searches KG, email, Slack for customer
4. Synthesizes pain points → presents for confirmation
5. Generates PR/FAQ (Working Backwards) → presents in session tab
6. Runs solution analysis → single or multiple path

**Quick enhancement:** "Pull from connected context" — not available in Claude Code/Kiro.
**Quick note:** "Pull from connected context" is a Quick-specific option since Quick has access to connected services.

### Phase 2: Use Case Intake

1. Loads `discovery/use-case-intake.md`
2. Asks how many use cases
3. Guided intake → categorize Agentic vs. Application
4. Generates use case repository (Markdown + optional Excel)

### Phase 3: Prioritize

1. Loads `discovery/use-case-prioritization.md`
2. Applies dual scoring (Agentic framework + Application framework)
3. **Generates interactive Highcharts visualization** showing scores
4. Presents ranked list with trade-off analysis
5. User confirms top 3

**Quick note:** Interactive scoring visualization is generated as an HTML artifact since Quick supports rich rendering.

### Phase 4: Prototype Spec Generation

1. Loads `discovery/prototype-context-generation.md`
2. For each top 3: gathers design context, defines requirements, specifies frontend
3. Generates `PROTOTYPE-{slug}.md` files
4. Decision:

```xml
<decision question="What would you like to do with the prototype specs?">
<option description="Generate HTML prototypes right here in Quick">Build prototypes now</option>
<option description="Save specs for Kiro/Claude Code to build full apps">Hand off specs to dev teams</option>
<option description="Build some now, hand off others">Mix</option>
</decision>
```

### Phase 5: Prototype Building (if selected)

1. Reads PROTOTYPE-*.md spec
2. Generates interactive HTML artifact → rendered inline
3. User iterates with natural language
4. Exports as standalone HTML

**Note:** Quick builds HTML-only prototypes. For full-stack, use PROTOTYPE-*.md in Kiro/Claude Code.

### Phase 6: Product Strategy

1. Conversational strategy development + web research for competitive landscape
2. Generates strategy document (Markdown or DOCX)

### Phase 7: Go-to-Market

1. Conversational GTM planning
2. Generates GTM plan (Markdown or DOCX)

### Phase 8: Discovery Complete

1. All phase artifacts are already saved as separate files
2. Presents handoff options:

```xml
<decision question="How would you like to hand off to the dev team?">
<option>Share via Slack</option>
<option>Send via email</option>
<option>Create calendar invite for AIDLC bolt</option>
<option>Save only</option>
</decision>
```

---

## 8. Output Structure (Split Artifacts — applies to Quick AND Kiro)

**Design change:** No monolithic `discovery-document.md`. Each phase = standalone artifact. The folder IS the Discovery Document.

```
aiplc-docs/
├── 01-envision/
│   ├── pain-points.md
│   └── prfaq.md
├── 02-use-case-intake/
│   └── use-cases.md
├── 03-prioritization/
│   ├── scoring.md
│   └── ranking.md
├── 04-prototypes/
│   ├── PROTOTYPE-{slug-1}.md       ★ Portable
│   ├── PROTOTYPE-{slug-2}.md       ★ Portable
│   └── PROTOTYPE-{slug-3}.md       ★ Portable
├── 05-product-strategy/
│   └── strategy.md
├── 06-go-to-market/
│   └── gtm-plan.md
├── aiplc-state.md
└── audit.md
```

**Benefits:**
- Share only what's relevant (e.g., just prioritized backlog for exec review)
- Teams pick up individual artifacts without context overload
- Iterate on one phase without touching others
- Same structure across Quick, Kiro, and Claude Code

---

## 9. Workshop Mode (Mob Discovery)

### Flow

```
┌──────────────────────────────────────────────────┐
│  FACILITATOR (runs Quick Desktop, screen-shares) │
├──────────────────────────────────────────────────┤
│  Step 1: Start AI-PLC → Welcome                  │
│  Step 2: Core team provides pain points / UCs    │
│  Step 3: AI synthesizes → group validates        │
│  Step 4: Prioritization → group debates scores   │
│  Step 5: Top 3 selected → generate PROTOTYPE-*.md│
│  Step 6: Distribute specs to sub-teams           │
└───────────────┬──────────────────────────────────┘
                │
    ┌───────────┼───────────┐
    ▼           ▼           ▼
┌────────┐ ┌────────┐ ┌────────┐
│ Team A │ │ Team B │ │ Team C │
│ (Quick)│ │ (Kiro) │ │(Claude)│
└────────┘ └────────┘ └────────┘
    │           │           │
    ▼           ▼           ▼
Prototype 1  Prototype 2  Prototype 3
```

### Workshop Timeline (Typical 2-Day)

**Day 1: Discovery & Prioritization (Mob)**

| Time | Activity |
|---|---|
| 9:00-9:30 | Kickoff — Quick loads customer context from KG |
| 9:30-11:00 | Envision — pain points + web research |
| 11:00-12:00 | PR/FAQ — group iterates |
| 1:00-2:30 | Use Case Intake — document all cases |
| 2:30-4:00 | Prioritization — Highcharts scoring, group debates |
| 4:00-5:00 | Top 3 → generate PROTOTYPE-*.md |

**Day 2: Parallel Build**

| Time | Activity |
|---|---|
| 9:00-9:30 | Distribute specs to sub-teams (Slack/OneDrive) |
| 9:30-3:00 | Sub-teams build prototypes (Quick, Kiro, or Claude Code) |
| 3:00-4:00 | Prototype presentations |
| 4:00-5:00 | Product Strategy + GTM for winning prototype |

### Quick-Specific Workshop Enhancements

- **Real-time Slack push** — artifacts posted to workshop channel as generated
- **Group consensus** — decision cards capture group votes
- **Multi-format export** — scoring as Excel, PR/FAQ as DOCX
- **Connected context** — KG/Slack/email surfaces context group may not have top-of-mind
- **Presentation mode** — explore larger font artifacts for screen-sharing

---

## 10. Platform Comparison

AI-PDS supports multiple tools. Customers pick what fits their preference:

| Dimension | Claude Code | Kiro | Quick Desktop |
|---|---|---|---|
| **Setup** | Copy CLAUDE.md + rule folder | Copy to .kiro/steering/ | Install skill once |
| **Interaction** | Terminal chat | IDE chat panel | Rich UI + decision cards |
| **Research** | Built-in web search | Built-in web search | Web search + KG + connected services |
| **Visualizations** | Text/markdown | Text/markdown | Highcharts + Excel |
| **Prototype build** | Full local (pip/npm) | Full local (IDE) | HTML PoC (easy, no dev setup) |
| **Collaboration** | Git sharing | Git sharing | Slack/email/OneDrive |
| **Audit** | audit.md | audit.md | Conversation + audit.md |
| **Best for** | PMs comfortable in terminal | Teams who prefer an IDE | Non-tech stakeholders who want easy PoC creation |
| **Technical level** | High | Medium | Low |

---

## 11. Design Decisions

| # | Decision |
|---|---|
| 1 | **Prototype = Both** — HTML artifacts for validation + PROTOTYPE-*.md specs for Kiro/Claude Code handoff |
| 2 | **Storage = Ask user** — OneDrive, workspace, or export (no default imposed) |
| 3 | **Session continuity** — Conversation persists + `aiplc-state.md` backup + Quick memory |
| 4 | **Distribution = Ask user** — OneDrive, workspace, or plain export via decision card |
| 5 | **Workshop = Slack push** — key artifacts pushed to channel in real-time |
| 6 | **Discovery output = Split** — per-phase artifacts, no monolithic file (fix in Kiro too) |

### Rule File Porting Strategy

| Aspect | What changes for Quick |
|---|---|
| `[Answer]:` format | → Decision cards for choices, conversational for free-form |
| Web research instructions | Trimmed — Quick handles natively |
| Content validation (ASCII) | Trimmed — Quick renders HTML/charts directly |
| Scoring output | Enhanced — Highcharts + Excel |
| Customer context | Enhanced — KG search, email/Slack mining as options |
| Session continuity | Adapted — conversation persists; state file is backup |
| Audit logging | Adapted — conversation IS audit; also generate artifact |

### PROTOTYPE-*.md Compatibility

Format MUST stay identical across platforms:

```markdown
# PROTOTYPE-{use-case-slug}

## Use Case
[Description]

## Design Context
- Brand URL: [url]
- Color palette: [colors]
- Visual style: [description]

## Requirements
### LLM Requirements
- Provider: [bedrock/openai/anthropic]
- Model: [specific model]

### Tools & Integrations
- [tool 1]
- [tool 2]

### Frontend
- Device targets: [desktop/mobile/tablet]
- Screens: [list of screens]
- Key interactions: [list]

## Acceptance Criteria
- [criterion 1]
- [criterion 2]
```

---

## 12. Implementation Plan

| Phase | What | Effort |
|---|---|---|
| 1 | Port `core-workflow.md` → `SKILL.md` + adapt question format | 1 week |
| 2 | Envision + Solution Analysis (with KG/Slack enhancement) | 1 week |
| 3 | Use Case Intake + Prioritization (with Highcharts) | 1 week |
| 4 | Prototype spec generation + HTML artifact building | 1 week |
| 5 | Product Strategy + GTM + split output structure | 3 days |
| 6 | Workshop mode + Slack integration + state management | 1 week |
| 7 | End-to-end testing with real customer scenario | 1 week |

---

## 13. Success Criteria

- [ ] PM completes full discovery flow (pain points → all artifacts) in a single Quick session
- [ ] Use Case Intake handles 10+ use cases with dual scoring
- [ ] PROTOTYPE-*.md specs are compatible across Quick, Kiro, and Claude Code (same format)
- [ ] HTML prototype generated from spec is functional and interactive
- [ ] Workshop mode: facilitator + 10 participants, artifacts pushed to Slack
- [ ] Session resumption works across days
- [ ] Output quality matches what Claude Code/Kiro produces today
- [ ] Split artifact structure works in both Quick and Kiro

---

*Program: AI-PDS | Implementation: AI-PLC | Version 1.0 | 2026-07-21 | Author: Rachna Chadha*
