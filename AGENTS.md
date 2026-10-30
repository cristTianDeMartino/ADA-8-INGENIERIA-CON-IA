# AGENTS.md

## Read First
1. `REQUIREMENTS.md`
2. `SPEC.md`
3. `ARCHITECTURE.md`
4. `TASKS.md`
5. `docs/REPO_MAP.md`

## Sources of Truth
- System requirements live in `REQUIREMENTS.md`.
- Verifiable behavior specifications live in `SPEC.md`.
- Architectural design boundaries live in `ARCHITECTURE.md`.
- Never modify requirements or specs to make a failing test pass.

## Repository Map
- `src/`: Application source code and CLI entrypoints.
- `tests/`: Automated unit and integration test suites.
- `docs/`: Architecture documentation and repository map.
- `scripts/`: Deterministic checks and verification runners.
- `results/`: Evidence logs, experiment records, and audit reports.

## Standard Commands
- Install: `pip install -r requirements.txt`
- Run: `python3 -m src.customer_search.cli "query"`
- Test: `pytest -q`
- Lint: `python3 -m compileall -q src tests`
- Verify: `./scripts/verify_repo.sh`

## Change Rules
- Scope changes to the specific task requested.
- Maintain existing tests; never weaken assertions.
- Do not add new dependencies without explicit human approval.
- Do not edit files listed in `docs/REPO_MAP.md` under protected paths (`data/customers.json`).

## Stop Conditions
Stop and ask for human input when:
- Requirements or specifications conflict.
- A destructive file modification or deletion is requested.
- An architectural layer boundary must change.
- A required test dependency or external service is unavailable.

## Definition of Done
A task is done only when:
- All items in `TASK_UNDER_TEST.md` or the active task specification are implemented.
- New unit and integration tests cover the added behavior.
- `./scripts/verify_repo.sh` exits with code 0 (`VERIFY_REPO: PASS`).
- Modified files, executed commands, and test evidence are recorded in the report.
