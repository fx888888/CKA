#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$ROOT/genesis/genesis.template.json"
OUT="${1:-$ROOT/genesis/mainnet.json}"
VALIDATOR="${CKC_VALIDATOR_ADDRESS:-}"

if [[ -z "$VALIDATOR" ]]; then
  echo "CKC_VALIDATOR_ADDRESS is required" >&2
  echo "Example: CKC_VALIDATOR_ADDRESS=0xYourValidatorAddress $0" >&2
  exit 1
fi

VALIDATOR="${VALIDATOR#0x}"
VALIDATOR="${VALIDATOR#0X}"
if [[ ! "$VALIDATOR" =~ ^[0-9a-fA-F]{40}$ ]]; then
  echo "validator address must contain exactly 40 hexadecimal characters" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUT")"

# Clique extraData = 32-byte vanity + sorted signer addresses + 65-byte zero seal.
EXTRA="$(python3 - "$VALIDATOR" <<'PY'
import sys
v=sys.argv[1].lower()
print("0x" + ("00"*32) + v + ("00"*65))
PY
)"

python3 - "$TEMPLATE" "$OUT" "$EXTRA" <<'PY'
import json, pathlib, sys
src, dst, extra = sys.argv[1:]
data=json.loads(pathlib.Path(src).read_text())
data["extraData"]=extra
pathlib.Path(dst).write_text(json.dumps(data, indent=2)+"\n")
PY

SHA256="$(sha256sum "$OUT" | awk '{print $1}')"
echo "Generated: $OUT"
echo "Validator: 0x$VALIDATOR"
echo "Genesis SHA-256: $SHA256"
