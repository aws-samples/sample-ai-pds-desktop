# Hand-off — Packaging Reviewed Artifacts for the Delivery Team

## Purpose
Bundle the artifacts the user has already reviewed and approved into one zip a delivery team can pick up. The user chooses what goes in. Nothing new is written: every file in the package is one the user saw and approved during discovery.

> **Progress indicator:** every reply you send during this step ends with the two-line indicator defined in `SKILL.md`. It never lapses mid-step.

## Entry Conditions

Run this step whenever the user stops — at ANY exit point, not only after Go-to-Market.

Trigger it when:
- The user chooses "Stop here (I have what I need)" at any phase transition
- Go-to-Market completes
- The user asks how to give this to their team

This is not a numbered phase and does not appear in the progress indicator count. It is the closing step of whatever phase the user stopped in — leave the indicator on that phase's number.

## Exit Artifact

- `07-handoff/handoff-{project-slug}.zip` — the files the user selected, unchanged, all at the root of the archive

`{project-slug}` is the customer/project name in lowercase with hyphens and no special characters (e.g. "Acme Claims Portal" → `acme-claims-portal`).

---

## Ground Rules

1. **Never generate files for the package.** No summaries, vision documents, READMEs, or instructions. Only copies of existing artifacts go in.
2. **Copy files unchanged.** Never edit, merge, or re-summarise an artifact on its way into the zip.
3. **Never include session files.** `aiplc-state.md` and `audit.md` are never listed and never packaged.
4. **The user decides.** Suggest a default, but package exactly what the user selects.

---

## Step 1: Confirm the Project Name

If the session has no customer/project name yet, ask for one (conversational, one question) — it names the zip. Do not invent one.

---

## Step 2: List the Artifacts

Scan the chosen storage location and list every file saved under `01-envision/` through `06-go-to-market/`, numbered, grouped by phase folder. List only files that actually exist. Mark the suggested default with ✅:

- `01-envision/prfaq.md`
- every `04-prototypes/PROTOTYPE-*.md`
- `05-product-strategy/strategy.md`
- `06-go-to-market/gtm-plan.md`

Everything else (pain points, research, use cases, scoring, ranking, prototype HTML) is listed unmarked.

```
Here's everything we've produced. ✅ marks my suggestion for the hand-off package:

**01-envision**
1. ✅ prfaq.md
2. pain-points.md
3. research/research-summary.md

**04-prototypes**
4. ✅ PROTOTYPE-{slug}.md
5. {slug}/prototype.html

**05-product-strategy**
6. ✅ strategy.md

Reply **ok** for the suggested files, list the numbers you want (e.g. "1, 4, 6"), or say **all**.
```

---

## Step 3: Build the Zip

Put the selected files into `07-handoff/handoff-{project-slug}.zip`:

1. **Flat.** Every file sits at the root of the archive — no folders.
2. **Resolve name clashes.** Prototype HTML files are all named `prototype.html`; rename each to `prototype-{slug}.html` in the zip. If any other selected files share a name, prefix each with its parent folder name (`{folder}-{file}`). The content is never changed — only the file name inside the zip.
3. **Real files only.** No symlinks, no dotfiles.

If this runtime cannot create zip files, or cannot write to the chosen storage, copy the same files, flat, into `07-handoff/handoff-{project-slug}/` instead and tell the user plainly that it still needs zipping or copying. Never say a zip was created unless it was.

---

## Step 4: Save and Distribute

1. Save the zip to `07-handoff/` in the chosen storage location
2. Update `aiplc-state.md`
3. Log in `audit.md` — including the exact list of files packaged
4. Tell the user where the zip is and list its contents
5. Offer distribution using the options in the "Discovery Complete" section of `SKILL.md`

---

## Workshop Mode Notes

- If sub-teams built different prototypes, produce one hand-off per team: `handoff-{project-slug}-{team-or-use-case-slug}.zip`
- Confirm who receives each package before the session ends, while the room is still full
