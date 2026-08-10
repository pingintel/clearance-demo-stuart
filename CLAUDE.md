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
- Agent commits; the operator pushes.
- Never edit files or take filesystem actions unless explicitly asked.
- Checkpoint HANDOFF.md before stopping; respawn over compact above ~70% context.

<!-- DOCTRINE-POINTER v2 — generated from ~/Projects/ping-framework (7-doc core, manifest v2). Do not hand-edit; regenerate via sync-doctrine-pointer.sh. -->
## Framework doctrine (canonical — read from the framework repo, do not restate)

This project follows the unified Ping agentic framework v2. The canonical docs live in
`~/Projects/ping-framework/` and are the single source of truth — when this file and a
framework doc disagree, the framework doc wins.

- **MANDATORY session load:** read `~/Projects/ping-framework/agent-runtime.md` before the
  first tool call — levels, hard-rule core, capability preflight, gate, halt rules, and
  operating-mode selection (Patch / Slice / Campaign). Its §10 table says what else to load
  per task. `manifest.yaml` declares the full canonical set (7-doc core + companions).
- **Before any build**, pick the mode per `build-modes.md` §1 — rule out Campaign hard
  triggers first (data change, contract/API change, cross-repo, security boundary,
  multi-agent, schema migration, irreversible operation), then the lightest mode that fits.
- **Before any multi-agent dispatch**, read `agent-topology.md` (companion) — work shapes,
  judgment checkpoints, worker tiers — and `handoff-protocol.md` for the DISPATCH / HANDOFF /
  LEDGER protocol: `docs/handoffs/<campaign>-<YYYY-MM-DD-HHMM>-{DISPATCH,HANDOFF}.md` naming,
  the loop `decide → DISPATCH → execute → HANDOFF → VERIFY → decide next`, and the unattended
  run contract. Evidence over claims (sha + gate counts, file:line), never self-reports.
  Record Slice/Campaign gates as `presented`, never `closed` — closing is the operator's act.
- **Read state first:** at task start, read the campaign LEDGER
  (`docs/handoffs/<campaign>-LEDGER.md`) plus the latest HANDOFF for the active campaign slug.
  **Write a HANDOFF at the end** of every Slice or Campaign session, led by the ≤6-line
  triage block (CHANGED / RISK / OWED / DECISIONS / NEXT). A vague handoff breaks the loop.

The repo-specific CLAUDE.md content (stack, ports, paths, architecture) is below/above this
block and is owned by the repo; this block is owned by the framework and regenerated.
<!-- /DOCTRINE-POINTER v2 -->
