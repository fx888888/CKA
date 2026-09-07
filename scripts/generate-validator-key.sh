#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-validator-secret}"
mkdir -p "$(dirname "$OUT")" 2>/dev/null || true

if ! command -v openssl >/dev/null 2>&1; then echo "openssl is required" >&2; exit 1; fi
umask 077
openssl rand -hex 32 > "$OUT.key"
echo "validator secret written to $OUT.key"
echo "KEEP THIS FILE OFFLINE. NEVER COMMIT IT TO GITHUB."
