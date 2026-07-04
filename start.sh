#!/usr/bin/env bash
# start.sh — cold-start clearance-demo after any gap. Preflights the registry
# port (fail loud if taken — never silently grab the wrong one), then launches
# the Vite dev server. Port from the PORT REGISTRY (NEW-PROJECT.md): 5182.
# Vite-only demo (no Django). Uses bun — npm under Node 25 silently under-installs
# this repo's deps (caught 2026-06-13). --host binds both localhost (IPv6) and
# 127.0.0.1 (IPv4) so either address resolves.
set -euo pipefail
cd "$(dirname "$0")"
export PATH="$HOME/.bun/bin:/opt/homebrew/bin:$PATH"
VITE_PORT=${VITE_PORT:-5182}

# ── Port preflight ───────────────────────────────────────────────────────────
if lsof -i ":$VITE_PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  echo "✗ Vite port $VITE_PORT is already in use:"
  lsof -i ":$VITE_PORT" -sTCP:LISTEN -n -P | grep LISTEN
  echo "  Free it (./stop.sh), or check the PORT REGISTRY in NEW-PROJECT.md."
  echo "  NOT starting — refusing the wrong port."
  exit 1
fi

# ── Deps preflight (bun, not npm — see header) ───────────────────────────────
if ! command -v bun >/dev/null 2>&1; then
  echo "✗ bun not on PATH. Install: curl -fsSL https://bun.sh/install | bash"
  exit 1
fi
if [ ! -d node_modules/@vitejs/plugin-react ]; then
  echo "📦 Installing deps with bun (npm under-installs this repo)…"
  bun install
fi

# ── Frontend (Vite) ──────────────────────────────────────────────────────────
echo "🚀 Vite dev → http://localhost:$VITE_PORT/  (also http://127.0.0.1:$VITE_PORT/)"
exec bun run dev --host
