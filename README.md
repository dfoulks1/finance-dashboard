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
- **[docs/](docs/)** — the development docs website (MkDocs Material).

## Stack

Python · Quart (async) · Jinja2 · Bootstrap 5 · `uv`. Plugin-based architecture —
the core is extensible without modification. Storage is a plugin (SQLite default,
PostgreSQL optional). See [docs/architecture.md](docs/architecture.md).

## Docs site

Built locally with MkDocs Material (no CI — builds are cheap and on-demand):

```bash
./build-docs.sh          # strict build into ./site
./build-docs.sh serve    # live preview at http://127.0.0.1:8000
```

The generated `site/` directory is the publishable artifact. Publishing happens
from the default branch after human-reviewed merges (see
[docs/policy-compliance.md](docs/policy-compliance.md)).

## License

Apache License 2.0.
