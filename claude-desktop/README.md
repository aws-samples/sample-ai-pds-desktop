# AI-PDS — Claude Desktop Setup

This folder contains the **Claude Desktop** specific files for the AI-PDS (AI-Driven Product Discovery & Strategy) skill. The rules and templates are shared with the Quick Desktop version at the root level.

## Install

1. Replace the root-level `SKILL.md` with the one from this folder:
   ```bash
   cp claude-desktop/SKILL.md ./SKILL.md
   ```
2. The `rules/` and `templates/` folders at the root are shared — no changes needed.
3. Load the root folder as a skill in Claude Desktop (or zip the root folder and upload via **Settings → Capabilities/Skills**).
4. Start a chat and say **"Start AI-PLC"**.

Your folder structure should look like:
```
/
├── SKILL.md            ← Claude Desktop version (copied from this folder)
├── rules/              ← shared across all implementations
│   ├── common/
│   └── discovery/
├── templates/          ← shared across all implementations
└── claude-desktop/
    ├── SKILL.md        ← source file (keep for reference)
    └── README.md       ← this file
```

## What differs from the Quick Desktop version

The workflow, phases, questions, scoring frameworks, and artifact formats are **identical**. Only the runtime affordances differ:

| Area | Quick Desktop | Claude Desktop |
|---|---|---|
| Skill format | `SKILL.md` (no frontmatter needed) | `SKILL.md` **with YAML frontmatter** (`name`, `description`) |
| Choice UI | Decision cards | Numbered text lists |
| Storage | OneDrive / workspace connectors | Local filesystem (Write tool / Filesystem MCP) |
| Connected context | KG + Slack + email built in | MCP servers if configured, else manual paste |
| Visualizations | Highcharts + Excel | HTML/React Artifact; CSV instead of Excel |
| Prototype build | Inline HTML | Artifacts panel (HTML/React); full app → hand to Claude Code/Kiro |
| Cross-session memory | Quick agent memory | `aiplc-state.md` only |

## Optional MCP servers for parity

Filesystem, Slack, Google Drive/Gmail, and Fetch/web-search MCP servers restore the connected-context and collaboration features where available.
