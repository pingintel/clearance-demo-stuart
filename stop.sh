#!/usr/bin/env bash
# stop.sh — stop the clearance-demo Vite server (registry port 5182).
echo "Stopping clearance-demo…"
pkill -f "vite.*5182" 2>/dev/null && echo "  ✓ Vite stopped" || echo "  — Vite not running (by name)"
# Fallback: anything still holding the registry port.
if lsof -ti ":5182" -sTCP:LISTEN >/dev/null 2>&1; then
  lsof -ti ":5182" -sTCP:LISTEN | xargs kill 2>/dev/null && echo "  ✓ freed port 5182" || true
fi
echo "Done."
