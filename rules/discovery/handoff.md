# Hand-off — Turning Discovery Into Something a Team Can Build

## Purpose
Convert the discovery artifacts into a package an engineering team can actually start from. Discovery produces understanding; this step produces the thing someone picks up on Monday morning.

> **Progress indicator:** every reply you send during this phase ends with the two-line indicator defined in `SKILL.md` — including each question in a run of questions, and short acknowledgements. It never lapses mid-phase.

## Entry Conditions

Run this step whenever the user stops — at ANY exit point, not only after Go-to-Market. Someone who stopped after approving a prototype spec needs a hand-off just as much as someone who completed the full workflow; they need it more, in fact, because less of the thinking has been written down.

Trigger it when:
- The user chooses "Stop here (I have what I need)" at any phase transition
- Go-to-Market completes
- The user asks how to give this to their team

This is not a numbered phase and does not appear in the progress indicator count. It is the closing step of whatever phase the user stopped in — leave the indicator on that phase's number.

## Exit Artifacts

- `07-handoff/vision.md` — vision document
- `07-handoff/pain-point-analysis-summary.md` — summarised pain-point analysis from discovery
- `07-handoff/handoff-{slug}.zip` — `vision.md`, `START-HERE.md`, `strategy.md`, `gtm-plan.md`, `prfaq.md`, and `pain-point-analysis-summary.md`, laid out to unzip into the delivery team's project

---

## Step 1: Produce the Hand-off

Go straight to writing `vision.md` and building the zip — no questions first. Open with a short summary of what exists, so the user sees what the package is built from:

```
Here's what we've produced: {list the artifacts actually created, by folder}

Packaging it for your delivery team now.
```

---

## Ground rules

1. **Trace everything to something the user said.** Every claim, metric, and criterion should come from an artifact produced earlier. Cite the source file inline, e.g. `(01-envision/prfaq.md)`.
2. **Do NOT invent what was never discussed.** No made-up acceptance criteria, no estimates, no story points, no sprint assignments, no team names, no dates. Estimation is the delivering team's job and they have context you do not.
3. **Make the gaps visible.** Anything a team will need that discovery did not settle goes in an explicit **Open Questions** section. A hand-off that hides its gaps wastes a sprint discovering them.
4. **Mark assumptions.** If a field is your inference rather than the user's statement, label it `(assumed)` — same convention as the pain point table in Envision.
5. **Self-contained.** Assume the reader was not in the room and will not read the other files first.

---

## The Vision Document

Produces `07-handoff/vision.md`, the primary document the delivery team reads first. It must stand on its own: the strategy and GTM plan travel with it as supporting context, and every other artifact is summarised inside it. Keep it concise by summarising the discovery artifacts rather than copying them in.

### Write the document

Structure — the headings under "Core Answers" give each question a delivery team asks first an obvious, quotable answer:

```markdown
# Vision — {Product / Initiative Name}

## Vision Statement
{One paragraph: who this is for, what changes in their world, why now.}
Source: 05-product-strategy/strategy.md

## Core Answers

### Business Problem
{The validated pain points, with severity and frequency as the user stated them.}
Source: 01-envision/pain-points.md
{If Discovery Research ran, include the evidence that confirmed or challenged each assumption.}
Source: 01-envision/research/research-summary.md

### Customer and Their Pain
{Persona, segment, trigger events, disqualifiers — and the pain in the customer's words.}
Source: 05-product-strategy/strategy.md, 06-go-to-market/gtm-plan.md, 01-envision/prfaq.md

### Success Metrics
{The KPIs and North Star metric, with targets where the user gave them.}
Source: 05-product-strategy/strategy.md

### Trigger — Why Now
{What prompted the initiative: market pressure, customer demand, regulation, opportunity. Cite the research or PR/FAQ evidence.}
Source: 01-envision/research/research-summary.md, 01-envision/prfaq.md

### Product Boundary
**In scope for the first increment:** {from the prototype spec's Must Have}
**Explicitly out of scope:** {from the spec's Out of Scope}
Source: 04-prototypes/PROTOTYPE-{slug}.md

## Solution Direction
{What we intend to build, and the Agentic vs. Application classification with reasoning.}
Source: 02-use-case-intake/use-cases.md, 03-prioritization/ranking.md

## Constraints and Assumptions
{Technical, organisational, regulatory. Mark inferred items (assumed).}

## Risks
{From the strategy risk assessment, with the mitigations discussed.}
Source: 05-product-strategy/strategy.md

## Decisions Already Made
{Settled choices and why — use cases selected and rejected, Agentic vs. Application, scoring trade-offs — so the delivery team confirms them rather than re-opening them.}
Source: audit.md

## Open Questions
{Everything the team must resolve before or during delivery, including any Core Answer that discovery did not settle.}

## Source Artifacts
{Index of every AI-PDS file produced, with a one-line description of each. Mark `strategy.md`, `gtm-plan.md`, `prfaq.md`, and `pain-point-analysis-summary.md` as included in the hand-off zip; every other file stays in AI-PDS storage, and `vision.md` carries what the team needs from it.}
```

If a section has no source because that phase was skipped, say so explicitly — `Not covered: the workflow stopped after Prototype` — rather than filling it in from inference.

### Build the hand-off package

As soon as `vision.md` is written, write `07-handoff/pain-point-analysis-summary.md` (see below), then bundle both with the product strategy, go-to-market plan, and PR/FAQ into one zip. Every file sits at the root of the archive — no folders — so unzipping in the root of the team's project puts them all next to each other:

