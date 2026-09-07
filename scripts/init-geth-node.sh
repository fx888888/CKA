#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENESIS="${1:-$ROOT/genesis/mainnet.json}"
DATADIR="${2:-$ROOT/.local/node}"
IMAGE="ethereum/client-go:v1.13.15"

if [[ ! -f "$GENESIS" ]]; then
  echo "Missing genesis: $GENESIS" >&2
  echo "Build it first with CKC_VALIDATOR_ADDRESS=0x... ./scripts/build-genesis.sh" >&2
  exit 1
fi

mkdir -p "$DATADIR"

echo "Initializing CKCchain datadir: $DATADIR"
docker run --rm \
  -v "$DATADIR:/root/.ethereum" \
  -v "$GENESIS:/root/genesis.json:ro" \
  "$IMAGE" init /root/genesis.json

echo "Genesis initialization complete."
