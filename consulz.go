package gimmekey

import (
    "fmt"
    "github.com/hashicorp/consul/api"
)

func getkey() {
    client, _ := api.NewClient(api.DefaultConfig())
    kv := client.KV()
    pair, _, err := kv.Get("foo", nil)
    if err != nil {
        panic(err)
    }
    s := string(pair.Value[:])
    fmt.Printf("%v", s)
}
