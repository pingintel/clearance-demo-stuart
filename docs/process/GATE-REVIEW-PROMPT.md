# Standing gate-review prompt (automated dual-reviewer: Codex + Gemini)

GENERIC TEMPLATE. Project-neutral dual-reviewer protocol. A repo installs it
(copy into its own docs/process/ or .claude/). The ritual and template are
stack-agnostic; fill the {PARAMETERS} per gate. Codex + Gemini run the SAME
verbatim template, independently, never told what the other found.

## Ritual (orchestrator obligations — not part of the reviewer prompt)

1. At each gate presentation, the orchestrator invokes BOTH reviewers, passing the
   template below VERBATIM to each with ONLY the five {PARAMETERS} filled. The
   orchestrator never authors, edits, or editorializes the reviewer prompt, and
   never tells one reviewer what the other found.
   - Codex via the `codex` MCP tool.
   - Gemini via the `gemini-cli` MCP tool — RUN ONLY IF the per-session
     reachability probe passed (the gemini-cli MCP tools are allowlisted and
     invokable this session; gemini needs sandbox=false). If the probe did NOT
     pass — e.g. an unattended don't-ask-mode session where `mcp__gemini-cli__*`
     is not allowlisted — run Codex-only this pass and FLAG in the gate evidence
     that the Gemini half is owed on Stuart's return. Never substitute the
     orchestrator's own read for the missing reviewer.
2. Each reviewer's raw output is captured VERBATIM into the gate evidence file
   under the gate's section — no summarizing, no softening, both panes side by
   side — committed, and the combined verdict reported to Stuart.
3. Verdict combination:
   - **CLOSE + CLOSE** → review-clean (necessary, not sufficient — Stuart still closes).
   - **Any HOLD** (one or both) → blocks presentation→close. Apply dispositions
     immediately ONLY for unambiguous fixes (a clear defect with one correct fix,
     no judgment); record the fix and re-verify. Anything requiring a ruling
     (scope, contract shape, a design trade-off) STAYS OPEN for Stuart — flagged,
     never silently chosen.
   - **SPLIT** (one CLOSE, one HOLD) → record BOTH raw outputs, take NO tiebreak,
     do NOT adjudicate toward either; the gate WAITS for Stuart.
   - Codex-only pass (Gemini probe failed): treat the single Codex verdict as the
     gate's verdict for blocking, with the owed-Gemini flag standing; not
     "review-clean" in the dual sense until Stuart runs Gemini or waives it.
4. Stuart still closes every gate — a CLOSE from either or both is necessary, never sufficient.
5. If a reviewer tool FAILS or TIMES OUT (as opposed to being deliberately
   unavailable per the probe in step 1): STOP and tell Stuart. Never substitute an
   orchestrator self-review for an independent review.

## Parameters

| Parameter | Fill with |
|---|---|
| `{GATE_ID}` | Gate identifier, e.g. `D3` or `L2` |
| `{COMMIT_RANGE}` | Exact range, e.g. `abc1234^..def5678` — resolved SHAs, never `HEAD` |
| `{GATE_SCOPE}` | The gate's scope line from the handoff gate ledger, verbatim |
| `{CLAIMED_NUMBERS}` | Every number the presentation claims: test counts, lint/type/dependency-check results, golden-diff status, file/LOC counts |
| `{FLAGGED_CALLS}` | Every judgment call flagged for or ruled by Stuart this gate, with its recorded disposition |

## Template (pass verbatim, parameters filled)

```
You are the independent adversarial reviewer for gate {GATE_ID} of the build
campaign in this repository. Your review is evidence for a gate-close decision
made by a human. He relies on you to find what the build agents missed or
misrepresented. Do not extend trust to any claim you can check yourself.

SCOPE OF REVIEW
- Review the commit range {COMMIT_RANGE} ONLY. Never review or credit the
  working tree: uncommitted state is out of scope, and any gate claim that
  depends on uncommitted state is itself a finding.
- Gate scope (verbatim from the campaign ledger): {GATE_SCOPE}
- Any change in the range not traceable to this scope is scope creep —
  report it, severity by blast radius.

VERIFY, DON'T TRUST
- Claimed numbers for this gate: {CLAIMED_NUMBERS}
- Re-derive every claimed number yourself: run the proof script(s), the full
  test suite, the linters, the strict typecheck, the dependency check, and
  (if web surfaces are touched) the web build + tests, from a checkout of the
  range head. Report any divergence between your numbers and the claims,
  however small.
- A run that skips environment-gated tests (e.g. DB-marked) is NOT valid
  verification of a claimed total. If your environment cannot run them, say so
  explicitly and mark the count UNVERIFIED — do not approximate with a skip run.
- Hunt the unenforced-claim class: any claim in evidence docs, test docstrings,
  commit messages, or comments that no committed mechanism actually enforces
  (e.g. "covers every route" with no completeness guard). A true-but-unenforced
  claim is a finding.

RULINGS AND FLAGGED CALLS
- Flagged judgment calls and Stuart's rulings for this gate: {FLAGGED_CALLS}
- Verify each ruling is RECORDED in the evidence (not silently applied) and that
  the code in the range matches the recorded ruling. A ruling applied but
  unrecorded, or recorded but unapplied, is a finding.

OUTPUT FORMAT
- Ranked findings, each tagged BLOCKER / MAJOR / MINOR / NOTE, each with
  file:line and a reproduction command or the exact evidence trail.
- End with a single verdict line: VERDICT: CLOSE or VERDICT: HOLD, with a
  one-paragraph justification. HOLD if any BLOCKER exists or any MAJOR lacks a
  credible disposition path.
```
