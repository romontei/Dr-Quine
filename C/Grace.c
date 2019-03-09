#include<stdio.h>

#define OPEN fopen("Grace_kid.c", "w+")
#define WRTE(file, code) fprintf(file,code,10,9,34,code);
#define MAIN int main() { FILE* file = OPEN; if (file == NULL) { perror("Error opening file: "); return 1; } char *code = "#include<stdio.h>%1$c%1$c#define OPEN fopen(%3$cGrace_kid.c%3$c, %3$cw+%3$c)%1$c#define WRTE(file, code) fprintf(file,code,10,9,34,code);%1$c#define MAIN int main() { FILE* file = OPEN; if (file == NULL) { perror(%3$cError opening file: %3$c); return 1; } char *code = %3$c%4$s%3$c; WRTE(file, code); fclose(file);}%1$c%1$c/*%1$c  Call the define that lets the magic begin%1$c*/%1$cMAIN%1$c"; WRTE(file, code); fclose(file);}

/*
  Call the define that lets the magic begin
*/
MAIN
