# AI-Driven Product Discovery and Strategy ( AI-PDS) 
## AI-driven product life cycle (AIPLC )implementation in AI Desktop Assistants ## 

AI-PDS (AI-Driven Product Discovery and Strategy) is a capabilities-first framework that helps non-technical business leaders — PMs, VPs of Product, CTOs exploring adjacencies — discover, prioritize, and prototype AI use cases before committing engineering resources. Multiple implemenations of the AI-PDS exists for AI driven Product Life Cycle e.g. Agentic IDE, Amazon Quick, Quick Desktop etc,along with prototype creation. 

AI Product Discovery and Strategy (AI-PDS) is a structured approach where AI orchestrates every phase from customer discovery to market launch.

Humans retain decision authority at each gate, ensuring alignment with business goals.

This repo provides the Desktop Assistants implementation. For Agentic IDEs implementations please refer to 
AI-PDS - Agentic IDE implementations of AI-PLC [aws-samples/sample-ai-plc](https://github.com/aws-samples/sample-ai-plc)

<img width="663" height="356" alt="image" src="https://github.com/user-attachments/assets/41d921db-1239-4450-a508-8260d9fefea4" />

## What This Skill Does

Guides Product Managers and business leaders through the AI-PLC Discovery workflow:

| Capability | What happens | You get |
|---|---|---|
| Envision | Pain point analysis + PR/FAQ (Working Backwards) | PR/FAQ document |
| Use Case Intake | Document & categorize N use cases | Use Case Repository |
| Prioritize | Dual scoring (Agentic vs Application) | Ranked Backlog |
| Prototype | Generate specs + optional HTML prototype | PROTOTYPE-*.md files |
| Product Strategy | Positioning, business model, KPIs | Strategy Document |
| Go-to-Market | Segmentation, sales motions, launch | GTM Plan |

**Three entry points:** Start from pain points, use cases, or existing prototype specs.  
**Every stage is an exit point:** Stop whenever you have what you need.

---

## Supported Implementations

This repo currently supports:

| Implementation | Setup |
|---|---|
| **Amazon Quick Desktop** | Default. See instructions below |
| **Claude Desktop** | See [`claude-desktop/README.md`](claude-desktop/README.md) for setup instructions. |

More desktop assistants coming soon — stay tuned.

---

## Install

The fastest way to install is from a pre-built package on the
[**Releases**](https://github.com/aws-samples/sample-ai-pds-desktop/releases/latest)
page. Each release ships two ready-to-import zips — no cloning or file editing needed:

| Package | For |
|---|---|
| `ai-pds-quick-desktop.zip` | Amazon Quick Desktop |
| `ai-pds-claude-desktop.zip` | Claude Desktop |

### Quick Desktop (from zip)

1. Download `ai-pds-quick-desktop.zip` from the [Releases](https://github.com/aws-samples/sample-ai-pds-desktop/releases/latest) page and unzip it
2. Open **Agents & skills** from the left sidebar → **Skills** tab
3. Click **+ Create** → **Import from file**
4. Select the unzipped folder
5. In any conversation, say **"Start AI-PLC"** and follow the guided workflow

### Claude Desktop (from zip)

1. Download `ai-pds-claude-desktop.zip` from the [Releases](https://github.com/aws-samples/sample-ai-pds-desktop/releases/latest) page and unzip it
2. Load the unzipped folder as a skill via **Settings → Capabilities/Skills** (or zip and upload it, per your Claude Desktop version)
3. Start a chat and say **"Start AI-PLC"**

See [`claude-desktop/README.md`](claude-desktop/README.md) for MCP-server options and details on how the Claude Desktop version differs.

### Install from source (manual)

Prefer to work from a clone? You can still install directly from the repo:

- **Quick Desktop:** clone the repo, delete the `claude-desktop/` folder, then import the folder as in the steps above.
- **Claude Desktop:** clone the repo, copy `claude-desktop/SKILL.md` over the root `SKILL.md`, then load the root folder. See [`claude-desktop/README.md`](claude-desktop/README.md).

---

## File Structure

```
ai-plc-skill/
├── SKILL.md                              ← Orchestrator (main entry point)
├── README.md                             ← This file
├── rules/
│   ├── common/
│   │   ├── process-overview.md           ← Capability model & principles
│   │   ├── session-continuity.md         ← State management & resumption
│   │   └── question-format-guide.md      ← Decision card formatting rules
│   └── discovery/
│       ├── envision.md                   ← Pain points + PR/FAQ
│       ├── solution-analysis.md          ← Single vs. multiple solutions
│       ├── use-case-intake.md            ← Structured use case documentation
│       ├── use-case-prioritization.md    ← Dual scoring frameworks
│       ├── prototype-context-generation.md ← Spec file generation
│       ├── prototype-building.md         ← HTML prototype creation
│       ├── product-strategy.md           ← Strategy development
│       └── go-to-market.md              ← GTM planning
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

- Framework: AI-PDS (AI Product Discovery & Strategy)
-  AI-PDS - Agentic IDE implementations of AI-PLC
   [aws-samples/sample-ai-plc](https://github.com/aws-samples/sample-ai-plc)
- Related Blog: [Henry Schein One goes AI-native with AI-PDS](https://aws.amazon.com/blogs/industries/henry-schein-one-goes-ai-native-with-ai-product-discovery-and-strategy/)


## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

*Version 1.0 | 2026-07-21*
