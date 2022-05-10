CC = clang
CFLAGS = -Wall -Wextra -Werror

COLLEEN = Colleen
SRC_COLLEEN = Colleen.c
OBJ_COLLEEN = $(SRC_COLLEEN:.c=.o)

GRACE = Grace
SRC_GRACE = Grace.c
OBJ_GRACE = $(SRC_GRACE:.c=.o)

SULLY = Sully
SRC_SULLY = Sully.c
OBJ_SULLY = $(SRC_SULLY:.c=.o)

OBJ_DIR	= obj

OBJ_COLLEEN := $(addprefix $(OBJ_DIR)/, $(OBJ_COLLEEN))
OBJ_GRACE := $(addprefix $(OBJ_DIR)/, $(OBJ_GRACE))
OBJ_SULLY := $(addprefix $(OBJ_DIR)/, $(OBJ_SULLY))

SRC = $(SRC_COLLEEN) $(SRC_GRACE) $(SRC_SULLY)
OBJ = $(addprefix $(OBJ_DIR), $(SRC:.c=.o))
ALL = $(COLLEEN) $(GRACE) $(SULLY)

all: $(ALL)

$(COLLEEN): $(OBJ_COLLEEN)
	$(CC) $(OBJ_COLLEEN) -o $@

$(GRACE): $(OBJ_GRACE)
	$(CC) $(OBJ_GRACE) -o $@

$(SULLY): $(OBJ_SULLY)
	$(CC) $(OBJ_SULLY) -o $@ 

$(OBJ_DIR)/%.o:%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(ALL)

re: fclean all