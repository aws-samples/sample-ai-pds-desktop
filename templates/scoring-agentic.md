# Scoring Framework — Agentic Use Cases

> Apply this framework ONLY to use cases classified as "Agentic". For Application use cases, use `scoring-application.md`.

---

## Framework Overview

Agentic use cases are scored on 6 dimensions specific to AI agent development. Each dimension is weighted to reflect its importance in determining prototype viability and business value.

**Total possible score: 5.0** (weighted average)

---

## Dimensions

### 1. Automation Potential (Weight: 25%)

**What it measures:** How much of the current manual process can the agent automate?

| Score | Definition | Example |
|---|---|---|
| 1 | Minimal (< 20% of workflow) | Agent assists with one small step |
| 2 | Partial (20-40% of workflow) | Agent handles research/data gathering |
| 3 | Significant (40-60% of workflow) | Agent manages the core loop with human checkpoints |
| 4 | High (60-80% of workflow) | Agent handles most steps, human approves outputs |
| 5 | Near-complete (80%+) | Agent runs end-to-end, human monitors |

**Score higher if:** Process is repetitive, rules-based, time-consuming, or involves synthesizing information.
**Score lower if:** Process requires deep domain expertise, nuanced judgment, or creative direction at every step.

---

### 2. Decision Complexity (Weight: 20%)

**What it measures:** How complex are the decisions the agent must make?

| Score | Definition | Example |
|---|---|---|
| 1 | Trivial — binary/lookup decisions | Route to correct department based on keyword |
| 2 | Simple — few clear criteria | Classify documents into predefined categories |
| 3 | Moderate — multiple factors, some ambiguity | Recommend treatment options based on patient history |
| 4 | Complex — competing priorities, trade-offs | Optimize scheduling across multiple constraints |
| 5 | Highly complex — strategic reasoning | Generate business strategy from market analysis |

**Score higher if:** The decisions are well-defined enough for AI to reason about reliably.
**Score lower if:** Decisions require political judgment, creative taste, or ethical deliberation that shouldn't be automated.

**Note:** Higher complexity is GOOD for value (harder to do manually) but consider Error Tolerance.

---

### 3. Tool Integration Breadth (Weight: 15%)

**What it measures:** How many external tools/APIs must the agent orchestrate?

| Score | Definition | Example |
|---|---|---|
| 1 | None — agent reasons over provided text only | Summarization agent |
| 2 | 1-2 tools — simple integrations | Search + document retrieval |
| 3 | 3-5 tools — moderate orchestration | CRM + email + calendar + database |
| 4 | 6-10 tools — complex orchestration | Full workflow across multiple systems |
| 5 | 10+ tools — ecosystem-level integration | Enterprise-wide automation agent |

**Score higher if:** Tools have good APIs, documentation, and predictable behavior.
**Score lower if:** Tools require complex authentication, have unreliable APIs, or need custom integrations.

---

### 4. Error Tolerance (Weight: 15%)

**What it measures:** How forgiving is the domain if the agent makes mistakes?

| Score | Definition | Example |
|---|---|---|
| 1 | Zero tolerance — errors cause harm/liability | Medical treatment decisions, financial transactions |
| 2 | Low tolerance — errors are costly to fix | Legal document generation, customer-facing commitments |
| 3 | Moderate — errors are noticeable but recoverable | Email drafting, report generation |
| 4 | High tolerance — errors are easily caught/fixed | Internal research, brainstorming, first drafts |
| 5 | Very high — errors don't matter much | Content suggestions, exploration, ideation |

**Score higher if:** Humans review output before action, or mistakes are low-cost.
**Score lower if:** Outputs go directly to customers/patients, or errors have legal/safety implications.

**IMPORTANT:** High error tolerance (4-5) makes a use case BETTER for prototyping.

---

### 5. Conversation Depth (Weight: 10%)

**What it measures:** How much multi-turn, contextual interaction is required?

| Score | Definition | Example |
|---|---|---|
| 1 | Single turn — one question, one answer | FAQ lookup |
| 2 | Short exchange — 2-3 turns | Clarification + answer |
| 3 | Moderate — 5-10 turns with context | Guided intake/interview |
| 4 | Deep — extended session with evolving context | Advisory session, troubleshooting |
| 5 | Very deep — ongoing relationship with memory | Long-term coaching, patient management |

**Score higher if:** Conversation depth adds clear value over a form-based interface.
**Score lower if:** Same outcome could be achieved with a simple search or form.

---

### 6. Data Access Patterns (Weight: 15%)

**What it measures:** How accessible and well-structured is the data the agent needs?

| Score | Definition | Example |
|---|---|---|
| 1 | Data doesn't exist or requires significant collection | Novel research domains |
| 2 | Data exists but is messy/siloed/unstructured | Legacy systems, paper records |
| 3 | Data available but needs transformation/aggregation | Multiple databases, mixed formats |
| 4 | Data well-organized, accessible via APIs | Modern SaaS platforms, data lakes |
| 5 | Data is perfectly structured and instantly available | Well-designed knowledge bases, indexed content |

**Score higher if:** Data is already digital, structured, and accessible.
**Score lower if:** Significant data engineering needed before the agent can function.

---

## Calculation

```
Weighted Score = (Automation × 0.25) + (Decision × 0.20) + (Tools × 0.15) 
                + (Error Tolerance × 0.15) + (Conversation × 0.10) + (Data × 0.15)
```

## Interpretation

| Score Range | Recommendation |
|---|---|
| 4.0 - 5.0 | **Strong candidate** — High value, feasible, prototype immediately |
| 3.0 - 3.9 | **Good candidate** — Solid value, some challenges to address |
| 2.0 - 2.9 | **Questionable** — Significant barriers, needs more validation |
| 1.0 - 1.9 | **Not recommended** — Too risky or too little value for AI agent approach |

---

*AI-PLC Agentic Scoring Framework v1.0*
