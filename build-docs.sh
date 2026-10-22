#!/usr/bin/env bash
# Build the development docs site locally into ./site (no CI — builds are cheap
# and run on demand). Publish by copying ./site to the host of your choice.
#
#   ./build-docs.sh          # one-off strict build into ./site
#   ./build-docs.sh serve    # live-reload preview at http://127.0.0.1:8000
set -euo pipefail
cd "$(dirname "$0")"

VENV=".docs-venv"
if [ ! -d "$VENV" ]; then
  if command -v uv >/dev/null 2>&1; then
    uv venv "$VENV"
    # shellcheck disable=SC1091
    . "$VENV/bin/activate"
    uv pip install -r docs/requirements.txt
  else
    python3 -m venv "$VENV"
    # shellcheck disable=SC1091
    . "$VENV/bin/activate"
    pip install -r docs/requirements.txt
  fi
else
  # shellcheck disable=SC1091
  . "$VENV/bin/activate"
fi

if [ "${1:-build}" = "serve" ]; then
  exec mkdocs serve -a 127.0.0.1:8000
fi

mkdocs build --strict
echo "Built site/ — $(find site -type f | wc -l | tr -d ' ') files."
