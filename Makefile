NAME = Colleen

SRC = Colleen.c
OBJ = $(SRC:.c=.o)
FLG = -Wall -Wextra -Werror

%.o: %.c gcc -o $@ -c $< $(FLG)

all: $(NAME)

$(NAME): $(OBJ)
	gcc $(FLG) -o Colleen Colleen.o

clean:
	rm -f $(OBJ)

fclean:
	rm -f $(NAME) $(OBJ)

re: fclean all

.PHONY: all clean fclean re
