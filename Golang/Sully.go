package main

import (
	"fmt"
	"os"
	"strings"
	"runtime"
)

var prog = `package main

import (
	"fmt"
	"os"
	"strings"
	"runtime"
)

var prog = %c%s%c

func main() {
	i := %d;
	_, fileName, _, _ := runtime.Caller(1)
	if (strings.Contains(fileName, "_")) {
		i--;
	}

	if (i >= 0) {
		var prog_name string
		fmt.Sprintf(prog_name, "Sully_%d.go", i)

		sully, err := os.Create(prog_name)
		if err != nil {
			fmt.Println("Unable to create file:", err)
			os.Exit(1)
		}
		fmt.Fprintf(sully, prog, 0x60, prog, 0x60, i, i, i, i, i)
//		fmt.Printf(prog, 0x60, prog, 0x60, i, i, i, i, i)
		defer sully.Close()

		var cmd string
		fmt.Sprintf(cmd, "go build -o Sully_%d Sully_%d.c && ./Sully_%d", i, i, i)
		exec.Command(cmd)
	}
}

`

func main() {
	i := 5;
	_, fileName, _, _ := runtime.Caller(1)
	if (strings.Contains(fileName, "_")) {
		i--;
	}

	if (i >= 0) {
		var prog_name string
		fmt.Sprintf(prog_name, "Sully_%d.go", i)

		sully, err := os.Create(prog_name)
		if err != nil {
			fmt.Println("Unable to create file:", err)
			os.Exit(1)
		}
		fmt.Fprintf(sully, prog, 0x60, prog, 0x60, i, i, i, i, i)
//		fmt.Printf(prog, 0x60, prog, 0x60, i, i, i, i, i)
		defer sully.Close()

		var cmd string
		fmt.Sprintf(cmd, "go build -o Sully_%d Sully_%d.c && ./Sully_%d", i, i, i)
		exec.Command(cmd)
	}
}

