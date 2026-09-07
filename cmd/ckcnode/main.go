package main

import (
    "flag"
    "fmt"
    "log"
    "os"

    "github.com/fx888888/CKA/chain"
)

func main() {
    config := flag.String("config", "infra/node.toml", "node configuration path")
    flag.Parse()
    if err := chain.Validate(); err != nil { log.Fatal(err) }
    fmt.Printf("CKCchain node bootstrap\nconfig=%s\nchain=%s\nsymbol=%s\nchainId=%d\nnetworkId=%d\nblockTime=%ds\nmaxSupply=%s\ngenesis=%s\n", *config, chain.Name, chain.Symbol, chain.ChainID, chain.NetworkID, chain.BlockTime, chain.MaxSupply, chain.GenesisRecipient)
    if _, err := os.Stat(*config); err != nil { log.Fatalf("config: %v", err) }
}
