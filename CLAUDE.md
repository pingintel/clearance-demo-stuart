# clearance-demo — agent doctrine

Standalone Vite/React **demo**: a thin shell that iframes a validated standalone
prototype (`public/clearance-prototype.html`, ~6k lines). The "app" is the
prototype; `ClearanceFrame` is the wrapper. This is a CLIENT-FACING DEMO, not a
product build — keep the iframe, polish content, do not rewrite into real React
unless a signed campaign says so (the iframe→React migration path is in
`HANDOFF.md`, deliberately deferred).

## Framework
The canonical engineering + agentic framework is pinned at `.framework/`
(git submodule). Read it there. Apply its spirit: minimum-viable
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

<!-- DOCTRINE-POINTER v1 — generated from .framework/handoff-schema.md + manifest.yaml. Do not hand-edit; regenerate via sync-doctrine-pointer.sh. -->
## Framework doctrine (canonical — read from `.framework/`, do not restate)

This project follows the unified Ping agentic framework. The canonical docs are vendored in this repo as a pinned submodule at `.framework/` and are the
single source of truth — when this file and a `.framework/` doc disagree, the
`.framework/` doc wins. Update the pin deliberately: `git submodule update --remote .framework`.

- **Index:** `.framework/manifest.yaml`
  declares the canonical set in precedence order. Read it to know which docs are in force.
- **Before any multi-agent dispatch**, read `.framework/agent-topology.md` — the three
  work shapes (coupled build / staged pipeline / independent fan-out), the judgment
  checkpoints (where the seat switches up to the top model), and the worker tiers.
- **For every handoff**, follow `.framework/handoff-schema.md` — the DISPATCH / HANDOFF /
  LEDGER file roles, the `docs/handoffs/<campaign>-<YYYY-MM-DD-HHMM>-{DISPATCH,HANDOFF}.md`
  naming, and the loop: `decide → DISPATCH → execute → HANDOFF → VERIFY → decide next`.
  The execution session writes a HANDOFF with evidence (sha + gate counts, file:line), not
  self-reports; the judgment session VERIFIES before advancing. Record gates as `presented`,
  never `closed` — closing is Stuart's act.
- **Read state first:** at task start, read the latest `docs/handoffs/*.md` for what's in
  flight. **Write a handoff at the end** per the schema. A vague handoff breaks the loop.

The repo-specific CLAUDE.md content (stack, ports, paths, architecture) is below/above this
block and is owned by the repo; this block is owned by the framework and regenerated.
<!-- /DOCTRINE-POINTER v1 -->
