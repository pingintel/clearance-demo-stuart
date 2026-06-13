#!/usr/bin/env bash
# gate.sh — green before any commit. Demo repo: typecheck + lint + build.
# No test suite (iframe demo; prototype validated by eye). Uses bun (npm
# under-installs this repo — see CLAUDE.md).
set -euo pipefail
cd "$(dirname "$0")"
export PATH="$HOME/.bun/bin:/opt/homebrew/bin:$PATH"

step() { echo "▸ $1"; }

step "typecheck (tsc -b)"
bunx tsc -b || { echo "✗ typecheck failed"; exit 1; }

step "eslint"
bun run lint || { echo "✗ eslint failed"; exit 1; }

step "build (vite)"
bun run build || { echo "✗ build failed"; exit 1; }

echo "✓ gate passed"
