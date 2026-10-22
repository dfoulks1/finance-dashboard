# ASF Financial Dashboard — Meta-Prompt for Requirements Generation

**Purpose:** Generate comprehensive, stakeholder-specific prompts to gather requirements for the ASF Financial Dashboard project.

**Date:** 2026-10-22  
**Status:** Meta-prompt template — use this to generate actual requirements-gathering prompts

---

## Context: What We Know So Far

From initial interview with Drew (technical lead, non-finance background):

### Technical Architecture (Confirmed)
- **defaults:** follow coding, linting, ui, and environment management standards from https://github.com/apache/tooling-trusted-releases, because we want to be able to integrate with the ATR tool.
- **Auth:** ASF LDAP (future), HTTP basic auth via Apache httpd initially
- **Logging:** Comprehensive structured JSON logs, audit trail for all actions

### Known Financial Structure
- **Total assets:** ~$4M
- **Reserve (restricted):** ~$2M (should not be spent; may be spent by board approval with a reason)
- **Operating cash (unrestricted):** ~$2M (liquid)
- **Fiscal year:** ASF fiscal year starts May 1st
- **Revenue tracking:** Includes "shadow budget" for in-kind donation value
- **Budget structure:** Committee-level budgets (queryable/configurable)
- **IRS 990 Tax Data:** available at https://projects.propublica.org/nonprofits/api via EIN 470825376
- **ASF Annual Report:** review reference data on operations and budget use at https://apache.org/foundation/docs/FY2026AnnualReport.pdf

### Plugin Types to Support
1. Data source plugins (accounting systems, CSV, databases, APIs)
2. Storage backend plugins (SQLite default, PostgreSQL, etc.)
3. Metric calculator plugins
4. Forecasting plugins (ship one default: linear runway projection)
5. Report generator plugins (PDF, CSV exports)
6. Dashboard widget plugins (custom charts, tables)
7. Alert rule plugins (custom triggers)
8. MCP plugin (ship by default for AI queries)

### Design Principles
- **Documentation-first:** Easy to understand and extend
- **Stable core:** Extend without modifying core classes
- **Extensibility > features:** Prefer plugin hooks to built-in complexity
- **Operable by volunteers:** Non-technical users must be able to use it

### Gaps Requiring Finance Stakeholder Input
- Actual accounting system in use
- Full cost/revenue category taxonomies
- Alert thresholds and triggers
- Essential metrics and user persona needs
- Budget input/approval workflows
- Existing reports to replicate

---

## Meta-Prompt Template

Use this template to generate a requirements-gathering prompt for a specific stakeholder or topic area.

### Template Structure

```markdown
# [Stakeholder Role] Requirements Prompt — ASF Financial Dashboard

**Your role:** [Treasurer / VP Finance / Board Member / Finance Volunteer / etc.]  
**Purpose:** Gather [specific domain] requirements for the ASF financial dashboard

## Background
The Apache Software Foundation is building a custom financial dashboard to provide visibility into cash position, reserves, spending patterns, and budget variance. The system will be:
- Hosted on ASF infrastructure
- Used by board members and finance volunteers
- Extensible via plugins (so we can add features without rewriting core code)
- Documentation-first (easy to operate and maintain)

## What We Need From You

### Section 1: [Topic Area]
[Questions specific to this stakeholder's domain]

1. **[Question 1]**
   - Context: [Why we're asking this]
   - Format: [How to answer — free text, list, table, etc.]
   - Example: [Sample answer to clarify]

2. **[Question 2]**
   ...

### Section 2: [Topic Area]
...

## How to Respond
- Answer as many or as few questions as you can
- "I don't know" is a valid answer — we'll find out together
- Flag anything that's ambiguous or needs discussion
- Share examples of existing reports/spreadsheets if available

## Next Steps
Your answers will feed into:
1. Detailed requirements document
2. System architecture design
3. MVP feature prioritization
4. Plugin development roadmap

Thank you for your time!
```

---

## Stakeholder-Specific Prompt Generators

### 1. Finance Operations Stakeholder (Treasurer, VP Finance)

**Goal:** Understand current financial data sources, processes, workflows, and pain points.

**Key Questions:**
- What accounting system does ASF use? (QuickBooks, Xero, Sage, custom, etc.)
- How is data currently extracted? (Manual export, API, read-only DB access?)
- What reports do you run today? (Can we see examples?)
- What takes the most time each month?
- What questions do board members ask that are hard to answer?
- Who maintains budgets, and how? (Spreadsheet, accounting system?)
- What alerts/notifications would save you time or prevent problems?
- When is the fiscal year? What are the important close dates?
- What are the actual cost and revenue categories used in budgeting?

### 2. Board Member Stakeholder

**Goal:** Understand high-level information needs, decision-making triggers, meeting cadence.

