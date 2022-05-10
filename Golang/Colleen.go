package main

import (
	"fmt"
)
/*
	Quine is a self-replicating program.
*/

func show() {
	quine := `
package main

import (
	"fmt"
)
/*
	Quine is a self-replicating program.
*/

func show() {
	quine := %s
	fmt.Printf(quine, "%c"+quine+"%c", 0x60, 0x60)
}

func main() {
/*
	Its output is a copy of source code.
*/
	show()
}

`
	fmt.Printf(quine, "`"+quine+"`", 0x60, 0x60)
}

func main() {
/*
	Its output is a copy of source code.
*/
	show()
}
