# Scoring Framework — Application Use Cases

> Apply this framework ONLY to use cases classified as "Application". For Agentic use cases, use `scoring-agentic.md`.

---

## Framework Overview

Application use cases are scored on 6 dimensions specific to traditional software development (even if AI-enhanced). Each dimension is weighted to reflect its importance in determining prototype viability and business value.

**Total possible score: 5.0** (weighted average)

---

## Dimensions

### 1. User Impact (Weight: 25%)

**What it measures:** How many users benefit and how significantly does it improve their work?

| Score | Definition | Example |
|---|---|---|
| 1 | Few users, minor improvement | Admin tool used by 2-3 people |
| 2 | Small group OR minor improvement to many | Nice-to-have feature for a team |
| 3 | Moderate — meaningful improvement for a defined group | Department-level productivity tool |
| 4 | High — significant improvement for many users | Company-wide workflow transformation |
| 5 | Transformative — critical impact across the organization | Customer-facing app serving thousands |

**Score higher if:** Large user base with frequent, painful current workflow.
**Score lower if:** Niche audience or marginal improvement over existing solution.

---

### 2. Technical Feasibility (Weight: 20%)

**What it measures:** How achievable is this with available technology and resources?

| Score | Definition | Example |
|---|---|---|
| 1 | Requires breakthrough technology or massive R&D | Novel AI capabilities that don't exist yet |
| 2 | Very challenging — new ground, uncertain outcomes | Cutting-edge ML with limited training data |
| 3 | Achievable — proven patterns but complex implementation | Standard ML + custom integrations |
| 4 | Straightforward — well-understood technology | CRUD app + existing APIs + proven ML models |
| 5 | Simple — off-the-shelf with minimal customization | Dashboard over existing data, basic automation |

**Score higher if:** Similar systems exist, technology is proven, team has relevant experience.
**Score lower if:** Novel approach, unproven at scale, or requires expertise team doesn't have.

---

### 3. Data Readiness (Weight: 15%)

**What it measures:** Is the required data available, accessible, and clean enough to use?

| Score | Definition | Example |
|---|---|---|
| 1 | Data doesn't exist — need to create collection pipeline | New data type, no historical records |
| 2 | Data exists but is poor quality/heavily siloed | Paper records, inconsistent formats, no APIs |
| 3 | Data available but needs significant cleaning/transformation | Multiple sources, some gaps, needs ETL |
| 4 | Data mostly ready — minor prep needed | Good databases, some normalization required |
| 5 | Data is clean, structured, and immediately usable | Well-maintained data warehouse, live APIs |

**Score higher if:** Data infrastructure is already in place and maintained.
**Score lower if:** Significant data engineering work required before app can function.

---

### 4. Integration Complexity (Weight: 15%)

**What it measures:** How many existing systems must connect, and how difficult are those connections?

| Score | Definition | Example |
|---|---|---|
| 1 | Requires integration with 5+ legacy systems with no APIs | Mainframe connections, custom protocols |
| 2 | Multiple systems with limited/poor APIs | Mix of modern and legacy, custom adapters needed |
| 3 | Several systems with adequate APIs | 3-4 modern SaaS tools with REST APIs |
| 4 | Few integrations with good APIs | 1-2 well-documented systems |
| 5 | Standalone or single-system integration | No external dependencies or one simple connection |

**Score higher if:** Target systems have modern APIs, good documentation, and sandbox environments.
**Score lower if:** Legacy systems, undocumented APIs, or organizations with strict integration policies.

---

### 5. Time to Value (Weight: 15%)

**What it measures:** How quickly can users start seeing benefit after development begins?

| Score | Definition | Example |
|---|---|---|
| 1 | 12+ months before any user value | Large platform that needs all pieces to work |
| 2 | 6-12 months | Complex system with many dependencies |
| 3 | 3-6 months | Standard product with iterative delivery |
| 4 | 1-3 months | Focused MVP with clear value prop |
| 5 | Under 1 month | Quick win, low complexity, immediate impact |

**Score higher if:** Clear MVP scope, value delivered incrementally, users can use partial functionality.
**Score lower if:** All-or-nothing deployment, requires extensive training, or regulatory approval.

---

### 6. Scalability (Weight: 10%)

**What it measures:** Can the application grow to handle increased demand without fundamental redesign?

| Score | Definition | Example |
|---|---|---|
| 1 | Won't scale — hard limits in architecture | Single-server, monolithic, no cloud |
| 2 | Limited scaling — expensive to scale | Requires major refactoring for growth |
| 3 | Moderate — can scale with some investment | Standard architecture, needs optimization |
| 4 | Good — built on scalable foundations | Cloud-native, serverless, auto-scaling |
| 5 | Excellent — scales automatically and cost-effectively | Designed for millions, pay-per-use |

**Score higher if:** Cloud-native architecture, stateless design, existing scalable infrastructure.
**Score lower if:** Tightly coupled to specific hardware, requires linear resource addition.

---

## Calculation

```
Weighted Score = (User Impact × 0.25) + (Feasibility × 0.20) + (Data × 0.15) 
                + (Integration × 0.15) + (Time to Value × 0.15) + (Scalability × 0.10)
```

## Interpretation

| Score Range | Recommendation |
|---|---|
| 4.0 - 5.0 | **Strong candidate** — High impact, low barriers, build now |
| 3.0 - 3.9 | **Good candidate** — Worthwhile but address key barriers |
| 2.0 - 2.9 | **Needs work** — High barriers or limited impact, reconsider scope |
| 1.0 - 1.9 | **Not recommended** — Too risky or too little return |

---

*AI-PLC Application Scoring Framework v1.0*
