# PROTOTYPE-freshness-intelligence.md

## Metadata
- **Use Case:** Freshness Intelligence
- **Type:** Agentic (Hybrid — ML predictions + LLM personalization)
- **Customer:** Costco Wholesale
- **Primary User:** Busy family shopper (weekly bulk grocery trips)
- **Platform:** Mobile only (iOS / Android)
- **Generated:** 2026-07-22 | AI-PLC Discovery on Amazon Quick Desktop

---

## 1. Overview

### Problem Statement
Costco members — especially busy families buying produce weekly — are frustrated that items spoil within hours or days of purchase. They have no visibility into when deliveries arrive at their warehouse or how long items have been on the shelf. The result: wasted food, wasted money, and eroded trust in Costco's quality.

### Solution
Freshness Intelligence is an agentic feature in the Costco mobile app that monitors warehouse delivery schedules, predicts freshness windows for perishable items, and proactively alerts members of optimal pickup times. Members see at-a-glance freshness badges (🟢🟡🔴) on their shopping list and receive personalized push notifications when tracked items are at peak freshness.

### Key Outcome
Members bring home produce that lasts 2x longer because they shop at the optimal freshness window — not by accident, but by design.

---

## 2. User Stories

### Primary
> "As a busy parent who shops at Costco weekly, I want to know WHEN my local warehouse received fresh produce so I can time my trip for peak freshness and stop throwing away berries that mold the next day."

### Secondary
> "As a Costco member who buys bakery and dairy items in bulk, I want to see how fresh items are RIGHT NOW so I can decide whether today is a good shopping day or if I should wait for the next delivery."

---

## 3. Design Context

### Brand Identity
| Element | Value |
|---|---|
| Primary Red | #E61031 (PMS 186) |
| Primary Blue | #005BAD (PMS 286) |
| Background | #FFFFFF (white) |
| Text | #333333 (dark gray) |
| Success/Fresh | #2E8B57 (green) |
| Warning/OK | #F5A623 (amber) |
| Alert/Declining | #E61031 (red — matches brand) |
| Typography | Inter / Helvetica Neue (clean sans-serif) |
| Style | Clean, no-nonsense, high-contrast, value-focused |

### Freshness Badge System
| Badge | Color | Meaning | Timeframe |
|---|---|---|---|
| 🟢 **Peak** | #2E8B57 | Just delivered, maximum freshness | 0-24 hours on shelf |
| 🟡 **Good** | #F5A623 | Still fresh, normal quality | 1-3 days on shelf |
| 🔴 **Declining** | #E61031 | Quality dropping, buy soon or skip | 4+ days on shelf |

### Design Principles
1. **Glanceable** — badges communicate instantly without reading
2. **Non-intrusive** — alerts are helpful, never spammy (max 2-3/week)
3. **Actionable** — every screen has a clear "what to do next"
4. **Trust-building** — show the data behind the prediction (delivery date, shelf days)

---

## 4. Screens & Interactions

### Screen 1: Onboarding (2-3 steps)
**Purpose:** Set up freshness tracking preferences

**Step 1 — Category Selection:**
- Header: "What should I track for freshness?"
- Grid of category cards with icons: Produce 🥬, Berries 🫐, Bakery 🍞, Dairy 🧀, Meat 🥩, Seafood 🐟
- Multi-select (tap to toggle, visual checkmark)
- Default: Produce + Berries pre-selected (most common complaint)
- Button: "Start Tracking"

