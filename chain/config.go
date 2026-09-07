package chain

import (
    "errors"
    "math/big"
    "strings"
)

const (
    Name       = "CKCchain"
    Symbol     = "CKA"
    Decimals   = 18
    ChainID    int64 = 8898
    NetworkID  int64 = 8898
    BlockTime  int64 = 2
    MaxSupply  = "500000000000000000000000000"
    GenesisRecipient = "0xb87ee251CF89CBCF9a0b758a8C4d8b259629dA06"
)

func Validate() error {
    if ChainID <= 0 || NetworkID <= 0 { return errors.New("chain/network id must be positive") }
    if !strings.HasPrefix(GenesisRecipient, "0x") || len(GenesisRecipient) != 42 { return errors.New("invalid genesis recipient") }
    cap := new(big.Int)
    if _, ok := cap.SetString(MaxSupply, 10); !ok || cap.Sign() <= 0 { return errors.New("invalid max supply") }
    return nil
}
