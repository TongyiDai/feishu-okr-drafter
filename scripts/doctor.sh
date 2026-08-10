#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v lark-cli >/dev/null 2>&1; then
  echo "blocked: lark-cli is not installed or not on PATH" >&2
  exit 1
fi

lark-cli --help >/dev/null
test -f "$repo_dir/SKILL.md"
test -f "$repo_dir/references/runtime.md"
test -f "$repo_dir/references/feishu-okr-operations.md"

if ! lark-cli auth status --json --verify 2>/dev/null | python3 -c '
import json
import sys

payload = json.load(sys.stdin)
identity = payload.get("identity")
verified = payload.get("verified")
if identity != "user" or verified is not True:
    print(f"blocked: identity={identity!r}, verified={verified!r}", file=sys.stderr)
    raise SystemExit(1)
print("ok: lark-cli is available and verified for user identity")
'; then
  echo "blocked: Lark user verification failed" >&2
  exit 1
fi
