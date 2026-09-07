# CKCchain Mainnet Runbook

## Protocol

- Chain name: CKCchain
- Native coin: CKA
- EVM compatible: yes
- Chain ID: 8898
- Network ID: 8898
- Target block time: 2 seconds
- Fixed supply: 500,000,000 CKA
- Inflation: disabled
- Genesis allocation: 0xb87ee251CF89CBCF9a0b758a8C4d8b259629dA06

## Mainnet gates

1. Build and audit the node implementation.
2. Generate validator identities on isolated machines.
3. Establish the initial validator set and bootnodes.
4. Produce one canonical genesis artifact.
5. SHA-256 verify the genesis artifact on every validator.
6. Bring up validators on private networking and perform consensus/finality tests.
7. Expose hardened public RPC nodes separately from validators.
8. Deploy explorer indexing and public website.
9. Run wallet transaction, contract deployment and reorg/finality smoke tests.
10. Publish the final genesis hash and RPC endpoints.

Never place validator private keys, seed phrases, cloud credentials or RPC signing keys in this repository.
