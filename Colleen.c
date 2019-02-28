#include<stdio.h>

char	*sourceCode()
{
	return "#include<stdio.h>%1$c%1$cchar%2$c*sourceCode()%1$c{%1$c%2$creturn %3$c%4$s%3$c;%1$c}%1$c%1$cint%2$cmain()%1$c{%1$c%2$cchar *code = sourceCode();%1$c%2$cprintf(code,10,9,34);%1$c}%1$c";
}

int	main()
{
	char *code = sourceCode();
	printf(code,10,9,34,code);
}
