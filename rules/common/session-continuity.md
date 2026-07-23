# Session Continuity — AI-PLC on Quick Desktop

## Three Layers of Continuity

AI-PLC maintains state across sessions through three mechanisms:

### 1. Conversation Persistence (Primary)
Quick Desktop maintains the full conversation history. On return, the AI has complete context of everything discussed.

### 2. State File Backup (`aiplc-state.md`)
A structured state file is saved after every phase transition. This serves as:
- A backup if conversation is lost
- A quick-reference for where the user left off
- A portable state that could be moved between sessions

### 3. Quick Memory (Cross-session)
Key decisions (customer name, entry point, storage location) are saved to Quick's memory system for recall even in new conversations.

---

## State File Format

```markdown
# AI-PLC Session State

## Session Info
- **Project:** {customer/project name}
- **Started:** {ISO 8601 timestamp}
- **Last Updated:** {ISO 8601 timestamp}
- **Mode:** {Solo | Workshop}
- **Entry Point:** {1: Pain Points | 2: Use Cases | 3: Existing Specs}
- **Storage:** {OneDrive path | workspace | export}

## Progress
| Phase | Status | Artifact |
|---|---|---|
| Envision | ✅ Complete | 01-envision/prfaq.md |
| Solution Analysis | ✅ Complete | Single solution identified |
| Use Case Intake | 🔄 In Progress | 02-use-case-intake/use-cases.md (5 of 8 documented) |
| Prioritization | ⬜ Not Started | — |
| Prototype Specs | ⬜ Not Started | — |
| Prototype Build | ⬜ Not Started | — |
| Product Strategy | ⬜ Not Started | — |
| Go-to-Market | ⬜ Not Started | — |

## Current Phase Details
- **Active Phase:** Use Case Intake
- **Next Question:** Gathering details for use case #6
- **Pending:** 3 more use cases to document

## Key Decisions
- Pain points source: URL (https://example.com/reviews)
- Solution type: Multiple (4 solutions identified)
- Top use cases confirmed: [not yet]

## Artifacts Generated
1. `01-envision/pain-points.md` — 12 pain points confirmed
2. `01-envision/prfaq.md` — Approved by user
```

---

## Resumption Protocol

When a user returns to an AI-PLC session:

### Step 1: Detect State
Check for `aiplc-state.md` in the user's storage location. Also check conversation history.

### Step 2: Present Status
```
Welcome back! Here's where we left off:

**Project:** {name}
**Current phase:** {phase name}
**Progress:** {X of 6 capabilities complete}
**Last activity:** {what was happening}
```

### Step 3: Offer Options
<decision question="How would you like to proceed?">
<option description="Pick up exactly where we stopped">Continue from where I left off</option>
<option description="Go back to a previous phase to revise">Revisit a completed phase</option>
<option description="Clear everything and begin fresh">Start over</option>
</decision>

### Step 4: Restore Context
- Re-read relevant phase rules
- Load the active artifact if mid-phase
- Resume the next question in sequence

---

## State Updates

Update `aiplc-state.md` at these trigger points:
- Phase starts (status → 🔄 In Progress)
- Phase completes (status → ✅ Complete, artifact path recorded)
- Key decision made (added to Key Decisions section)
- User pauses or session ends
- Mid-phase progress (e.g., "5 of 8 use cases documented")

---

## Cross-Session Memory

Save to Quick memory (via `save_to_memory`) at these points:
- Customer/project name and context
- Entry point and storage location chosen
- Which phases are complete
- Any user preferences expressed (format, detail level, etc.)

This allows recall even if the user starts a new conversation and asks "What were we working on for {customer}?"

---

## Workshop Mode Continuity

For multi-day workshops:
- End of Day 1: Save full state + push summary to Slack
- Start of Day 2: Load state, present "Yesterday we..." summary
- Distribute PROTOTYPE-*.md files at day boundary
- Sub-teams start their own sessions with Entry Point 3
