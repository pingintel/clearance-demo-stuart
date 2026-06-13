# clearance-demo — agent doctrine

Standalone Vite/React **demo**: a thin shell that iframes a validated standalone
prototype (`public/clearance-prototype.html`, ~6k lines). The "app" is the
prototype; `ClearanceFrame` is the wrapper. This is a CLIENT-FACING DEMO, not a
product build — keep the iframe, polish content, do not rewrite into real React
unless a signed campaign says so (the iframe→React migration path is in
`HANDOFF.md`, deliberately deferred).

## Framework
The canonical engineering + agentic framework lives in the vault
(`Ping/Process/`) and cannot be loaded here. Apply its spirit: minimum-viable
over speculative abstraction, every change traceable to what was asked, no
restating the rules. For a demo this means: small, reversible, content-focused.

## Run discipline (LESSONS FROM 2026-06-13 — do not relearn these)
- **Use bun, never npm.** npm under Node 25 silently under-installs this repo's
  deps (installed 36 of ~147; dropped @vitejs/plugin-react). `bun install` works.
- **Start via `./start.sh`** — preflights registry port 5182 (fails loud if
  taken), installs with bun if needed, runs `vite --host` so BOTH localhost
  (IPv6) and 127.0.0.1 (IPv4) answer. `./stop.sh` frees the port.
- **Run it in your OWN terminal**, not an agent tool-shell — background servers
  launched from agent shells die when the shell exits.
- Port 5182 is this project's PORT REGISTRY allocation (NEW-PROJECT.md). Never
  reuse another project's port.

## Gate
`./gate.sh` — typecheck + eslint + build. No test suite (iframe demo; the
prototype is validated by eye, not by Playwright). Green before any commit.

## Standing rules
- Agent commits; Stuart pushes.
- Never edit files or take filesystem actions unless explicitly asked.
- Checkpoint HANDOFF.md before stopping; respawn over compact above ~70% context.
