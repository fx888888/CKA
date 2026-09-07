# CKCchain node implementation

## Current execution layer

CKCchain uses the EVM execution model and a Geth-compatible node for the first production engineering baseline. The repository pins the operational Docker client to `ethereum/client-go:v1.13.15` because later upstream Geth releases deprecated the standalone Clique sealing path.

The node provides standard EVM JSON-RPC/WebSocket interfaces, transaction pool handling, peer-to-peer networking and Solidity compatibility.

## Current validator baseline

The first runnable validator baseline is Clique-style PoA with a 2-second target block period. This is intentionally treated as an engineering bootstrap, not as the final CKCchain BFT/PoSA protocol.

Before public mainnet launch, the validator layer must be replaced or extended with the finalized CKCchain fast-BFT/PoSA rules, including:

- deterministic validator-set transitions;
- quorum/finality rules;
- validator admission/removal policy;
- double-sign/equivocation protection;
- validator reward accounting from the fixed 500,000,000 CKA allocation;
- recovery and restart behavior;
- adversarial network and reorg tests.

No validator private key belongs in this repository.

## Genesis

`genesis/genesis.template.json` is the human-readable template. Run `scripts/build-genesis.sh` with a real validator address to produce the canonical `genesis/mainnet.json` used by the Geth initializer.

The fixed initial CKA allocation is:

- `500,000,000 CKA`
- recipient: `0xb87ee251CF89CBCF9a0b758a8C4d8b259629dA06`

Clique itself does not mint a block subsidy, so the baseline does not increase native supply after genesis.

## Operator sequence

1. Generate validator key material on an offline or hardened host.
2. Record only the validator **public address** in deployment configuration.
3. Build `genesis/mainnet.json` with `scripts/build-genesis.sh`.
4. Hash and independently verify the genesis file.
5. Initialize every validator and RPC node with the exact same genesis.
6. Configure bootnodes and private validator networking.
7. Run multi-node finality, transaction, restart and RPC tests.
8. Only after those gates pass, publish the canonical genesis hash and public RPC endpoint.

Never commit `validator_password.txt`, key files, seed phrases or cloud credentials.
