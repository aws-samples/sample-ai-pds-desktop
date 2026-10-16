# Changelog

All notable changes to the AI-PDS Desktop Assistants implementation.

## 1.1 — unreleased

### Naming

- Renamed **AI-PLC → AI-PDS** throughout all files (`SKILL.md`, rules, templates, README, state files). The link to the external `sample-ai-plc` repository is unchanged.

### New: Discovery Research (optional first step of Envision)

- Added an optional research step, offered when Envision begins, with three pillars: Market Signals, Competitive Landscape, User Needs.
- New rule file: `rules/discovery/research.md`.
- It is a step of Envision, not a phase: the total stays at 6 phases and the progress indicator stays on Envision. Only Entry Point 1 runs Envision, so Entry Points 2 and 3 are not offered research.
- Outputs (under `01-envision/research/`): `framing.md`, `market-signals.md`, `competitive-landscape.md`, `user-needs.md`, `research-summary.md`.
- Includes an assumption validation table and a human review gate.
- Research findings carry forward as context for the rest of Envision and later phases. Envision pre-populates candidate pain points from them (the user still confirms each one).

### New: QuickSuite Spaces storage option

- Added QuickSuite Space as a storage option (recommended for team collaboration).
- A Space makes artifacts AI-queryable and enables cross-session continuity.
- Guides users through Space creation if they don't have one.

### New: Claude Projects storage option (Claude Desktop)

- Added Claude Project knowledge as a storage option for Claude Desktop.
- Enables cross-conversation artifact persistence and team access.

### New: Hand-off step

- New rule file `rules/discovery/handoff.md`, offered whenever the user stops — at **any** exit point, not only after Go-to-Market. Someone who stops after a prototype spec needs a hand-off more than someone who finished everything, because less of the thinking has been written down.
- Produces the **vision document** → `07-handoff/vision.md` — vision statement, core answers (business problem, customer and pain, success metrics, why now, product boundary), solution direction, constraints, risks, decisions already made, open questions, and a source-artifact index — and bundles it into `07-handoff/handoff-{slug}.zip` straight away, without asking first.
- The zip is flat — `vision.md`, `START-HERE.md`, `strategy.md`, `gtm-plan.md`, `prfaq.md`, and a generated `pain-point-analysis-summary.md` at its root — and `START-HERE.md` carries the unzip steps and a filled-in starter prompt, so whoever receives it can start without the chat transcript. Where the runtime can't create a zip, the same files are written to a folder and the user is told it still needs zipping.
- Guardrails against invention: no estimates, story points, sprint assignments, dates, or stakeholders; no acceptance criteria for behaviour never discussed (those become open questions). Every claim cites its source artifact, and inferences are marked `(assumed)`.
- New `07-handoff/` folder in the output structure. New `docs/aidlc-handoff-guide.md` for delivery teams receiving a hand-off.
- Claude Desktop had no *Discovery Complete* section at all — one was added, with Claude-appropriate distribution guidance.

### New: Progress indicator

- A compact two-line block appended to every response: current phase, brief status, and a bar. There are always **6 phases**; the indicator is a fixed table of phase names and precomputed bars, so nothing has to be calculated.

### New: Full-stack prototype building

- The Prototype build step now offers full-stack alongside the existing HTML-only mode, built by a coding agent (Claude Code or Kiro) from the `PROTOTYPE-*.md` spec.
- On Claude Desktop this is a manual handoff: save the spec, build it in Claude Code or Kiro, then return to the conversation.

### New: Design tool integration (prototype spec generation)

- Spec generation can optionally take existing designs (Figma, Framer, Adobe XD, Sketch, Canva, or images) as context.
- The `PROTOTYPE-*.md` template records the design source and the assets referenced.

### Changed: Phases restructured from 8 to 6

- **Solution Analysis** is no longer a separate phase `1B`. It runs as the closing step of Phase 1 (Envision), keeping its rule file and loading it after `envision.md`.
- **Prototype Spec Generation and Prototype Building** are now one phase with an internal decision gate — generate the spec, then ask whether to build now or hand it off. Stopping after the spec remains a valid exit; Entry Point 3 enters directly at the build step. Both rule files are retained and loaded in sequence.
- Product Strategy is renumbered 6 → **5**, Go-to-Market 7 → **6**. This also fixes a pre-existing off-by-one where Phase 6 wrote to `05-product-strategy/` and Phase 7 wrote to `06-go-to-market/`.
- The session continuity status table collapsed its two prototype rows into one.

### Changed: How many prototype specs get built

- Dropped the hardcoded "top 3". Prioritization Step 5 (renamed from *Select Top 3* to **Select Use Cases to Prototype**) presents the complete ranked list and the user replies with any subset, or "all".
- Asked conversationally rather than as a decision card: a variable-length subset of N items cannot fit the 5-option maximum in the question format guide.
- No default count is pre-selected, so the ranking stays a recommendation and the selection stays the user's.
- Prioritization Step 5 is the only place the count is decided. The Prototype phase generates one spec per selected use case and no longer re-asks.
- Stale "top 3" wording cleaned from `use-case-intake.md`, `prototype-context-generation.md`, the `process-overview.md` capability box, and its output tree.

### Improved: Phase transitions and session continuity

- Mandatory save-on-approval — artifacts are persisted immediately when approved or skipped.
- Pre-transition check ensures all prior artifacts are saved before moving on.
- QuickSuite Space (Quick Desktop) and Claude Project (Claude Desktop) added as continuity layers.
- The state-file template now lists the 6 phases, and session resume reports progress as `phase {n}/6` instead of "X of 6 capabilities complete".

### New: Build script and zip packaging

- Added `scripts/build-skill.sh`, which assembles a self-contained skill per runtime — the runtime's `SKILL.md` plus the shared `rules/` and `templates/` — and zips it: `dist/claude/ai-pds-discovery.zip` and `dist/quick/ai-pds-discovery.zip`. Both Quick Desktop and Claude Desktop import the zip directly.
- Replaces the manual install steps: no more copying `claude-desktop/SKILL.md` over the root `SKILL.md`, or deleting `claude-desktop/` before import. The repo is never modified, so one checkout serves both runtimes.
- Run with no argument for both runtimes, or `claude` / `quick` for one. It prints the staged file count (19 files: 1 `SKILL.md` + 13 rules + 5 templates) so the package can be checked before upload.
- `dist/` added to `.gitignore`.
- The release workflow now runs the same script and publishes `ai-pds-discovery-quick.zip` and `ai-pds-discovery-claude.zip` (previously `ai-pds-quick-desktop.zip` and `ai-pds-claude-desktop.zip`).

### Improved: Documentation

- README install steps rewritten around the build script and release zips.
- Claude Desktop setup rewritten: prerequisites, upload via **Customize → Skills → Add**, verify **19 files**, artifact-storage options (Project, Filesystem MCP, copy-out), troubleshooting table, and update/remove steps.
- `CONTRIBUTING.md` release steps updated for the new packaging.

### Fixed: other

- **Version strings disagreed** — `SKILL.md`, `claude-desktop/SKILL.md` and `README.md` now all read **1.1**. The scoring-framework and spec-template footers deliberately keep v1.0: the frameworks are unchanged, and `Spec version` is a format contract shared with the `sample-ai-plc` repo.
- **Numbering glitch** in the Quick *Discovery Complete* section (an ordered list restarting at 1) and its flattened distribution card.
