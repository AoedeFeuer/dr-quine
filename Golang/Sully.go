package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"runtime"
)

var prog = `package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"runtime"
)

var prog = %c%s%c

func main() {
	i := %d;
	_, fileName, _, _ := runtime.Caller(0)
	if (strings.Contains(fileName, "Sully_")) {
		i--;
	}

	if (i >= 0) {
		sully, err := os.Create(fmt.Sprintf("Sully_%%d.go", i))
		if err != nil {
			fmt.Println("Unable to create file:", err)
			os.Exit(1)
		}
		fmt.Fprintf(sully, prog, 0x60, prog, 0x60, i)
		defer sully.Close()

		cmd := exec.Command("go", "build", fmt.Sprintf("Sully_%%d.go", i))
		cmd.Run()
		cmdo := exec.Command(fmt.Sprintf("./Sully_%%d", i))
		cmdo.Run()
	}
}

`

func main() {
	i := 5;
	_, fileName, _, _ := runtime.Caller(0)
	if (strings.Contains(fileName, "Sully_")) {
		i--;
	}

	if (i >= 0) {
		sully, err := os.Create(fmt.Sprintf("Sully_%d.go", i))
		if err != nil {
			fmt.Println("Unable to create file:", err)
			os.Exit(1)
		}
		fmt.Fprintf(sully, prog, 0x60, prog, 0x60, i)
		defer sully.Close()

		cmd := exec.Command("go", "build", fmt.Sprintf("Sully_%d.go", i))
		cmd.Run()
		cmdo := exec.Command(fmt.Sprintf("./Sully_%d", i))
		cmdo.Run()
	}
}