```
07-handoff/handoff-{slug}.zip
├── vision.md                        ← primary input, read first
├── START-HERE.md                    ← delivery instructions and starter prompt, for people
├── strategy.md                      ← 05-product-strategy/ — product strategy questions & answers
├── gtm-plan.md                      ← 06-go-to-market/ — go-to-market questions & answers
├── prfaq.md                         ← 01-envision/ — PR/FAQ questions & answers
└── pain-point-analysis-summary.md   ← 07-handoff/ — summarised pain-point analysis from discovery
```

Rules:

1. **Everything at the root of the zip.** No subfolders.
2. **Only these six files.** `strategy.md`, `gtm-plan.md`, and `prfaq.md` are copied as the user approved them — never re-extracted, merged, or summarised. Leave any of them out if its phase did not run. No other AI-PDS artifact goes in the package: `vision.md` already summarises and cites the research, use cases, ranking, prototype spec, and decisions. In particular, never include `aipds-state.md` — AI-PDS session state, not product knowledge.
3. **Real files only.** Copy the files themselves — no symlinks, no dotfiles.

If this runtime cannot create zip files, or cannot write to the chosen storage, write the same files, flat, into `07-handoff/handoff-{slug}/` instead and tell the user plainly that it still needs zipping or copying. Never say a zip was created unless it was.

### Pain-point analysis summary

Write `07-handoff/pain-point-analysis-summary.md` from `01-envision/pain-points.md`, plus `01-envision/research/` evidence if Discovery Research ran. It summarises — it does not add new pain points or re-score existing ones:

```markdown
# Pain-Point Analysis Summary — {Product / Initiative Name}

## Overview
{Two or three sentences: how many pain points were confirmed, who feels them, and the pattern across them.}

## Pain Points
| Pain point | Who feels it | Severity | Frequency | Today's workaround |
|------------|--------------|----------|-----------|--------------------|
| {title} | {as the user stated} | {as stated} | {as stated} | {as stated} |

## Evidence
{For each pain point, the research finding that confirmed or challenged it. If Discovery Research did not run: `Not covered: Discovery Research was skipped`.}

## Pain Points Addressed by This Solution
{Which pain points the selected use case targets, and which are left for later.}
```

Carry over `(assumed)` markers from `pain-points.md` unchanged. Source: 01-envision/pain-points.md, 01-envision/research/research-summary.md

### Delivery instructions

Write the delivery instructions as `START-HERE.md` at the root of the zip, with the starter prompt filled in, so the package explains itself to anyone who receives it. Also show the same text in chat when presenting the package, and include it in the distribution message.

The starter prompt names `vision.md` first and then the supporting files — only those actually in the package, never `START-HERE.md` itself.

`START-HERE.md`:

```markdown
# Start from this hand-off — {Product / Initiative Name}

Produced by AI-PDS discovery. `vision.md` is the input; the other files are
the discovery documents it cites.

**Package contents:**
- `vision.md` — the vision, read first
{- `strategy.md` — product strategy questions & answers}
{- `gtm-plan.md` — go-to-market questions & answers}
{- `prfaq.md` — PR/FAQ questions & answers}
- `pain-point-analysis-summary.md` — summarised pain-point analysis from discovery

## Steps

1. **Unzip in the root of your project.** Every file lands directly in the
   project root. Copy real files, not symlinks.
2. **Give your coding agent this prompt:**

       Read ./vision.md and build what it describes. Use ./strategy.md,
       ./gtm-plan.md, ./prfaq.md, and ./pain-point-analysis-summary.md as
       supporting context.

   {Name only the files in this package.}

3. **Work through the open questions.** The "Core Answers" section settles
   what discovery covered; the "Open Questions" section lists what is still
   unresolved.

This file is for people — it is not part of the prompt and can be kept or
deleted after you start.
```

---

## Step 2: Save and Distribute

1. Save `vision.md`, `pain-point-analysis-summary.md`, and the zip to `07-handoff/` in the chosen storage location
2. Update `aipds-state.md`
3. Log in `audit.md`
4. Present the zip with the delivery instructions from "Delivery instructions". The user can ask for changes to `vision.md`; if they do, rebuild the zip
5. Offer distribution using the options in the "Discovery Complete" section of `SKILL.md`

---

## Validation Criteria

These are depth checks, not a checklist to clear.

A good hand-off:
- ✅ Reads correctly to someone who was not in the discovery sessions
- ✅ Every claim traces to a named source artifact
- ✅ Open questions are stated rather than papered over — an empty Open Questions section on a real project is a warning sign, not a success
- ✅ Non-goals and out-of-scope items are explicit
- ✅ Contains no invented estimates, dates, criteria, or stakeholders
- ✅ Assumptions are marked `(assumed)` and distinguishable from what the user stated
- ✅ Names what was NOT covered, if the user exited the workflow early
- ✅ Every Core Answers section has an answer or an explicit open question
- ✅ The zip holds only `vision.md`, a filled-in `START-HERE.md`, `pain-point-analysis-summary.md`, and `strategy.md`, `gtm-plan.md`, `prfaq.md` (those that exist), all at its root with no folders, and the starter prompt names exactly those files

---

## Workshop Mode Notes

In workshop mode:
- Generate the hand-off live so the group can correct scope in the room — cheaper than correcting it in a sprint review
- The Decisions Already Made section matters most here: workshops surface disagreements, and the team inherits them unless they are written down
- If sub-teams built different prototypes, produce one hand-off per prototype and say which team owns which
- Confirm who receives the package before the session ends, while the room is still full
