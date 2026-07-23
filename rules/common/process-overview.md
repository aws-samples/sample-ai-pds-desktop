# Process Overview — AI-PLC on Quick Desktop

## The AI-PLC Capability Model

AI-PLC implements 6 capabilities for product discovery and strategy. Each capability produces a standalone deliverable — you can stop at any point.

```
┌─────────────────────────────────────────────────────────────┐
│  1. ENVISION                                                │
│     Pain points → VoC synthesis → PR/FAQ (Working Backwards)│
│     Exit: PR/FAQ document                                   │
├─────────────────────────────────────────────────────────────┤
│  2. USE CASE INTAKE                                         │
│     Document N use cases → Categorize Agentic vs Application│
│     Exit: Use Case Repository                               │
├─────────────────────────────────────────────────────────────┤
│  3. PRIORITIZE                                              │
│     Dual scoring frameworks → Weighted scoring → Top 3      │
│     Exit: Prioritized Backlog                               │
├─────────────────────────────────────────────────────────────┤
│  4. PROTOTYPE                                               │
│     Generate PROTOTYPE-*.md specs + optional HTML builds    │
│     Exit: PROTOTYPE-*.md files                              │
├─────────────────────────────────────────────────────────────┤
│  5. PRODUCT STRATEGY                                        │
│     Positioning, business model, KPIs, competitive analysis │
│     Exit: Strategy Document                                 │
├─────────────────────────────────────────────────────────────┤
│  6. GO-TO-MARKET                                            │
│     Segmentation, sales motions, launch sequencing          │
│     Exit: GTM Plan                                          │
└─────────────────────────────────────────────────────────────┘
```

## Core Principles

1. **AI proposes, humans decide** — Present structured options, never auto-commit decisions
2. **Every stage is an exit point** — Customers get a complete, usable deliverable at any stopping point
3. **Workflow adapts to the work** — Don't force users through unnecessary phases
4. **One question at a time** — Never batch questions; wait for each response
5. **Show before save** — Present all artifacts for review before writing to storage
6. **Fully auditable** — Every decision and input logged with timestamps
7. **Portable outputs** — PROTOTYPE-*.md files work identically across Quick, Kiro, and Claude Code
8. **Tool-agnostic** — Same conceptual workflow regardless of which tool runs it

## Quick Desktop Advantages

These capabilities are unique to the Quick Desktop implementation:

| Capability | How It Helps |
|---|---|
| Knowledge Graph | Auto-surface customer context from prior conversations |
| Slack integration | Pull pain points from channels; push artifacts in real-time |
| Email integration | Mine customer emails for feedback and feature requests |
| Highcharts | Interactive scoring visualizations during prioritization |
| HTML artifacts | Build PoC prototypes inline without dev tooling |
| Decision cards | Structured choices with rich formatting |
| OneDrive | Save/share artifacts with team directly |

## Output Structure

All artifacts are saved as split files (no monolithic discovery document):

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
│   ├── PROTOTYPE-{slug-1}.md
│   ├── PROTOTYPE-{slug-2}.md
│   └── PROTOTYPE-{slug-3}.md
├── 05-product-strategy/
│   └── strategy.md
├── 06-go-to-market/
│   └── gtm-plan.md
├── aiplc-state.md
└── audit.md
```

## Engagement Paths

Users can follow different paths through the capabilities:

| Path | Capabilities | Deliverable |
|---|---|---|
| Quick Discovery | Envision only | PR/FAQ |
| Structured Opportunity | Envision + Intake | Use Case Repository |
| Investment-Ready Backlog | + Prioritize | Ranked Use Case Backlog |
| Validated Concept | + Prototype | Working Prototype |
| Strategic Foundation | + Product Strategy | Full Strategy |
| Complete Package | All Six | AI SDLC Context Package |

## Workshop Mode (Mob Discovery)

For facilitated group sessions:
- Facilitator runs Quick Desktop, screen-shares
- Core team collectively provides pain points and use cases
- AI synthesizes → group validates
- Prioritization involves group debate over scores
- PROTOTYPE-*.md specs distributed to sub-teams for parallel build
- Sub-teams use Quick, Kiro, or Claude Code — tool of their choice
