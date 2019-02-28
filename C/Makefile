NAME = Colleen Grace

SRC = Colleen.c Grace.c
OBJ = $(SRC:.c=.o)
FLG = -Wall -Wextra -Werror

DEP = Grace_kid.c

%.o: %.c gcc -o $@ -c $< $(FLG)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(FLG) -o Colleen Colleen.o
	gcc $(FLG) -o Grace Grace.o

clean:
	rm -f $(OBJ)

fclean:
	rm -f $(NAME) $(OBJ) $(DEP)

re: fclean all

.PHONY: all clean fclean re
