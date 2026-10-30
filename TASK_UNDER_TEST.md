# Task Under Test

Change ID: CR-01

## Goal
Add an active customer status filter to the search capability. The `CustomerSearchService.search` method must accept an optional `active_only: bool = False` argument. When `active_only` is true, the search result must contain only customers where `is_active` is true. The CLI in `src/customer_search/cli.py` must support an optional `--active-only` flag that forwards this setting to the service. The default behavior must remain unchanged when the parameter or flag is omitted.

## Requirements Covered
- FR-01
- FR-02
- FR-03
- FR-05
- AC-01
- AC-02
- AC-03
- AC-05

## Verification
1. Service tests in `tests/test_service.py` verify that `active_only=True` returns only customers with `is_active=True`.
2. Service tests verify that default calls (`active_only=False`) return active and inactive customers matching the query.
3. CLI tests in `tests/test_cli.py` verify `--active-only` filters CLI results, and `--json` reflects filtered records.
4. All existing tests pass without regressions (`pytest`).

## Constraints
- Use REQUIREMENTS.md and SPEC.md as the source of truth.
- Keep changes scoped to this task.
- Do not redefine requirements in this file.
