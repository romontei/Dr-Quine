#include<stdio.h>

char	*sourceCode()
{
	return "#include<stdio.h>%2$c%2$cchar%3$c*sourceCode()%2$c{%2$c%3$creturn %4$c%1$s%4$c;%2$c}%2$c%2$cint%3$cmain()%2$c{%2$c%3$cchar *code = sourceCode();%2$c%3$cprintf(code,10,9,34);%2$c}%2$c";
}

int	main()
{
	char *code = sourceCode();
	printf(code,10,9,34);
}
