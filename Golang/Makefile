GO = go build

COLLEEN = Colleen
SRC_COLLEEN = Colleen.go

GRACE = Grace
SRC_GRACE = Grace.go

SULLY = Sully
SRC_SULLY = Sully.go

SRC = $(SRC_COLLEEN) $(SRC_GRACE) $(SRC_SULLY)
ALL = $(COLLEEN) $(GRACE) $(SULLY)

all: $(ALL)

$(COLLEEN): 
	$(GO) $(SRC_COLLEEN)

$(GRACE):
	$(GO) $(SRC_GRACE)

$(SULLY):
	$(GO) $(SRC_SULLY)

clean:
	rm -rf $(ALL)

fclean: clean
	rm -rf $(ALL)

re: fclean all