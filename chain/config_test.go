package chain

import "testing"

func TestProtocolConstants(t *testing.T) {
    if err := Validate(); err != nil { t.Fatal(err) }
    if Name != "CKCchain" || Symbol != "CKA" { t.Fatal("unexpected chain identity") }
    if ChainID != 8898 || NetworkID != 8898 { t.Fatal("unexpected network identifiers") }
    if MaxSupply != "500000000000000000000000000" { t.Fatal("unexpected fixed supply") }
    if GenesisRecipient != "0xb87ee251CF89CBCF9a0b758a8C4d8b259629dA06" { t.Fatal("unexpected genesis recipient") }
}
