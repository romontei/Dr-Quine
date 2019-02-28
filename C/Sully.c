#include<stdio.h>
#include<stdlib.h>

#define OPEN(name) fopen(name, "w+")
#define WRTE(file, code, index) fprintf(file,code,10,9,34,code,index);

int main()
{
	int cpt = 5;
	char name[100];
	sprintf(name, "Sully_%d.c", cpt);
	char *code = "#include<stdio.h>%1$c#include<stdlib.h>%1$c%1$c#define OPEN(name) fopen(name, %3$cw+%3$c)%1$c#define WRTE(file, code, index) fprintf(file,code,10,9,34,code,index);%1$c%1$cint main()%1$c{%1$c%2$cint cpt = %5$d;%1$c%2$cchar name[100];%1$c%2$csprintf(name, %3$cSully_%%d.c%3$c, cpt);%1$c%2$cchar *code = %3$c%4$s%3$c;%1$c%1$c%2$cif (cpt >= 0)%1$c%2$c{%1$c%2$c%2$cFILE* file = OPEN(name);%1$c%2$c%2$cWRTE(file, code, cpt - 1);%1$c%2$c%2$cchar bin[100];%1$c%2$c%2$csprintf(bin, %3$cclang -Wall -Wextra -Werror %%1$s -o Sully_%%2$d ; ./Sully_%%2$d%3$c,name,cpt);%1$c%2$c%2$cfclose(file);%1$c%2$c%2$csystem(bin);%1$c%2$c%2$cFILE* real = OPEN(name);%1$c%2$c%2$cWRTE(real, code, cpt);%1$c%2$c}%1$c}%1$c";

	if (cpt >= 0)
	{
		FILE* file = OPEN(name);
		WRTE(file, code, cpt - 1);
		char bin[100];
		sprintf(bin, "clang -Wall -Wextra -Werror %1$s -o Sully_%2$d ; ./Sully_%2$d",name,cpt);
		fclose(file);
		system(bin);
		FILE* real = OPEN(name);
		WRTE(real, code, cpt);
	}
}
