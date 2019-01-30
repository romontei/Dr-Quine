#include<stdio.h>

char	*sourceCode()
{
	return "#include<stdio.h>%c%cchar%c*sourceCode()%c{%c%creturn %c%s%c;%c}%c%cint%cmain()%c{%c%cchar *code = sourceCode();%c%cprintf(code,10,10,9,10,10,9,34,code,34,10,10,10,9,10,10,9,10,9,10,10);%c}%c";
}

int	main()
{
	char *code = sourceCode();
	printf(code,10,10,9,10,10,9,34,code,34,10,10,10,9,10,10,9,10,9,10,10);
}
