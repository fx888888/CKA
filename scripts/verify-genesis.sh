#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-genesis/chain.json}"
EXPECTED="${EXPECTED_GENESIS_SHA256:-}"

if [[ ! -f "$FILE" ]]; then echo "missing genesis file: $FILE" >&2; exit 1; fi
ACTUAL="$(sha256sum "$FILE" | awk '{print $1}')"
echo "genesis_sha256=$ACTUAL"
if [[ -n "$EXPECTED" && "$ACTUAL" != "$EXPECTED" ]]; then
  echo "genesis hash mismatch" >&2
  exit 2
fi
