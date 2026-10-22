# ASF Financial Dashboard

A custom financial dashboard for **The Apache Software Foundation** (a 501(c)(3)
nonprofit), giving board members and finance volunteers visibility into cash
position, reserves, spending patterns, and budget variance.

This is an **AI-powered development project**: code and documentation are
produced with generative AI tooling driven by a structured prompt workflow, and
**every change is reviewed and vouched for by a named human** before it lands.

## Start here

- **[CONTRIBUTING.md](CONTRIBUTING.md)** — how we work: the meta-prompt process,
  the numbered prompt system, and ASF generative-AI policy compliance. Read this
  before contributing.
- **[prompts/](prompts/)** — the prompt library ([index](prompts/README.md)).
- **[docs-src/](docs-src/)** — the development docs website source (MkDocs Material).

## Stack

Python · Quart (async) · Jinja2 · Bootstrap 5 · `uv`. Plugin-based architecture —
the core is extensible without modification. Storage is a plugin (SQLite default,
PostgreSQL optional). See [docs-src/architecture.md](docs-src/architecture.md).

## Docs site

Built locally with MkDocs Material — **no CI** (GitHub Actions is costly).
Source markdown is in `docs-src/`; the built HTML is written into `docs/`.

```bash
./build-docs.sh          # strict build: docs-src/ -> docs/
./build-docs.sh serve    # live preview at http://127.0.0.1:8000
```

**Publish on GitHub Pages (no workflow):** in the repo, *Settings → Pages →
Build and deployment → Deploy from a branch*, choose branch `main` and folder
`/docs`. After that, publishing is just: rebuild `docs/`, commit it, and push
`main`. GitHub Pages serves the static files directly — no Actions run. A
`.nojekyll` marker is written into `docs/` so Pages skips Jekyll processing.

## License

Apache License 2.0.
