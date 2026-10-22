# Development Progress

A running log of everything completed on the project, newest work at the top of
each section. This is the single place to see "what has been done." Add a row
whenever work lands.

## Status summary

| | |
|---|---|
| **Phase** | Requirements gathering → design |
| **Application code** | Not started |
| **Docs site** | ✅ Live (this site) |
| **Contribution process** | ✅ Defined (AI Contribution Guide) |
| **Next** | Generate requirements-gathering prompts; capture finance-stakeholder input |

## Completed work

| Date | Item | Category | Output | Notes |
|------|------|----------|--------|-------|
| 2026-10-22 | SBOM page | Docs | `docs/sbom.md` | Dependency inventory + ASF license-category tracking |
| 2026-10-22 | Software map | Docs | `docs/software-map.md` | Repo tree, planned app layout, component diagram |
| 2026-10-22 | Docs site on Bootstrap 5 | Docs | `theme/` (Jinja2 + Bootstrap 5), `mkdocs.yml` | Custom MkDocs theme matching the dashboard stack; central navbar partial, mermaid, dark/light toggle |
| 2026-10-22 | Docs website scaffold | Docs | `mkdocs.yml`, `docs-src/`, `docs/`, `build-docs.sh` | Source in `docs-src/`, built HTML in `docs/` served by GitHub Pages (`/docs`, no CI) |
| 2026-10-22 | AI Contribution Guide | Process | `CONTRIBUTING.md` | Meta-prompt process, numbered prompt system, ASF generative-AI policy compliance |
| 2026-10-22 | Prompt library baseline | Process | `prompts/README.md`, `prompts/00-context.md` | Prompt index + shared context baseline (no build prompts authored yet) |
| 2026-10-22 | Meta-prompt template | Requirements | `prompts/asf-financial-dashboard-requirements.md` | Template for generating stakeholder/build prompts |
| 2026-10-22 | Requirements interview (initial) | Requirements | (memory/notes) | Confirmed stack, plugin model, financial structure; identified finance gaps |
| 2026-10-22 | Repository created | Infra | `dfoulks1/finance-dashboard` | Initial commit, `prompts/` dir |

## In progress / next up

| Item | Category | Blocked on |
|------|----------|------------|
| Generate finance-ops requirements prompt | Requirements | — |
| Capture finance-stakeholder answers | Requirements | Finance stakeholder availability |
| Draft unified requirements document | Design | Stakeholder input |
| Define plugin base-class contracts | Design | Requirements sign-off |
| Core Quart app skeleton | Build | Architecture sign-off |

## Open questions

Tracked on the [Architecture page](architecture.md#open-questions) — finance
specifics (accounting system, fiscal year, categories, alert thresholds) that
require a finance stakeholder and must not be invented.
