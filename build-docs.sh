#!/usr/bin/env bash
# Build the development docs site locally into ./docs (no CI — GitHub Actions is
# costly). The built HTML in ./docs is served directly by GitHub Pages:
# Settings -> Pages -> Deploy from a branch -> main / /docs.
#
#   ./build-docs.sh          # one-off strict build into ./docs
#   ./build-docs.sh serve    # live-reload preview at http://127.0.0.1:8000
#
# After building, commit ./docs and push main — Pages serves the new content
# with no workflow run.
set -euo pipefail
cd "$(dirname "$0")"

VENV=".docs-venv"
if [ ! -d "$VENV" ]; then
  if command -v uv >/dev/null 2>&1; then
    uv venv "$VENV"
    # shellcheck disable=SC1091
    . "$VENV/bin/activate"
    uv pip install -r docs-src/requirements.txt
  else
    python3 -m venv "$VENV"
    # shellcheck disable=SC1091
    . "$VENV/bin/activate"
    pip install -r docs-src/requirements.txt
  fi
else
  # shellcheck disable=SC1091
  . "$VENV/bin/activate"
fi

if [ "${1:-build}" = "serve" ]; then
  exec mkdocs serve -a 127.0.0.1:8000
fi

mkdocs build --strict
# Tell GitHub Pages not to run Jekyll over the generated site.
touch docs/.nojekyll
echo "Built docs/ — $(find docs -type f | wc -l | tr -d ' ') files (includes .nojekyll)."
