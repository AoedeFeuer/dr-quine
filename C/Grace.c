#include <stdio.h>

#define PROG_STR "#include <stdio.h>%c%c#define PROG_STR %c%s%c%c#define PROGRAM_NAME %cGrace_kid.c%c%c#define GRACE() int main(void) {FILE *fd; fd = fopen(PROGRAM_NAME, %cw+%c); if (!fd) {return (-1);} fprintf(fd, PROG_STR, 10, 10, 34, PROG_STR, 34, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10); fclose(fd); return (0);}%c%c/*%c	The program consists of two identical parts, once as plain code and once quoted in some way.%c*/%c%cGRACE()%c"
#define PROGRAM_NAME "Grace_kid.c"
#define GRACE() int main(void) {FILE *fd; fd = fopen(PROGRAM_NAME, "w+"); if (!fd) {return (-1);} fprintf(fd, PROG_STR, 10, 10, 34, PROG_STR, 34, 10, 34, 34, 10, 34, 34, 10, 10, 10, 10, 10, 10, 10); fclose(fd); return (0);}

/*
	The program consists of two identical parts, once as plain code and once quoted in some way.
*/

GRACE()
