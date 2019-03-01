NAME = Colleen

SRC = Colleen.s
OBJ = $(SRC:.s=.o)

NASM = /Users/romontei/.brew/bin/nasm
FORM = -f macho64


all: $(NAME)

%.o: %.s
	$(NASM) $(FORM) -o $@ $<

$(NAME): $(OBJ)
	ld Colleen.o -macosx_version_min 10.11 -lSystem -o Colleen

clean:
	rm -f $(OBJ)

fclean:
	rm -f $(NAME) $(OBJ)

re: fclean all

.PHONY: all clean fclean re
