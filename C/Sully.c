#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define PROG_STR "#include <stdio.h>%c#include <string.h>%c#include <stdlib.h>%c%c#define PROG_STR %c%s%c%c%cint main(void)%c{%c	int i = %d;%c	if (strchr(__FILE__, '_'))%c		i--;%c	if (i >= 0)%c	{%c		FILE *fd;%c%c		char prog_name[12];%c		sprintf(prog_name, %cSully_%cd.c%c, i);%c%c		fd = fopen(prog_name, %cw+%c);%c		if (!fd) { exit(-1); }%c		fprintf(fd, PROG_STR, 10, 10, 10, 10, 34, PROG_STR, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 34, 37, 37, 37, 34, 10, 10, 10, 10, 10);%c		fclose(fd);%c%c		char cmd[100];%c		sprintf(cmd, %cclang -Wall -Werror -Wextra -o Sully_%cd Sully_%cd.c && ./Sully_%cd%c, i, i, i);%c		system(cmd);%c	}%c	return (0);%c}%c"

int main(void)
{
	int i = 5;
	if (strchr(__FILE__, '_'))
		i--;
	if (i >= 0)
	{
		FILE *fd;

		char prog_name[12];
		sprintf(prog_name, "Sully_%d.c", i);

		fd = fopen(prog_name, "w+");
		if (!fd) { exit(-1); }
		fprintf(fd, PROG_STR, 10, 10, 10, 10, 34, PROG_STR, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 10, 10, 34, 37, 34, 10, 10, 34, 34, 10, 10, 10, 10, 10, 10, 34, 37, 37, 37, 34, 10, 10, 10, 10, 10);
		fclose(fd);

		char cmd[100];
		sprintf(cmd, "clang -Wall -Werror -Wextra -o Sully_%d Sully_%d.c && ./Sully_%d", i, i, i);
		system(cmd);
	}
	return (0);
}
