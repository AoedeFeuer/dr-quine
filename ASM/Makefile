CC = clang
ASM = nasm -f macho64
CFLAGS = -Wall -Wextra -Werror

COLLEEN = Colleen
SRC_COLLEEN = Colleen.s
OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)

GRACE = Grace
SRC_GRACE = Grace.s
OBJ_GRACE = $(SRC_GRACE:.s=.o)

SULLY = Sully
SRC_SULLY = Sully.s
OBJ_SULLY = $(SRC_SULLY:.s=.o)

OBJ_DIR	= obj

OBJ_COLLEEN := $(addprefix $(OBJ_DIR)/, $(OBJ_COLLEEN))
OBJ_GRACE := $(addprefix $(OBJ_DIR)/, $(OBJ_GRACE))
OBJ_SULLY := $(addprefix $(OBJ_DIR)/, $(OBJ_SULLY))

SRC = $(SRC_COLLEEN) $(SRC_GRACE) $(SRC_SULLY)
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))
ALL = $(COLLEEN) $(GRACE) $(SULLY)

all: $(ALL)

$(COLLEEN): $(OBJ_COLLEEN)
	$(ASM) $(SRC_COLLEEN) -o $@
	$(CC) $(OBJ_COLLEEN) -o $@

$(GRACE): $(OBJ_GRACE)
	$(ASM) $(SRC_GRACE) -o $@
	$(CC) $(OBJ_GRACE) -o $@

$(SULLY): $(OBJ_SULLY)
	$(ASM) $(SRC_SULLY) -o $@
	$(CC) $(OBJ_SULLY) -o $@ 

$(OBJ_DIR)/%.o:%.s
	@mkdir -p $(OBJ_DIR)
	$(ASM) -o $@ -s $<

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(ALL)

re: fclean all