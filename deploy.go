package main

import (
	"encoding/json"
	"fmt"
	"log"
)

// loc maps from location in this directory to default location in the system.
var loc = map[string]string{}

func main() {
	loc["test"] = "out"
	out, err := json.Marshal(loc)
	if err != nil {
		log.Fatalf("Error marshalling json: %s", err)
	}
	fmt.Println(string(out))
}
