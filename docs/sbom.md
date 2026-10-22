# Software Bill of Materials (SBOM)

A living inventory of every third-party dependency this project ships or builds
with, plus its license. This matters for two reasons:

1. **ASF 3rd-party licensing policy** — every dependency must be compatible with
   Apache-2.0 per the [3rd Party Licensing Policy](https://www.apache.org/legal/resolved.html).
   Category X licenses must not be included; Category B has conditions.
2. **AI provenance** — AI-generated code can silently pull in dependencies.
   Tracking them here is part of satisfying
   [Contribution Guide §3.2](policy-compliance.md) (no unexpected third-party
   material, or compatibly licensed and disclosed).

!!! info "Scope today"
    The application is not built yet, so the only **actual** dependencies are the
    documentation toolchain. The runtime rows are the **planned** stack and are
    marked accordingly — they become real (with pinned versions) as the numbered
    prompts implement them.

## Documentation toolchain (in use)

| Component | Version | License | Category | Purpose |
|-----------|---------|---------|----------|---------|
| mkdocs | `>=1.6` | BSD-2-Clause | A | Static docs site generator |
| mkdocs-material | `>=9.5` | MIT | A | Docs theme |
| pymdown-extensions | `>=10.0` | MIT | A | Markdown extensions (snippets, superfences, mermaid) |

(Mermaid diagrams render client-side via the theme; no build-time dependency.)

## Planned runtime stack (not yet built)

| Component | Intended version | License | Category | Purpose |
|-----------|------------------|---------|----------|---------|
| Python | 3.12+ | PSF | A | Language runtime |
| Quart | TBD | MIT | A | Async web framework |
| Jinja2 | TBD | BSD-3-Clause | A | Templating |
| Bootstrap | 5.x | MIT | A | Frontend CSS/JS |
| SQLite (via stdlib `sqlite3`) | stdlib | Public Domain | A | Default storage backend |
| PostgreSQL driver (optional) | TBD | TBD | TBD | Optional storage backend — vet before adding |

> **Category** refers to the ASF classification: **A** = compatible,
> **B** = allowed with conditions, **X** = prohibited. Confirm each row against
> the policy before a dependency lands; do not treat this table as a legal sign-off.

## Keeping this current

- **Pin exact versions** in `pyproject.toml` / `docs/requirements.txt` when a
  dependency becomes real, then reflect them here.
- When the app exists, generate a machine-readable SBOM in CI — e.g.
  [CycloneDX](https://cyclonedx.org/) via `cyclonedx-py` — and link the artifact
  from this page. A generated SBOM supplements, but does not replace, the
  human license-category review required by ASF policy.
- Any dependency introduced by AI-generated code must be added here as part of
  the same PR (Contribution Guide checklist).
