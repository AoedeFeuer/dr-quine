package main

import (
	"fmt"
	"os"
)

var prog = `package main

import (
	"fmt"
	"os"
)

var prog = %c%s%c

var name = "Grace_kid.go"

/*
	The program consists of two identical parts, once as plain code and once quoted in some way.
*/

func main() {
	grace, err := os.Create(name)
	if err != nil {
		fmt.Println("Unable to create file:", err)
		os.Exit(1)
	}
	fmt.Fprintf(grace, prog, 0x60, prog, 0x60)
//	fmt.Printf(prog, 0x60, prog, 0x60)
	defer grace.Close()
}
`

var name = "Grace_kid.go"

/*
	The program consists of two identical parts, once as plain code and once quoted in some way.
*/

func main() {
	grace, err := os.Create(name)
	if err != nil {
		fmt.Println("Unable to create file:", err)
		os.Exit(1)
	}
	fmt.Fprintf(grace, prog, 0x60, prog, 0x60)
//	fmt.Printf(prog, 0x60, prog, 0x60)
	defer grace.Close()
}