**Step 2 — Warehouse Confirmation:**
- "I'll track freshness at your primary warehouse:"
- Shows: [Issaquah, WA — Warehouse #001]
- Option to change warehouse
- Button: "Looks good"

**Step 3 — Notification Preference:**
- "When should I alert you?"
- Options: "When items hit Peak 🟢" / "Day before my usual trip" / "Both"
- Button: "Done — Start Tracking"

### Screen 2: Push Notification
**Purpose:** Proactive freshness alert on lock screen

**Lock Screen View:**
```
🫐 Costco Freshness
Organic blueberries just arrived at Issaquah.
Best pickup: Today–Tomorrow for 7-day freshness.
```

**Expanded View (pull down):**
```
🫐 Organic Blueberries (2 lb)     🟢 PEAK
📍 Issaquah Warehouse
📦 Delivered: Today, 6:00 AM
⏰ Best pickup: Wed Jul 22 – Thu Jul 23
📊 Expected home shelf life: 7 days

[View in App]    [Add to List]
```

### Screen 3: Freshness Dashboard ("My Freshness" tab)
**Purpose:** At-a-glance view of all tracked items' freshness status

**Layout:**
- Tab bar: Home | Smart Shop | **Freshness** | Account
- Header: "My Freshness" with date
- Summary card: "Best shopping day this week: **Wednesday** (4 items at Peak)"
- Item list grouped by category:

```
PRODUCE
├── 🟢 Organic Blueberries (2 lb)     Peak — delivered today
├── 🟢 Baby Spinach (1 lb)            Peak — delivered today
├── 🟡 Avocados (6 ct)                Good — 2 days on shelf
└── 🔴 Strawberries (2 lb)            Declining — 5 days on shelf

BAKERY
├── 🟢 Croissants (12 ct)             Peak — baked this morning
└── 🟡 Sourdough Loaf                 Good — 1 day old

DAIRY
└── 🟡 Organic Whole Milk (2 gal)     Good — 3 days in cooler
```

- Each item row is tappable → Item Detail screen
- Floating action: "Plan My Trip" button

### Screen 4: Item Detail
**Purpose:** Deep dive on one product's freshness history

**Layout:**
- Product image + name + current badge (🟢/🟡/🔴)
- **Freshness timeline** (horizontal bar):
  - Shows: Delivery date → Now → Predicted decline date
  - Current position marked on timeline
- **This batch:**
  - Delivered: Jul 22, 6:00 AM
  - Current shelf age: 4 hours
  - Expected home life if purchased today: 7 days
  - Expected home life if purchased Saturday: 4 days
- **History:**
  - Last 4 purchases with "How long did it last?" ratings
  - Average freshness at this warehouse: 🟢 (delivers Mon & Thu)
- **Delivery schedule:**
  - "This warehouse typically receives this item: Mon & Thu"

### Screen 5: Post-Purchase Feedback
**Purpose:** Train the model with real-world freshness data

**Trigger:** 3-5 days after purchase (smart timing based on category)

**Push notification:**
```
🫐 Quick check: How are those blueberries holding up?
[Still great 👍] [Going soft 😐] [Already bad 👎]
```

**In-app (if tapped):**
- "How long did your organic blueberries last?"
- Slider or tap: 1 day / 3 days / 5 days / 7+ days
- Optional: "Any issues?" free text
- "Thanks! This helps us predict better for you."

---

## 5. Technical Architecture

### System Components

```
┌─────────────────────────────────────────────────────────────┐
│                    MOBILE FRONTEND                            │
│   React Native (Expo) — runs on iOS/Android simulator        │
│   Onboarding │ Dashboard │ Notifications │ Feedback          │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTP (localhost:3001)
┌──────────────────────────┴──────────────────────────────────┐
│              LOCAL BACKEND (Node.js + Express)                │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌───────────────┐     │
│  │  Freshness   │  │  Alert       │  │  Feedback     │     │
│  │  Rules Engine│  │  Generator   │  │  Store        │     │
│  │  (JS logic)  │  │  (LLM call)  │  │  (SQLite)     │     │
│  └──────────────┘  └──────────────┘  └───────────────┘     │
│                                                              │
│  LLM: Bedrock CLI *or* local Ollama *or* mock responses     │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────┴──────────────────────────────────┐
│              LOCAL DATA (JSON files + SQLite)                 │
│                                                              │
│  • delivery-schedules.json (simulated WMS data)              │
│  • purchase-history.json (sample member data)                │
│  • shelf-life-reference.json (baseline freshness per SKU)    │
│  • feedback.db (SQLite — member freshness ratings)           │
└─────────────────────────────────────────────────────────────┘
```

### Technology Stack (Local-First)
| Component | Technology | Rationale |
|---|---|---|
| Freshness Rules Engine | Plain JavaScript (rule-based logic) | Calculates badge from shelf_age — no ML infra needed for prototype. Simple: `if shelf_hours < 24 → 🟢, < 72 → 🟡, else → 🔴` |
| Alert Personalization | Bedrock CLI (optional) OR Ollama (local) OR mock responses | LLM generates natural alert copy. Runs locally via Ollama (llama3) or falls back to static templates if no LLM available |
| Backend | Node.js + Express (localhost:3001) | Single `npm install && npm start` — no cloud deployment needed |
| Data Store | SQLite + JSON files | Zero-config database for feedback; JSON files for reference data. No DynamoDB setup. |
| Push Notifications | Local notification simulator (in-app toast) | Simulates push notifications within the app — no APNs/FCM keys needed |
| Mobile App | React Native + Expo | `npx expo start` — runs on iOS Simulator or Android Emulator. No app store deployment. |
| LLM (optional) | Ollama (local) or AWS Bedrock CLI | `ollama run llama3` for local LLM. Or `aws bedrock-runtime invoke-model` if AWS credentials are configured. Falls back to template-based alerts if neither available. |

### Data Requirements
| Data Source | What We Need | Prototype Approach |
|---|---|---|
| WMS Receiving Log | Delivery timestamps per SKU per warehouse | `delivery-schedules.json` — 30 days of simulated data for one warehouse |
| Category Shelf Life | Baseline expected life per product category | `shelf-life-reference.json` — static reference table (e.g., blueberries: 7 days, spinach: 5 days) |
| Member Purchase History | What members buy, when, how often | `purchase-history.json` — sample member with 3 months of grocery purchases |
| Member Feedback | Post-purchase freshness ratings | `feedback.db` (SQLite) — written by the app as member rates items |
| Temperature/Condition | Warehouse storage conditions | Not needed for prototype (assumed standard refrigeration) |

### Setup Instructions (One Command)
```bash
# Clone and run — no cloud accounts needed
git clone <repo-url>
cd freshness-intelligence
npm install
npm start
# → Backend at localhost:3001
# → Open Expo app on simulator: npx expo start
```

### Optional: Enable LLM for personalized alerts
```bash
# Option A: Local (no cloud)
ollama pull llama3
export FRESHNESS_LLM=ollama

# Option B: AWS Bedrock (if credentials configured)
export FRESHNESS_LLM=bedrock
export AWS_REGION=us-east-1
```

---

## 6. Prototype Scope

### In Scope (for prototype)
- ✅ Mobile UI for all 5 screens (simulated data)
- ✅ Onboarding flow (functional category selection)
- ✅ Push notification mockup (visual, not live push)
- ✅ Freshness Dashboard with 🟢🟡🔴 badges (static sample data)
- ✅ Item detail with timeline visualization
- ✅ Post-purchase feedback capture (UI only)
- ✅ LLM-powered alert copy generation (Ollama local OR Bedrock OR template fallback)

### Out of Scope (production only)
- ❌ Real WMS integration (prototype uses simulated delivery data)
- ❌ Trained ML prediction model (prototype uses rule-based logic)
- ❌ Live push notification delivery (prototype shows visual mockup)
- ❌ Multiple warehouse support (prototype shows one warehouse)
- ❌ Full React Native build (prototype is HTML/CSS mobile-responsive)

---

## 7. Acceptance Criteria

| # | Criterion | How to Test |
|---|---|---|
| 1 | Member can select freshness categories to track | Tap categories on onboarding → see them reflected in dashboard |
| 2 | Push notification displays with personalized freshness alert | View notification mockup with real Bedrock-generated copy |
| 3 | Freshness Dashboard shows items with 🟢🟡🔴 badges and timeline | Open dashboard → see color-coded list grouped by category |
| 4 | Tapping an item shows freshness detail with delivery history | Tap any item → see timeline, shelf age, predicted home life |
| 5 | Post-purchase feedback screen captures 1-tap freshness rating | Trigger feedback → tap rating → see confirmation |

---

## 8. Success Metrics (Production)

| Metric | Target | Measurement |
|---|---|---|
| Member adoption | 5M members opt-in within 6 months | Onboarding completion rate |
| Produce waste reduction | 30% fewer "spoiled within 2 days" feedback reports | Post-purchase feedback trends |
| Trip timing alignment | 40% of members shift shopping to recommended days | Purchase timestamp vs. delivery timestamp correlation |
| Alert engagement | 25% tap-through rate on freshness notifications | Push notification analytics |
| App rating impact | +0.3 stars on app store rating | App store tracking |

---

## 9. Open Questions

1. How often do delivery schedules change? (Determines prediction confidence)
2. Are delivery timestamps digitized for all product categories at all warehouses?
3. What's the member opt-in tolerance for push notifications? (Frequency tuning)
4. Should we show freshness for items the member hasn't bought before? (Discovery mode)
5. Legal review: Can we "guarantee" freshness windows, or must all copy be hedged?

---

## 10. Portable Build Instructions

This spec is designed for any AI development tool to implement:

### For Quick Desktop (HTML prototype):
Build as a mobile-responsive HTML artifact with simulated data. Use the Costco color palette. Integrate Bedrock API for live alert copy generation.

### For Kiro / Claude Code (local-first build):
Build as React Native (Expo) + Node.js Express backend. All data in local JSON + SQLite — no cloud infrastructure required. LLM is optional (Ollama local, Bedrock CLI, or template fallback). One-command setup: `npm install && npm start`. Freshness logic is a simple rules engine (shelf_age → badge), not a trained ML model. Runs entirely on laptop.

---

*Generated by AI-PLC Discovery | 2026-07-22T14:09:00-04:00*
*Portable format: Compatible with Quick Desktop, Kiro, Claude Code*
