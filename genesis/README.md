# Genesis

`chain.json` is the human-readable protocol specification used to generate the final chain genesis.

Before mainnet:

1. Finalize the EVM `chainId` and P2P/network identifier.
2. Generate validator keys on secure machines.
3. Record validator public identities and bootnodes.
4. Generate the deterministic genesis file from the finalized inputs.
5. Hash the genesis file and independently verify the hash on every validator.
6. Fund the configured genesis allocation without exceeding 500,000,000 CKA.
7. Start validators from the exact same genesis hash.

The 500M CKA cap is fixed. No minting path should be able to create CKA beyond the genesis allocation/reserve.
