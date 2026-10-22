# Contributing to the ASF Financial Dashboard (AI-Assisted Development Guide)

This repository is an **AI-powered development project** for an Apache Software
Foundation (ASF) effort. Most code and documentation here is produced with the
help of generative AI tooling, driven by a structured, reviewable **prompt
system**. This guide explains how we work and — critically — how we stay
compliant with ASF policy while doing it.

If you are a human directing an AI tool, **you** are the contributor and you
carry every obligation below. If you are an AI agent reading this as context,
treat it as binding operating instructions for this repository.

---

## 1. Ground rules (read this first)

1. **A human is always the contributor.** AI is a tool, not an author. Every
   change is reviewed, understood, and vouched for by a named human before it
   lands. Prompts alone do not create authorship or absolve responsibility.
2. **Everything is reviewable.** The prompt that produced a change is committed
   alongside the change (see the [numbered prompt system](#4-the-numbered-prompt-system)).
   Reviewers can see *what was asked* as well as *what was produced*.
3. **Disclose AI involvement** in commit messages using a provenance token
   (see [§3](#3-asf-generative-ai-policy-compliance)).
4. **Documentation-first.** This project's functional priorities are
   extensibility and ease of use, and it is documentation-first. A change that
   isn't documented isn't done.
5. **When in doubt about licensing or provenance, stop and ask.** Email
   `legal-private@apache.org` or raise it with the project lead rather than
   guessing.

---

## 2. How we build: the two-layer prompt workflow

Development is driven by prompts, organized in two layers:

```
Meta-prompt  ──generates──▶  Numbered prompts  ──drive──▶  Code / docs / design
(the "how to     (00-, 01-, 02- …            (reviewed, tested,
 ask" template)   executed in order)          committed by a human)
```

- **Layer 1 — the meta-prompt** is a *template that generates prompts*. It
  encodes what we know about the project (architecture, constraints, financial
  structure, stakeholders) and a reusable structure for producing good,
  specific prompts. It lives at
  [`prompts/asf-financial-dashboard-requirements.md`](https://github.com/dfoulks1/finance-dashboard/blob/main/prompts/asf-financial-dashboard-requirements.md).
- **Layer 2 — numbered prompts** are the concrete, ordered instructions that
  actually build the dashboard. They are generated with the help of the
  meta-prompt, refined by a human, then executed in sequence.

See [§5](#5-the-meta-prompt-process) and [§4](#4-the-numbered-prompt-system) for
the details of each.

---

## 3. ASF generative AI policy compliance

This is the non-negotiable part. It implements the ASF's
[Generative Tooling Guidance](https://www.apache.org/legal/generative-tooling.html#include-in-contributions).
Read that page; this section summarizes your obligations for *this* repo.

### 3.1 Your ICLA obligations still apply

When you contribute AI-assisted work you are still bound by the Apache
Individual Contributor License Agreement (ICLA):

- **Section 4 — you must be entitled to grant the license.** That entitlement
  depends on your AI tool's terms of use: they must grant you ownership of (or
  rights broad enough to contribute) the output under Apache-2.0, and must not
  restrict the output in a way inconsistent with the
  [Open Source Definition](https://opensource.org/osd/). Find the clause in your
  provider's ToU that addresses ownership/use of output and confirm it before
  contributing.
- **Section 5 — you represent the work is your original creation.** A
  contribution simultaneously (a) discloses any third-party material it contains
  and (b) states the rest is your own work. Both must hold for AI-assisted work.
- **Section 7 (not a practical route for AI).** Section 7 covers submitting work
  that is *not* your original creation, but it requires the complete details of
  the work's source. For AI output those details are generally unknowable, so do
  **not** rely on Section 7 to launder AI-generated material into a contribution.
- **Section 8 — ongoing duty to notify.** If you later learn something that makes
  your representations inaccurate (e.g. the output reproduced incompatibly
  licensed code), you must tell the Foundation: `legal-private@apache.org`.

### 3.2 The two conditions every AI contribution must meet

Per the guidance, AI-generated code/docs may be contributed only if **both**:

**Condition 1 — tooling terms are compatible.** The tool's ToU grant you
sufficient rights in the output and impose no OSD-inconsistent restrictions
(see §3.1, Section 4).

**Condition 2 — at least ONE of the following is true:**

| # | Condition | Notes |
|---|-----------|-------|
| 2.1 | The output is **not copyrightable** subject matter (and wouldn't be even if a human produced it). | Legally **unsettled** — do not lean on this alone. |
| 2.2 | **No third-party materials** are included in the output. | Preferred route. |
| 2.3 | Any third-party materials are used **with permission** (compatible OSS license) and in compliance with that license. | Preferred route; follow the [3rd Party Licensing Policy](https://www.apache.org/legal/resolved.html). |

> **Prefer 2.2 or 2.3.** Relying on 2.1 alone ties the contribution to a legal
> question nobody has answered yet. Where practical, establish that the output
> contains no third-party material, or only properly-licensed third-party
> material.

**Condition 3 — reasonable certainty.** You gain reasonable certainty that 2.2
or 2.3 holds when the tool reports similarity to its training data, or from code
scanning results. Many tools report nothing and scanners only match *known* OSS,
so this certainty is not always achievable — when it isn't, say so in review and
treat the change with extra caution (prefer small, well-understood diffs).

### 3.3 Commit provenance (required)

Every commit containing AI-assisted content **must** disclose the tool in the
commit message trailer, using one of:

```
Generated-by: <Tool Name> <Version>
```

or, when the human meaningfully co-authored the result:

```
Co-authored-by: <Tool Name> <Version>
```

Examples:

```
Generated-by: Claude (Anthropic) opus-4.x
Co-authored-by: GitHub Copilot 2026.10
```

This feeds a future machine-parsable `Tooling-Provenance` file, so keep the
token format exact. If a commit also closes a numbered prompt, reference it:
`Prompt: 03-core-app-skeleton.md`.

### 3.4 Documentation and images

The same rules apply to **documentation** and **images**. Watch for tools whose
generated-content licensing is restrictive, and confirm compliance with the
[3rd Party Licensing Policy](https://www.apache.org/legal/resolved.html) and
[3rd Party Works](https://www.apache.org/legal/src-headers.html#3party).

### 3.5 Publishing publicly (EU AI Act)

Different rules apply to AI-generated text **published to the public** — project
announcements, release notes, blog posts, security advisories, and **this
project's docs website**. Under the EU AI Act (in force since 2 August 2026),
such text must be **labeled as AI-generated unless a person reviewed it before
publication and takes responsibility for it.**

For us that means: **a committer/PMC member reviews the docs site content before
it publishes** (normal review, nothing extra). If content is ever published
*without* human review — e.g. a bot auto-posting — it must carry a clear
AI-generated label. In short: **review it before you publish it, or label it.**
Our docs are built locally from the default branch *after* human-reviewed
merges, and the generated `site/` is what gets published — which satisfies the
review path.

### 3.6 Tool choice

The ASF does **not** maintain an approved-tools list and does not tell you which
tool to use. Use whatever you like **provided you follow this guidance**. Don't
second-guess a vendor's terms of use — your usage is bound by the totality of
their ToU and you are not expected to look outside that text.

---

## 4. The numbered prompt system

Numbered prompts are the ordered, concrete instructions that build the project.
They live in [`prompts/`](https://github.com/dfoulks1/finance-dashboard/tree/main/prompts) and follow a strict convention so the build
is reproducible and auditable.

### 4.1 Naming

```
prompts/NN-short-kebab-slug.md
```

- `NN` — zero-padded, two-digit sequence number (`00`, `01`, …, `10`, …).
  Numbers define **execution order**, not priority.
- `short-kebab-slug` — a terse description, e.g. `03-core-app-skeleton`.
- `00` is reserved for **context/baseline** (the shared project state every
  later prompt assumes). See [`prompts/00-context.md`](https://github.com/dfoulks1/finance-dashboard/blob/main/prompts/00-context.md).

Reserve ranges to keep things navigable (adjust as the project grows):

| Range | Theme |
|-------|-------|
| `00`      | Context / baseline |
| `01–09`   | Requirements & design |
| `10–29`   | Core application & plugin framework |
| `30–59`   | Plugins (data sources, storage, metrics, forecasting, reports, MCP) |
| `60–79`   | UI / dashboard |
| `80–89`   | Testing, CI, deployment |
| `90–99`   | Docs, polish, release |

### 4.2 Anatomy of a prompt

Every numbered prompt uses this front-matter + body so it is self-describing and
reviewable:

```markdown
---
id: 03-core-app-skeleton
status: draft            # draft | ready | executed | superseded
depends_on: [00-context, 02-architecture]
produces: [app/, pyproject.toml]
model: claude-sonnet-4.5 # tool/model this prompt is intended for
provenance: Generated-by: Claude (Anthropic) sonnet-4.x
---

# 03 — Core App Skeleton

## Goal
One sentence: what this prompt should accomplish.

## Inputs
- Which prior outputs / files this prompt assumes (link them).

## Tasks
1. Explicit, ordered steps for the agent.
2. …

## Outputs
- Exact files/dirs expected, and acceptance criteria.

## Verification
- How a human confirms the output is correct (tests to run, what to eyeball).

## Provenance & licensing notes
- Expected third-party deps and their licenses; any §3.2 condition relied on.
```

### 4.3 Lifecycle of a prompt

1. **Generate** a draft with help from the meta-prompt (§5).
2. **Refine** it with a human — tighten scope, add acceptance criteria, pin the
   model, note expected dependencies and their licenses.
3. **Mark `ready`.**
4. **Execute** it with the chosen AI tool.
5. **Review** the output: read it, run the verification steps, check §3.2
   conditions, confirm no unexpected third-party material.
6. **Commit** the resulting change *and* flip the prompt's `status: executed`,
   with a provenance trailer (§3.3) and `Prompt: NN-slug.md`.
7. If a later decision invalidates a prompt, mark it `superseded` (never delete —
   history is the audit trail) and add the replacement with a new number.

### 4.4 The prompt index

[`prompts/README.md`](https://github.com/dfoulks1/finance-dashboard/blob/main/prompts/README.md) is the human-readable index of every
numbered prompt, its status, and what it produced. Keep it current — it is the
map of how the dashboard was built.

---

## 5. The meta-prompt process

The **meta-prompt** (`prompts/asf-financial-dashboard-requirements.md`) is a
template for *generating prompts*, not a prompt that builds code directly. It
captures the project's known state and a reusable structure so every generated
prompt is specific, grounded, and consistent.

The refinement loop:

1. **Generate** an initial prompt from the meta-prompt template for a specific
   stakeholder or build task.
2. **Review** with the technical lead: does it match scope, constraints, and the
   plugin architecture?
3. **Refine** the questions/tasks based on feasibility.
4. **Use** it — send to a stakeholder (requirements prompts) or hand to an AI
   tool (build prompts).
5. **Capture** answers/output in structured markdown.
6. **Synthesize** into the requirements doc or the next numbered prompt.
7. **Iterate** — resolve conflicts, fill gaps, prioritize.

Requirements-gathering prompts and build prompts both come out of this process;
the former feed design, the latter feed implementation.

---

## 6. Contribution checklist

Before you open a pull request:

- [ ] The change traces back to a numbered prompt (new or existing), and that
      prompt is committed/updated with `status: executed`.
- [ ] You **read and understood** every line of AI-generated output — you can
      explain and defend it in review.
- [ ] Verification steps ran clean (tests pass, build works, docs render).
- [ ] §3.2 Condition 1 (tool ToU) is satisfied for the tool you used.
- [ ] §3.2 Condition 2 holds (prefer 2.2 / 2.3) — no unexpected third-party
      material, or it's compatibly licensed and noted.
- [ ] Commit message carries a `Generated-by:` / `Co-authored-by:` provenance
      trailer and a `Prompt: NN-slug.md` reference.
- [ ] New third-party dependencies are license-checked against the
      [3rd Party Licensing Policy](https://www.apache.org/legal/resolved.html)
      and pinned to exact versions.
- [ ] Public-facing text (docs, announcements) is human-reviewed before it
      publishes (§3.5).
- [ ] Documentation updated (this is a documentation-first project).

---

## 7. Pull requests & commits

- Branch from the default branch; name branches descriptively.
- Keep PRs small and tied to one prompt where possible — small diffs are easier
  to review and to establish provenance for.
- One logical change per commit; include the provenance and prompt trailers.
- The default branch is protected: changes land via reviewed PRs, which is also
  our EU AI Act review gate (§3.5).

---

## 8. Project facts (quick reference)

- **Stack:** Python + Quart (async) + Jinja2 + Bootstrap 5; `uv` + `pyproject.toml`.
- **Architecture:** plugin-based — drop-in `.py` files in `plugins/` inheriting
  base classes; the core must be extensible **without** modification.
- **Storage:** plugin (SQLite default; PostgreSQL optional).
- **Deployment:** ASF-hosted Ubuntu LTS, systemd + Apache httpd; ASF LDAP auth
  eventually.
- **Financial scope:** ~$4M total (~$2M restricted reserve, ~$2M operating
  cash); committee-level budgets; configurable fiscal year.
- **Finance details** (categories, thresholds, fiscal dates) require a finance
  stakeholder — do not invent them; gather them via requirements prompts.

---

*This guide is itself a living, AI-assisted document. It was drafted with
generative tooling and is human-reviewed before publication, per §3.5.*
