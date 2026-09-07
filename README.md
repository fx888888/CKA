# CKCchain (CKA)

Independent EVM-compatible Layer-1 blockchain.

- Chain: CKCchain
- Native coin: CKA
- Fixed maximum supply: 500,000,000 CKA
- Consensus: fast BFT/PoSA-style validator set
- EVM compatible: MetaMask, OKX Wallet, Solidity, Hardhat and Remix
- Genesis allocation: controlled by the project genesis configuration

## Repository status

This repository is the mainnet engineering workspace. It contains the network specification, genesis templates, node configuration, deployment automation, explorer/web/faucet integration points, contracts, documentation and CI scaffolding.

A GitHub repository alone does not make a blockchain live. A production mainnet requires provisioned validator servers, generated validator keys, bootnodes, public RPC infrastructure, DNS/TLS, monitoring and an agreed genesis block. Never commit validator private keys or seed phrases.

## Planned layout

- `chain/` node and chain configuration
- `genesis/` deterministic genesis templates and supply allocation
- `contracts/` canonical Solidity contracts
- `infra/` Docker/systemd/production deployment files
- `explorer/` block-explorer deployment configuration
- `web/` official wallet/RPC landing site
- `faucet/` test-network faucet service
- `docs/` protocol and operator documentation
- `.github/` CI and security checks

## Genesis allocation

The initial recipient supplied for the project is:

`0xb87ee251CF89CBCF9a0b758a8C4d8b259629dA06`

This address is public. Private keys must remain offline and outside GitHub.

## Development

The repository will provide a reproducible local multi-validator network before production launch. Production deployment is gated by genesis verification, validator-key generation, peer configuration, RPC hardening, explorer indexing and smoke tests.
