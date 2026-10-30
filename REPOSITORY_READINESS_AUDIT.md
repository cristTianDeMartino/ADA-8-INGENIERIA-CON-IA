# Repository Readiness Audit

## BEFORE

| Dimension | Score 0-5 | Weighted | Evidence | Main Gap |
|---|---:|---:|---|---|
| Entry Point & Navigation | 2 | 6.0/15 | README contains 226 lines of course history. No REPO_MAP exists. Finding entry points requires manual traversal. | Lack of a concise repository map pointing directly to entry points and boundaries. |
| Agent Instructions | 2 | 6.0/15 | AGENTS.md has 24 lines. It lacks standardized command blocks, stop conditions, and tool adaptors. | Incomplete operational contract missing standardized command blocks and stop conditions. |
| Build / Run / Test | 2 | 6.0/15 | Pytest passes in the active environment, but no requirements.txt, lint command, or build script exists. | Absence of a reproducible verification script and explicit linting target. |
| Architecture Boundaries | 3 | 6.0/10 | ARCHITECTURE.md explains layers, but does not declare forbidden edit paths or enforce boundary rules. | Descriptive architecture without explicit protected paths or deterministic boundary checks. |
| Requirements & Traceability | 4 | 8.0/10 | Structured requirement IDs exist across REQUIREMENTS.md, SPEC.md, and docs/traceability.md. | No automated script checks whether requirement references in specs match declared requirement IDs. |
| Automation & Guardrails | 1 | 2.0/10 | No verification script, no git hook, and no CI pipeline exist. Rules depend on developer memory. | Absence of deterministic executable guardrails and automated CI validation. |
| Testability & Evidence | 3 | 9.0/15 | 42 pytest tests pass, but no unified runner records validation evidence or checks repository structure. | Manual test output without a single command producing evidence of repository compliance. |
| Safety & Permissions | 2 | 4.0/10 | Basic .gitignore exists, but no protected path declarations or stop conditions for destructive actions exist. | Lack of explicit protected path declarations and automated checks against sensitive file changes. |

TOTAL BEFORE: 47 / 100

Top 3 friction points:
1. Absence of a single reproducible verification script and automated CI workflow.
2. Incomplete operational instructions in AGENTS.md and absence of REPO_MAP.md.
3. Reliance on natural language text for rules instead of deterministic guardrail checks.

## Changes Made

### Improvement I-01
- Category: Context
- Problem: Operational instructions and standard commands were missing or scattered.
- Change: Structured `AGENTS.md` with Read First order, Sources of Truth, Standard Commands, Change Rules, Stop Conditions, and Definition of Done.
- Evidence: `check_repo_contract.py` validates required sections in `AGENTS.md`.

### Improvement I-02
- Category: Navigation
- Problem: The agent had to scan directories manually to discover entry points and tests.
- Change: Created `docs/REPO_MAP.md` mapping entry points, test targets, a step-by-step Change Guide, and protected paths.
- Evidence: The agent located `service.py` and `cli.py` immediately during the AFTER run without directory exploration.

### Improvement I-03
- Category: Executable Knowledge
- Problem: Validation was fragmented; test execution relied on ambient state without documented syntax or contract checks.
- Change: Added `scripts/verify_repo.sh` combining tests, compile checks, and repository contract enforcement.
- Evidence: Single command `./scripts/verify_repo.sh` exits with 0 and prints `VERIFY_REPO: PASS`.

### Improvement I-04
- Category: Guardrail
- Problem: Rules against editing datasets or committing secrets existed only as natural language text.
- Change: Implemented `scripts/check_repo_contract.py` to deterministically block missing files, sensitive files, invalid JSON fixtures, and undocumented specs.
- Evidence: Script fails with exit code 1 if forbidden files appear or required sections are missing.

### Improvement I-05
- Category: CI Check
- Problem: No automated continuous integration verified changes independently outside the local terminal.
- Change: Created `.github/workflows/verify.yml` executing `./scripts/verify_repo.sh` on push and pull request.
- Evidence: CI uses the exact same verification contract shared by human developers and agents.

### Improvement I-06
- Category: Human Gate & Tool Adaptor
- Problem: Tool adaptors often duplicate requirements, creating synchronization drifts.
- Change: Created `GEMINI.md` pointing exclusively to `AGENTS.md` and `docs/REPO_MAP.md`, accompanied by explicit stop conditions requiring human approval for architectural modifications or deletions.
- Evidence: `GEMINI.md` contains 11 lines and delegates all rules to `AGENTS.md`.

## AFTER

| Dimension | Score 0-5 | Weighted | Evidence | Improvement |
|---|---:|---:|---|---|
| Entry Point & Navigation | 5 | 15.0/15 | `docs/REPO_MAP.md` details entry points, test files, Change Guide, and protected paths. | +3 (+9.0 pts) |
| Agent Instructions | 5 | 15.0/15 | `AGENTS.md` provides explicit Read First sequence, Sources of Truth, commands, stop conditions, and DoD. | +3 (+9.0 pts) |
| Build / Run / Test | 5 | 15.0/15 | Unified `./scripts/verify_repo.sh` executes tests, syntax compilation, and contract validation. `requirements.txt` tracks dependencies. | +3 (+9.0 pts) |
| Architecture Boundaries | 4 | 8.0/10 | `docs/REPO_MAP.md` outlines layer boundaries and protected paths. Stop conditions block unauthorized boundary shifts. | +1 (+2.0 pts) |
| Requirements & Traceability | 5 | 10.0/10 | `SPEC.md` requirement IDs (`FR-*`, `AC-*`) are validated deterministically by `scripts/check_repo_contract.py`. | +1 (+2.0 pts) |
| Automation & Guardrails | 5 | 10.0/10 | `scripts/check_repo_contract.py`, `scripts/verify_repo.sh`, and `.github/workflows/verify.yml` enforce guardrails in code. | +4 (+8.0 pts) |
| Testability & Evidence | 5 | 15.0/15 | 44 tests pass in 0.04s, and `./scripts/verify_repo.sh` generates clear, repeatable PASS/FAIL verification evidence. | +2 (+6.0 pts) |
| Safety & Permissions | 4 | 8.0/10 | Stop conditions are defined in `AGENTS.md`, sensitive file patterns are checked deterministically, and test fixtures are guarded. | +2 (+4.0 pts) |

TOTAL AFTER: 96 / 100
DELTA: AFTER - BEFORE = +49 points

