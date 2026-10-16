# AI-PDS — Claude Desktop Setup

This folder contains the **Claude Desktop** specific `SKILL.md` for AI-PDS (AI-Driven Product Discovery & Strategy). The `rules/` and `templates/` folders at the repo root are shared with the Quick Desktop version — this folder holds only what differs.

## Prerequisites

| Requirement | Why |
|---|---|
| Claude Desktop with **Skills** available on your plan | Skills are the mechanism that loads AI-PDS. If you don't see **Customize → Skills**, your plan or app version doesn't have it yet. |
| Latest Claude Desktop release | Skills support is recent; update before troubleshooting anything else. |
| `zip` and `bash` on your machine | Used by the build script below. Both ship with macOS and Linux; on Windows use WSL or Git Bash. |
| A **Project** to run the workshop in (recommended) | Gives every phase's artifact somewhere to persist across chats. See [Artifact storage](#artifact-storage). |

## Install

**Fastest:** download `ai-pds-claude-desktop.zip` from the [latest release](https://github.com/aws-samples/sample-ai-pds-desktop/releases/latest) and upload it as-is in step 2 — no build needed.

**1. Build the skill folder.** From the repo root:

```bash
./scripts/build-skill.sh claude
```

This assembles `dist/claude/ai-pds/` (the Claude `SKILL.md` plus the shared `rules/` and `templates/`) and zips it to `dist/claude/ai-pds-claude-desktop.zip`. Nothing in the repo is modified, and the Quick Desktop build lives separately under `dist/quick/`, so one checkout serves both without either clobbering the other. Omit the `claude` argument to build both runtimes at once.

**2. Upload it.** In Claude Desktop: **Customize → Skills → Add**, then select `dist/claude/ai-pds-claude-desktop.zip`.

**3. Verify it loaded.** Reopen **Customize → Skills** and confirm `ai-pds` is listed and enabled, with **19 files** (1 `SKILL.md` + 13 rules + 5 templates). Do this *before* a live workshop — a skill that silently failed to load looks exactly like a skill that loaded until you try to use it, and a short file count means the shared `rules/` or `templates/` didn't make it into the zip.

**4. Start a chat** and say **"Start AI-PDS"**. Claude should reply with the AI-PDS welcome message and an entry-point choice (pain points / use cases / existing prototype specs). If it answers as generic Claude instead, see [Troubleshooting](#troubleshooting).

### What gets uploaded

```
ai-pds/
├── SKILL.md            ← Claude Desktop version (from claude-desktop/SKILL.md)
├── rules/              ← copied from the repo root
│   ├── common/
│   └── discovery/
└── templates/          ← copied from the repo root
```

The zip contains a single top-level `ai-pds/` folder with `SKILL.md` at its root. `SKILL.md` references `rules/` and `templates/` by relative path, which is why the build script exists rather than a bare `cp` — uploading `SKILL.md` on its own will load the skill but break it at the first phase transition.

## Artifact storage

AI-PDS produces an artifact at the end of every phase (`01-envision/prfaq.md`, `02-use-case-intake/use-cases.md`, and so on). Pick one of these:

- **Run the workshop in a Project (recommended).** Claude Desktop can create each artifact file and add it to the project, so the deliverables accumulate in one place and stay available across every chat in that project — no local folder access or MCP setup required. This also gives `aipds-state.md` somewhere to live for cross-session resumption.
- **Filesystem MCP server.** Use this when you want the artifacts written to a local folder on disk — for committing specs to git, or handing `PROTOTYPE-*.md` files to Kiro or Claude Code for a full build. See the [Filesystem MCP server docs](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem).
- **Plain chat, neither of the above.** Claude renders each artifact in the chat or the Artifacts panel and you copy it out before the conversation scrolls away. The full workflow still runs; persistence is manual and per-conversation.

Slack, Google Drive/Gmail, and Fetch/web-search MCP servers are optional and restore the connected-context and collaboration features described in the comparison table below.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| "Start AI-PDS" gets a generic reply | Skill not loaded or not enabled | Check **Customize → Skills** for `ai-pds`; re-upload if absent |
| Skill loads, then fails partway through a phase | `rules/` or `templates/` missing from the zip | Rebuild with `./scripts/build-skill.sh claude` — don't zip `SKILL.md` alone |
| Upload rejected or skill won't appear | Invalid YAML frontmatter in `SKILL.md` | The first lines must be `---`, `name: ai-pds`, `description: …`, `---` |
| Fewer than 19 files listed after upload | Partial or stale zip | Rebuild from scratch: `rm -rf dist && ./scripts/build-skill.sh claude` |
| Artifacts appear in chat but don't persist anywhere | Running outside a Project with no Filesystem MCP | See [Artifact storage](#artifact-storage) |
| Skill behaves like an older version | Stale upload | Remove the old skill, rebuild, re-upload (see below) |

## Update or remove

To pick up repo changes:

```bash
git pull
./scripts/build-skill.sh claude
```

Then in **Customize → Skills**, remove the existing `ai-pds` and upload the new zip. Uploading without removing the old one first can leave two copies competing for the same trigger phrases.

To uninstall, delete `ai-pds` from **Customize → Skills**. Nothing is left behind outside the app.

## What differs from the Quick Desktop version

The workflow, phases, questions, scoring frameworks, and artifact formats are **identical**. Only the runtime affordances differ:

| Area | Quick Desktop | Claude Desktop |
|---|---|---|
| Skill format | `SKILL.md` (no frontmatter needed) | `SKILL.md` **with YAML frontmatter** (`name`, `description`) |
| Choice UI | Decision cards | Numbered text lists |
| Storage | OneDrive / workspace connectors | Project files, Filesystem MCP, or manual copy-out |
| Connected context | KG + Slack + email built in | MCP servers if configured, else manual paste |
| Visualizations | Highcharts + Excel | HTML/React Artifact; CSV instead of Excel |
| Prototype build | Inline HTML | Artifacts panel (HTML/React); full app → hand to Claude Code/Kiro |
| Cross-session memory | Quick agent memory | `aipds-state.md` in the Project or a local folder |
