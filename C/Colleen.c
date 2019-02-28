#include<stdio.h>

/*
  Function that returns the source code
*/
char	*sourceCode()
{
	return "#include<stdio.h>%1$c%1$c/*%1$c  Function that returns the source code%1$c*/%1$cchar%2$c*sourceCode()%1$c{%1$c%2$creturn %3$c%4$s%3$c;%1$c}%1$c%1$cint%2$cmain()%1$c{%1$c%2$c/*%1$c%2$c  Stores source code then print it%1$c%2$c*/%1$c%2$cchar *code = sourceCode();%1$c%2$cprintf(code,10,9,34,code);%1$c}%1$c";
}

int	main()
{
	/*
	  Stores source code then print it
	*/
	char *code = sourceCode();
	printf(code,10,9,34,code);
}
