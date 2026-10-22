# ASF Financial Dashboard — Development Docs

A custom financial dashboard for **The Apache Software Foundation** (a 501(c)(3)
nonprofit), giving board members and finance volunteers visibility into cash
position, reserves, spending patterns, and budget variance.

!!! info "AI-assisted, human-reviewed"
    This is an AI-powered development project. Code and documentation are
    produced with generative AI tooling driven by a structured prompt workflow,
    and **every change is reviewed and vouched for by a named human** before it
    lands. See the [AI Contribution Guide](ai-contribution.md) for the rules we
    work under, including [ASF generative-AI policy compliance](policy-compliance.md).

## The core questions

The dashboard exists to answer four questions about ASF finances:

1. **Money we have** — current cash and reserve position.
2. **Money we should not spend** — the restricted reserve.
3. **Money we should spend** — budgeted but unspent operating funds.
4. **Why haven't we spent it?** — budget-vs-actual variance with context.

## How this project is built

```
Meta-prompt  ──generates──▶  Numbered prompts  ──drive──▶  Code / docs / design
(template for      (00-, 01-, 02- …               (reviewed, tested,
 asking well)       executed in order)              committed by a human)
```

- [**AI Contribution Guide**](ai-contribution.md) — the binding how-we-work
  document: ground rules, the prompt workflow, and policy compliance.
- [**Prompt System**](prompt-system.md) — the meta-prompt process and the
  numbered prompt convention.
- [**Architecture**](architecture.md) — stack, plugin model, and open questions.
- [**Development Progress**](progress.md) — a running table of everything done.
- [**Policy Compliance**](policy-compliance.md) — the ASF generative-AI
  obligations in checklist form.

## At a glance

| | |
|---|---|
| **Stack** | Python · Quart (async) · Jinja2 · Bootstrap 5 · `uv` |
| **Architecture** | Plugin-based; core extensible without modification |
| **Storage** | Plugin (SQLite default, PostgreSQL optional) |
| **Deployment** | ASF Ubuntu LTS · systemd · Apache httpd · LDAP (future) |
| **Scope** | ~$4M total (~$2M restricted reserve · ~$2M operating cash) |
| **Status** | Requirements gathering → design |
