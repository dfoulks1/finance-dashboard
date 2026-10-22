# Prompt Library — ASF Financial Dashboard

This directory holds the prompts that drive AI-assisted development of the
dashboard. Read [`../CONTRIBUTING.md`](../CONTRIBUTING.md) first — it defines the
meta-prompt process, the numbered prompt system, and the ASF generative-AI
policy obligations that every contribution must meet.

## Two layers

1. **Meta-prompt** — [`asf-financial-dashboard-requirements.md`](asf-financial-dashboard-requirements.md).
   A template that *generates* prompts. Not executed directly.
2. **Numbered prompts** — `NN-slug.md`, executed in order. Each is self-describing
   (front-matter + Goal/Inputs/Tasks/Outputs/Verification/Provenance) per
   CONTRIBUTING §4.2.

## Naming & ranges

```
NN-short-kebab-slug.md     # NN = zero-padded sequence = execution order
```

| Range | Theme |
|-------|-------|
| `00`      | Context / baseline |
| `01–09`   | Requirements & design |
| `10–29`   | Core application & plugin framework |
| `30–59`   | Plugins (data sources, storage, metrics, forecasting, reports, MCP) |
| `60–79`   | UI / dashboard |
| `80–89`   | Testing, CI, deployment |
| `90–99`   | Docs, polish, release |

## Index

Keep this table current. `status` is one of `draft | ready | executed | superseded`.

| # | Prompt | Status | Produces | Notes |
|---|--------|--------|----------|-------|
| — | [`asf-financial-dashboard-requirements.md`](asf-financial-dashboard-requirements.md) | ready | (meta) | Meta-prompt template |
| 00 | [`00-context.md`](00-context.md) | ready | (context) | Shared baseline every later prompt assumes |

Add a row for each new numbered prompt as it is created.

## Workflow (short form)

1. Generate a draft from the meta-prompt → 2. Refine with the lead → 3. Mark
`ready` → 4. Execute with your AI tool → 5. Review (run verification, check
policy §3.2) → 6. Commit output + flip `status: executed` with a
`Generated-by:` / `Prompt: NN-slug.md` trailer → 7. Supersede (never delete) when
a decision invalidates a prompt.
