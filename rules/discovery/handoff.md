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

Scan the chosen storage location and list every file saved under `01-envision/` through `06-go-to-market/`, as a single markdown table with one row per file, in phase-folder order. List only files that actually exist. Number the rows 1, 2, 3 … across the whole table — never restart per folder. Mark the suggested default with ✅ in the **Suggested** column:

- `01-envision/prfaq.md`
- every `04-prototypes/PROTOTYPE-*.md`
- `05-product-strategy/strategy.md`
- `06-go-to-market/gtm-plan.md`

Everything else (pain points, research, use cases, scoring, ranking, charts, prototype HTML) gets an empty **Suggested** cell.

Always use the table — never a numbered or bulleted list. Chat renderers merge list items that follow a heading line and renumber lists, which breaks the numbers the user replies with.

```
Here's everything we've produced. ✅ marks my suggestion for the hand-off package:

| # | Folder | File | Suggested |
|---|--------|------|-----------|
| 1 | 01-envision | prfaq.md | ✅ |
| 2 | 01-envision | pain-points.md | |
| 3 | 01-envision | research/research-summary.md | |
| 4 | 02-use-case-intake | use-cases.md | |
| 5 | 03-prioritization | ranking.md | |
| 6 | 04-prototypes | PROTOTYPE-{slug}.md | ✅ |
| 7 | 04-prototypes | {slug}/prototype.html | |
| 8 | 05-product-strategy | strategy.md | ✅ |

Reply **ok** for the suggested files, list the numbers you want (e.g. "1, 4, 6"), or say **all**.
```

### Reading the reply

- **Suggested files only (✅)** — "ok", "yes", "looks good", "go ahead", "fine", "create the zip", or any other reply that accepts the list without naming files. Accepting the list is NOT a request for everything.
- **Specific files** — numbers or file names. Package exactly those, whether or not they were marked ✅.
- **Changes to the suggestion** — e.g. "add 2", "drop 6". Start from the ✅ files and apply the change.
- **Everything** — only when the user explicitly says "all", "everything", or "every file".
- **Anything else** — if you cannot tell which files the user means, ask again. Never default to all files.

---

## Step 3: Confirm the Final List

Before building anything, restate the resolved selection as an explicit list and confirm it. Show each file by the name it will have in the zip — no folders — followed by where it comes from:

```
Packaging these {N} files into handoff-{project-slug}.zip (all in one folder, no subfolders):
- prfaq.md                  ← 01-envision/prfaq.md
- PROTOTYPE-{slug}.md       ← 04-prototypes/PROTOTYPE-{slug}.md
- strategy.md               ← 05-product-strategy/strategy.md
```

<decision question="Package these {N} files?">
<option description="Build the zip with exactly the files listed above">Package these files</option>
<option description="Go back to the numbered list and pick again">Change the selection</option>
</decision>

If "Change the selection" → return to Step 2. Once confirmed, this list is the **only** input to Step 4 — log it in `audit.md` now.

---

## Step 4: Build the Zip

Put exactly the confirmed files into `07-handoff/handoff-{project-slug}.zip`:

1. **File by file.** Add each confirmed file individually. Never zip a folder (`aiplc-docs/`, a phase folder, or `research/`) — that pulls in files the user did not select.
2. **Flat — no parent folders.** Store every file at the root of the archive under its file name only: `prfaq.md`, never `01-envision/prfaq.md`. Strip the folder path when adding each file (e.g. `zip -j`, or copy the files into one empty folder first and zip its contents). Never keep `01-envision/`, `04-prototypes/`, `research/` or any other folder inside the zip.
3. **Resolve name clashes.** Prototype HTML files are all named `prototype.html`; rename each to `prototype-{slug}.html` in the zip. If any other confirmed files share a name, prefix each with its parent folder name (`{folder}-{file}`). The content is never changed — only the file name inside the zip.
4. **Real files only.** No symlinks, no dotfiles.
5. **Verify.** List the archive's actual contents (read the zip, do not recall what you meant to add). The file count and names must match the confirmed list, allowing only the renames from rule 3, and no entry may contain a folder (`/`). If anything is missing or extra, delete the zip and rebuild it. Never present a zip that fails this check.

If this runtime cannot create zip files, or cannot write to the chosen storage, copy the same confirmed files, flat, into `07-handoff/handoff-{project-slug}/` instead, verify that folder the same way, and tell the user plainly that it still needs zipping or copying. Never say a zip was created unless it was.

---

## Step 5: Save and Distribute

1. Save the zip to `07-handoff/` in the chosen storage location
2. Update `aiplc-state.md`
3. Log in `audit.md` — the verified contents of the zip
4. Tell the user where the zip is and list its verified contents
5. Offer distribution using the options in the "Discovery Complete" section of `SKILL.md`

---

## Workshop Mode Notes

- If sub-teams built different prototypes, produce one hand-off per team: `handoff-{project-slug}-{team-or-use-case-slug}.zip`
- Confirm who receives each package before the session ends, while the room is still full
