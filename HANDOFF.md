# clearance-demo — Engineering Handoff

## CURRENT STATE — 2026-06-13

**Client-facing DEMO, harnessed to house standard.** Vite/React shell iframing a
validated standalone prototype. Runs clean on bun; port 5182 (PORT REGISTRY).

### What this is
- `src/` — thin React shell: `main.tsx` → `App.tsx` (react-router) →
  `ClearancePage` → `ClearanceFrame` (a 17-line `<iframe>` wrapper).
- `public/clearance-prototype.html` (~6k lines) — the actual demo UI. This is
  what renders. Validated by eye.
- `clearance-demo.html` (repo root) — original standalone source, retained.

### Harness added 2026-06-13 (conform-on-contact)
- `.claude/settings.local.json` — agent permissions (bun/PATH, start/stop, lsof/kill).
- `CLAUDE.md` — agent doctrine + the run-discipline lessons.
- `start.sh` / `stop.sh` — registry-port preflight + bun + `--host`.
- `gate.sh` — typecheck + eslint + build (no test suite; iframe demo).
- `.gitignore` — telemetry block.

### Run it
`./start.sh` (own terminal, not an agent shell) → http://localhost:5182/ or
http://127.0.0.1:5182/. `./stop.sh` to free the port. bun only — never npm.

### NOT done (deferred by design)
- iframe → real-React migration. Path retained from the old memory.md:
  extract submission data + UI state from the prototype → port submission table
  → five left subcards → right preview shell → remove iframe only after parity.
  This is a MULTI-GATE CAMPAIGN, not a cleanup — only if clearance-demo becomes
  a product build. As a demo, the iframe stays.
- Behavioral contract to preserve IF migrated: left lower cards change only on
  submission selection; right preview tabs change only the preview; reclick
  deselects; shift-click range; up/down arrow moves selection; zoom +/- changes
  density for list + all 5 subcards together; date fields type + native picker.

### Standing
Agent commits; Stuart pushes. Gate green before commit. Checkpoint before stop.
