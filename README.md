# AI-Driven Product Discovery and Strategy (AI-PDS)

AI-PDS is a capabilities-first framework that helps non-technical business leaders — PMs, VPs of Product, CTOs exploring adjacencies — discover, prioritize, and prototype AI use cases before committing engineering resources.

AI orchestrates every phase from customer discovery to market launch. Humans retain decision authority at each gate, ensuring alignment with business goals.

This repo provides the **Desktop Assistants** implementation. For Agentic IDE implementations, see [aws-samples/sample-ai-plc](https://github.com/aws-samples/sample-ai-plc).

## What This Skill Does

Guides Product Managers and business leaders through the AI-PLC Discovery workflow:

| Capability | What happens | You get |
|---|---|---|
| Envision | Optional discovery research (market signals, competitive landscape, user needs), then pain point analysis + PR/FAQ (Working Backwards), then solution analysis — single vs. multiple solution paths | PR/FAQ document + solution direction (+ research summary) |
| Use Case Intake | Document & categorize N use cases | Use Case Repository |
| Prioritize | Dual scoring (Agentic vs Application) | Ranked Backlog |
| Prototype | Generate specs + optional HTML prototype | PROTOTYPE-*.md files |
| Product Strategy | Positioning, business model, KPIs | Strategy Document |
| Go-to-Market | Segmentation, sales motions, launch | GTM Plan |

**Six phases.** Two phases bundle several steps: Envision opens with optional Discovery Research, then covers the PR/FAQ and the solution analysis that branches the workflow, and Prototype covers spec generation and the build with a decision gate between them — stopping after the spec is a valid exit.

**Three entry points:** Start from pain points, use cases, or existing prototype specs.  
**Every stage is an exit point:** Stop whenever you have what you need.  
**Hand-off at any exit:** Whenever you stop, AI-PLC turns what you have into a `vision.md` and packages it with the strategy, GTM plan, PR/FAQ, and a pain-point analysis summary as a zip ready to unzip into the delivery team's project. Delivery teams receiving a hand-off: see [`docs/aidlc-handoff-guide.md`](docs/aidlc-handoff-guide.md).

---

## Supported Implementations

This repo currently supports:

| Implementation | Setup |
|---|---|
| **Amazon Quick Desktop** | Default. See instructions below |
| **Claude Desktop** | `./scripts/build-skill.sh claude`, then upload the zip. See [`claude-desktop/README.md`](claude-desktop/README.md). |

More desktop assistants coming soon — stay tuned.

---

## Get Started with Quick Desktop

**Fastest:** download `ai-pds-quick-desktop.zip` from the [latest release](https://github.com/aws-samples/sample-ai-pds-desktop/releases/latest) and skip to step 3 — import that zip in step 6.

**From source:**

1. Clone this repo:
   ```bash
   git clone https://github.com/aws-samples/sample-ai-pds-desktop.git
   cd sample-ai-pds-desktop
   ```
2. Build the skill — this assembles `dist/quick/ai-plc-discovery/` with only the files the skill needs, and zips it to `dist/quick/ai-pds-quick-desktop.zip`:
   ```bash
   ./scripts/build-skill.sh quick
   ```
3. Open **Agents & skills** from the left sidebar
4. Click the **Skills** tab
5. Click **+ Create** and import the zip
6. Select `dist/quick/ai-pds-quick-desktop.zip`
7. In any conversation, say: **"Start AI-PLC"**
8. Follow the guided workflow

Each runtime is staged into its own folder (`dist/quick/`, `dist/claude/`), so building one never overwrites the other and neither ever contains the `claude-desktop/` folder. Run the script with no argument to build both at once:

```bash
./scripts/build-skill.sh
```

The build script never modifies the repo, so the same checkout serves both implementations — no need to delete or overwrite anything. Re-run it after a `git pull` and re-import to update.

For Claude Desktop setup, see [`claude-desktop/README.md`](claude-desktop/README.md).

---

## File Structure

```
sample-ai-pds-desktop/
├── SKILL.md                              ← Quick Desktop orchestrator (main entry point)
├── README.md                             ← This file
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── LICENSE
├── docs/
│   └── aidlc-handoff-guide.md            ← For delivery teams: starting from an AI-PLC hand-off
├── claude-desktop/
│   ├── SKILL.md                          ← Claude Desktop orchestrator (with YAML frontmatter)
│   └── README.md                         ← Claude Desktop setup guide
├── scripts/
│   └── build-skill.sh                    ← Assembles dist/<runtime>/ai-plc-discovery/
├── rules/
│   ├── common/
│   │   ├── process-overview.md           ← Capability model & principles
│   │   ├── session-continuity.md         ← State management & resumption
│   │   └── question-format-guide.md      ← Decision card formatting rules
│   └── discovery/
│       ├── research.md                   ← Optional research step, run from Envision
│       ├── envision.md                   ← Pain points + PR/FAQ
│       ├── solution-analysis.md          ← Single vs. multiple solutions
│       ├── use-case-intake.md            ← Structured use case documentation
│       ├── use-case-prioritization.md    ← Dual scoring frameworks
│       ├── prototype-context-generation.md ← Spec file generation
│       ├── prototype-building.md         ← HTML prototype creation
│       ├── product-strategy.md           ← Strategy development
│       ├── go-to-market.md              ← GTM planning
│       └── handoff.md                    ← Hand-off: vision.md + zip
└── templates/
    ├── prfaq-template.md                ← Working Backwards PR/FAQ
    ├── use-case-card.md                 ← Use case documentation format
    ├── scoring-agentic.md              ← Agentic scoring framework
    ├── scoring-application.md           ← Application scoring framework
    └── prototype-spec-template.md       ← PROTOTYPE-*.md template
```

---

## Cross-Platform Compatibility

The PROTOTYPE-*.md files generated by this skill use the same format as the Kiro and Claude Code implementations. A spec generated in Quick Desktop can be handed off to:
- **Kiro** (for full IDE-based prototype builds)
- **Claude Code** (for terminal-based prototype builds)
- **Use in Desktop tools like Quick Desktop workflow as is for prototype creation**

And vice versa — PROTOTYPE-*.md files from Kiro/Claude Code can be used in Quick Desktop (Entry Point 3).

---

## Workshop Mode (Mob Discovery)

For facilitated workshops:
1. Facilitator runs Quick Desktop and screen-shares
2. Core team contributes verbally → facilitator types
3. AI synthesizes and prioritizes → group validates
4. PROTOTYPE-*.md specs distributed to sub-teams via Slack/OneDrive
5. Sub-teams build in parallel (Quick, Kiro, or Claude Code)

---

## Source

- Agentic IDE implementation: [aws-samples/sample-ai-plc](https://github.com/aws-samples/sample-ai-plc)
- Related Blog: [Henry Schein One goes AI-native with AI-PDS](https://aws.amazon.com/blogs/industries/henry-schein-one-goes-ai-native-with-ai-product-discovery-and-strategy/)


## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

*Version 1.1 | 2026-09-11*