**Key Questions:**
- What financial questions do you ask most often?
- What keeps you up at night regarding ASF finances?
- How often do you check financial status? (Monthly board meeting, ad-hoc, never?)
- What format do you prefer? (Executive summary, detailed tables, charts?)
- Mobile or desktop? (Do you check on your phone?)
- What would trigger you to ask for more detail? (Cash drop, big variance, runway concern?)
- Do you need historical comparisons? (This year vs. last year, trend over time?)

### 3. Committee Chair Stakeholder (Holds a Budget)

**Goal:** Understand committee-level budget tracking and reporting needs.

**Key Questions:**
- What does your committee spend money on?
- How do you know your current balance?
- Do you need approval before spending? If so, from whom?
- How often do you check your budget status?
- What happens if you overspend? Underspend?
- Do you track multi-year commitments? (E.g., event sponsorships, recurring contracts?)
- Would you want alerts? (You're at 80% of budget, etc.)

### 4. IT/Infrastructure Stakeholder (Deployment & Operations)

**Goal:** Understand deployment environment, security constraints, monitoring needs.

**Key Questions:**
- What Ubuntu version is standard on ASF hosts?
- What's the standard deployment pattern? (systemd service, reverse proxy, etc.)
- How are secrets managed? (Keyring, env vars, vault?)
- What monitoring/alerting is already in place? (Prometheus, Nagios, email?)
- What's the LDAP setup for auth? (Schema, group membership for roles?)
- Backup strategy for the dashboard's database?
- Log aggregation? (Shipped to central logging, or local only?)
- SSL/TLS termination at Apache httpd?

---

## Prompt Refinement Process

1. **Generate initial prompt** using the template above for a specific stakeholder
2. **Review with Drew (technical lead):** Does this match the project's scope and constraints?
3. **Refine:** Adjust questions based on technical feasibility and plugin architecture
4. **Send to stakeholder:** Via email, meeting, or async questionnaire
5. **Capture answers:** In structured markdown format
6. **Synthesize:** Merge all stakeholder inputs into unified requirements document
7. **Iterate:** Resolve conflicts, fill gaps, prioritize features

---

## Example: Generated Prompt for Finance Operations Stakeholder

```markdown
# Finance Operations Requirements — ASF Financial Dashboard

**Your role:** Treasurer or VP Finance (whoever runs day-to-day ASF finances)  
**Purpose:** Understand current financial data sources, workflows, and reporting needs

## Background
ASF is building a custom financial dashboard to give board members and finance volunteers real-time visibility into cash, reserves, spending, and budget variance. The system will be plugin-based (so we can extend it easily) and will run on ASF infrastructure.

## What We Need From You

### 1. Current Financial Data & Systems

**Q1: What accounting/bookkeeping system does ASF use?**
- QuickBooks, Xero, Sage, FreshBooks, custom system, spreadsheets, other?
- Who has access? (You, accountant, multiple people?)
- Is it cloud-hosted or on-premise?

**Q2: How do you currently get data out of that system?**
- Manual CSV export?
- API access (if so, read-only or read-write)?
- Direct database access?
- PDF reports that someone manually transcribes?

**Q3: How often does financial data update?**
- Real-time (every transaction immediately visible)?
- Daily batch (nightly import)?
- Weekly/monthly (after reconciliation)?
- On-demand (you run a report when needed)?

**Q4: Is there a test/sandbox environment we can develop against?**
- Or will we need to work with production read-only access?
- Can you provide anonymized sample data? (CSV export with real structure, fake numbers?)

### 2. ASF Fiscal Calendar & Budget Structure

**Q5: When is ASF's fiscal year?**
- Calendar year (Jan 1 – Dec 31)?
- May 1 – April 30?
- Other?

**Q6: What are the major cost categories in ASF's budget?**
- Please list the top-level categories (e.g., Personnel, Infrastructure, Events, Legal, Marketing, etc.)
- Are there sub-categories? (If so, how deep does the hierarchy go?)

**Q7: What are the revenue categories?**
- Sponsorships (list tiers: Platinum, Gold, Silver, Bronze, etc.)?
- Individual donations?
- Grants?
- Interest income?
- Event ticket sales?
- Other?

**Q8: What is the "shadow budget" for in-kind donations?**
- How is it tracked today?
- Examples: donated cloud credits, pro-bono legal, volunteer time valuation?
- Should the dashboard show shadow budget separately, or integrated with cash budget?

**Q9: How are committee budgets structured?**
- Does each board committee (Marketing, Fundraising, Brand, etc.) have a separate budget line?
- Are they independent pools, or subdivisions of a parent category?
- How many committees are there? (~5, ~10, ~20?)

### 3. Current Reports & Workflows

**Q10: What financial reports do you run today?**
- Can you share examples? (Redact actual numbers if sensitive, keep structure/format)
- How often do you run each report? (Monthly for board meeting, weekly for yourself, etc.)

**Q11: What takes the most time each month?**
- Reconciling transactions?
- Generating board reports?
- Answering ad-hoc questions from board members?
- Budget variance analysis?
- Something else?

**Q12: What questions do board members ask that are hard to answer?**
- "Why did we spend $X on Y?" (requires digging into transactions)
- "How much runway do we have?" (requires projection)
- "Why haven't we spent the Z budget?" (requires comparing plan vs. actual + context)
- "What's our burn rate?" (requires historical analysis)

### 4. Alerts & Monitoring

**Q13: What financial conditions should trigger an alert?**
For each, provide a threshold if you know it (or say "not sure, need to discuss"):
- Cash balance below $X?
- Burn rate more than X% above forecast?
- Any budget category more than X% over budget?
- Any budget category more than X% under budget? (unspent funds concern)
- No activity in a category for X days? (forgotten budget line)
- Single large transaction over $X? (requires review)
- Reserve funds accessed? (should almost never happen)

**Q14: Who should receive alerts, and how?**
- Email (to whom? Daily digest or real-time?)
- Slack message (#finance channel, DM to treasurer?)
- Visual indicator on dashboard only (user checks proactively)?
- Push notification (probably overkill?)

**Q15: Should alerts block actions, or just inform?**
- Example: If cash is too low, should the system prevent someone from logging a payment?
- Or just flag it and trust the human to decide?

### 5. Budget Input & Approval

**Q16: Who creates/updates the annual budget?**
- Treasurer? Committee chairs? Board approval required?
- How is it maintained today? (Google Sheet? Accounting system? Email thread?)

**Q17: How should budget data get into the dashboard?**
- CSV upload? (You export from spreadsheet, upload to dashboard)
- Web form? (Manual entry, row by row)
- API sync? (Dashboard reads directly from accounting system or Google Sheets)

**Q18: Do we need a budget approval workflow?**
- Draft → Review → Approve?
- Or is the budget finalized offline, and the dashboard just displays it?

**Q19: Do budgets change mid-year?**
- If yes, how often? (Quarterly revisions, ad-hoc amendments?)
- Should the dashboard track budget versions? (Show what we planned in May vs. what we revised in October?)

### 6. Historical Analysis & Forecasting

**Q20: Do you need year-over-year comparisons?**
- Example: This October's spending vs. last October's spending?
- Revenue this FY vs. last FY?

**Q21: Do you need multi-year trends?**
- Example: Chart showing revenue over last 3 fiscal years?

**Q22: What forecasting/projection would be useful?**
- Simple runway: "At current burn rate, cash lasts X months"
- More complex: "If we hire 2 more people and cut event budget by 20%, runway is Y months"
- Or is forecasting out of scope for v1?

### 7. Compliance & Audit

**Q23: What audit trail do you need?**
- Who viewed financial data? (Probably not — too noisy)
- Who dismissed an alert? (Probably yes)
- Who uploaded a budget? (Definitely yes)
- Who changed a configuration setting? (Probably yes)

**Q24: How long must audit logs be retained?**
- 7 years (IRS requirement for 501c3)?
- Forever?
- 1 year is enough?

**Q25: Are there 501(c)(3) compliance features the dashboard should support?**
- Restricted vs. unrestricted fund tracking (already planned)
- Grant compliance reporting (track spend against grant terms)?
- Donation receipts (probably out of scope)?
- Form 990 prep assistance (probably out of scope, but worth asking)?

### 8. Open-Ended

**Q26: What are we not asking that we should be?**
- Any pain points we missed?
- Any "wouldn't it be cool if..." ideas?
- Any deal-breakers or must-haves we haven't covered?

**Q27: Can you connect us with 2–3 finance volunteers for user testing?**
- We'll want early feedback on the MVP before rolling it out to the board.

## How to Respond
- Answer in any format (email reply, recorded Zoom walkthrough, annotated document, etc.)
- "I don't know" is a valid answer — we'll figure it out together
- Screenshots/examples of current reports are extremely helpful
- No rush — take the time you need, but sooner helps us scope v1

## Next Steps
Your answers will inform:
1. Detailed requirements document
2. Plugin architecture design (which data sources to support first)
3. MVP feature prioritization
4. Dashboard UI mockups (what to show on the landing page)

Thank you!
```

---

## Next Steps

1. **Review this meta-prompt** with Drew: Does the structure make sense? Any missing stakeholder groups?
2. **Generate stakeholder-specific prompts** using the template (start with Finance Ops, then Board Member)
3. **Refine each prompt** based on Drew's feedback and technical constraints
4. **Send prompts to stakeholders** (or use them in live interviews)
5. **Capture answers** in structured markdown
6. **Synthesize into unified requirements doc** (section-by-section, resolving conflicts)
7. **Build architecture doc** from requirements (plugin contracts, DB schema, API design)
8. **Implement MVP** (core + 1–2 plugins)

---

**End of Meta-Prompt Document**
