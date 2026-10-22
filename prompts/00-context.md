---
id: 00-context
status: ready
depends_on: []
produces: [context]
model: any
provenance: Generated-by: Claude (Anthropic) opus-4.x
---

# 00 — Project Context (Baseline)

This is the shared context every later numbered prompt assumes. It is **not** a
build prompt — it carries no tasks. Paste it (or reference it) at the top of any
AI session that works on this repository so the agent starts grounded.

Keep it accurate and terse. When a fact changes, update it here rather than
restating it in individual prompts.

## What we're building

A custom **financial dashboard for The Apache Software Foundation** — a 501(c)(3)
nonprofit — giving board members and finance volunteers visibility into cash
position, reserves, spending patterns, and budget variance. Core questions it
must answer: *money we have, money we should not spend, money we should spend,
and why haven't we spent it.*

## Technical architecture (confirmed)

- **Stack:** Python + Quart (async) + Jinja2 templates + Bootstrap 5.
- **Dependencies:** `uv` + `pyproject.toml`; pin exact versions.
- **Plugin architecture:** drop-in `.py` files in `plugins/` inheriting base
  classes. The **core must be extensible without modification**. Plugin types:
  data source, storage backend, metric calculator, forecasting, report
  generator, dashboard widget, alert rule, and an MCP plugin (shipped by
  default for AI queries).
- **Storage:** plugin-based — SQLite default, PostgreSQL optional.
- **Deployment:** ASF-hosted Ubuntu LTS, systemd service behind Apache httpd;
  ASF LDAP auth eventually (HTTP basic auth initially).
- **Logging:** structured JSON logs; audit trail for all mutating actions.
- **UI:** Bootstrap 5, plugin-extensible left nav, responsive (desktop-priority),
  year-over-year views, top-line summary with drill-down.

## Financial structure (known)

- **Total assets:** ~$4M — **~$2M restricted reserve** (must not be spent) and
  **~$2M operating cash** (liquid).
- Committee-level budgets (queryable/configurable). Revenue tracking includes a
  "shadow budget" for in-kind donation value. Fiscal year is configurable
  (actual ASF FY start **unknown** — gather from finance).

## Design principles

- **Documentation-first.** Extensibility and ease of use are the functional
  priorities. Prefer plugin hooks over built-in complexity. Operable by
  non-technical volunteers.

## Gaps — do NOT invent these

Accounting system in use; fiscal-year start; full cost/revenue taxonomies; alert
thresholds; essential metrics per persona; budget input/approval workflow;
existing reports to replicate. These need a **finance stakeholder** — gather them
with requirements prompts, never assume them.

## Policy

All AI-assisted output in this repo must follow
[`../CONTRIBUTING.md`](../CONTRIBUTING.md) §3 (ASF generative-AI guidance):
ICLA obligations, the two conditions (prefer 2.2/2.3), commit provenance
trailers, and human review before any public publication.
