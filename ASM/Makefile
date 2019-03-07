NAME = Colleen Grace

SRC = Colleen.s Grace.s
OBJ = $(SRC:.s=.o)

NASM = /Users/romontei/.brew/bin/nasm
FORM = -f macho64

DEP = Grace_kid.s

all: $(NAME)

%.o: %.s
	$(NASM) $(FORM) -o $@ $<

$(NAME): $(OBJ)
	ld Colleen.o -macosx_version_min 10.11 -lSystem -o Colleen
	ld Grace.o -macosx_version_min 10.11 -lSystem -o Grace

clean:
	rm -f $(OBJ)

fclean:
	rm -f $(NAME) $(OBJ) $(DEP)

re: fclean all

.PHONY: all clean fclean re
