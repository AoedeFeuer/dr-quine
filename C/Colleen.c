#include <stdio.h>

/*
	Quine is a self-replicating program.
*/

void	show()
{
	char colleen[] = "#include <stdio.h>%c%c/*%c	Quine is a self-replicating program.%c*/%c%cvoid	show()%c{%c	char colleen[] = %c%s%c;%c	printf(colleen, 10, 10, 10, 10, 10, 10, 10, 10, 34, colleen, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint		main()%c{%c	show();%c	return(0);%c/*%c	Its output is a copy of source code.%c*/%c}%c";
	printf(colleen, 10, 10, 10, 10, 10, 10, 10, 10, 34, colleen, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int		main()
{
	show();
	return(0);
/*
	Its output is a copy of source code.
*/
}
