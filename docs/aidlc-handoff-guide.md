# Starting From an AI-PDS Hand-off

This guide is for **delivery teams** — engineers and product teams who receive discovery work from a product lead who ran AI-PDS. It explains what the hand-off package contains and how to start building from it.

If you ran AI-PDS yourself, the same steps apply: AI-PDS builds the package when you stop, then follow this guide.

---

## At a glance

```text
unzip handoff-{slug}.zip -d <your-project>
Read ./vision.md and build what it describes. Use ./strategy.md, ./gtm-plan.md, ./prfaq.md, and ./pain-point-analysis-summary.md as supporting context.
```

The exact starter prompt for your package is in `START-HERE.md`.

---

## What you receive

AI-PDS produces one zip, `handoff-{slug}.zip`, with every file at the root of the archive — no folders — so it unzips straight into the root of your project:

```text
handoff-{slug}.zip
├── vision.md                        ← the primary input, read first
├── START-HERE.md                    ← these steps and the starter prompt, filled in for this package
├── strategy.md                      ← product strategy questions & answers
├── gtm-plan.md                      ← go-to-market questions & answers
├── prfaq.md                         ← PR/FAQ questions & answers
└── pain-point-analysis-summary.md   ← summarised pain-point analysis from discovery
```

`strategy.md`, `gtm-plan.md`, and `prfaq.md` are the product lead's approved documents, unchanged. They only appear if those phases ran — AI-PDS lets the product lead stop at any phase, so a package from an early exit may contain fewer files. `pain-point-analysis-summary.md` is generated from the confirmed pain points and any research evidence.

The other discovery artifacts — research, use cases, ranking, prototype spec, decision log — are not in the package. `vision.md` summarises what you need from each and cites it by name.

### `vision.md`

| Section | What it gives you |
|---------|-------------------|
| Vision Statement | Who this is for, what changes for them, why now |
| **Core Answers** | Business Problem, Customer and Their Pain, Success Metrics, Trigger — Why Now, Product Boundary |
| Solution Direction | What to build, and the Agentic vs. Application classification |
| Constraints and Assumptions | Technical, organisational, regulatory — inferred items marked `(assumed)` |
| Risks | From the strategy risk assessment, with mitigations |
| Decisions Already Made | Settled choices, so they are confirmed rather than re-opened |
| Open Questions | What discovery did not settle |
| Source Artifacts | Index of every file discovery produced |

What the vision deliberately does **not** contain: estimates, story points, sprint assignments, dates, architecture, frameworks, or schemas. Those are the delivery team's decisions.

---

## How to start

### 1. Unzip into the project root

```bash
cd <your-project>
unzip /path/to/handoff-{slug}.zip
```

Copy real files into the project root; don't symlink them in.

**Received a folder instead of a zip?** Some desktop assistants can't create zip files, in which case AI-PDS writes the same files into a folder, `handoff-{slug}/`. Copy its contents into the project root the same way.

### 2. Give your coding agent the starter prompt

Copy the prompt from `START-HERE.md`. It names `vision.md` first, then only the supporting files actually in your package.

### 3. Work through the open questions

- **Core Answers** — what discovery settled. Confirm, correct, or extend each answer with the product lead.
- **Decisions Already Made** — when alternatives come up that discovery already rejected (other use cases, Agentic vs. Application), point to this section rather than re-debating.
- **Open Questions** — resolve these before or during delivery. An empty Open Questions section on a real project is a warning sign; ask the product lead what was left unsaid.

---

## Good to know

- **Every claim cites its source.** If something in `vision.md` looks wrong, the cited file name tells the product lead where it came from.
- **`(assumed)` marks inference.** Anything labelled `(assumed)` is AI-PDS's inference, not something the product lead stated — verify it first.
- **`START-HERE.md` is for people.** It isn't part of the starter prompt; keep or delete it after you start.

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| Your agent can't find a file | File isn't in the project root, or is a symlink | Copy the real file into the project root and use its `./` path |
| Your agent ignores the supporting files | They weren't named in the prompt, or were unzipped elsewhere | Use the full starter prompt from `START-HERE.md` and check every file is in the project root |
| A file listed above is missing | That phase didn't run | Check the vision's Source Artifacts section — skipped phases are marked `Not covered` |

---

## Asking for a hand-off

If your product lead hasn't produced one yet: ask them to finish (or stop) their AI-PDS session. AI-PDS builds the hand-off at every exit point, so it works even if they stopped after the prototype spec. See the main [README](../README.md) for how they install and run AI-PDS.
