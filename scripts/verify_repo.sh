#!/usr/bin/env bash
set -euo pipefail

echo "[1/3] Running tests"
pytest -q

echo "[2/3] Checking syntax and compilation"
python3 -m compileall -q src tests

echo "[3/3] Checking repository contract"
python3 scripts/check_repo_contract.py

echo "VERIFY_REPO: PASS"
