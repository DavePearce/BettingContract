SRCDIR=src
BINDIR=bin
YUL_FLAGS = --ir-optimized --optimize --debug-info none
CONTRACT = betting

all: $(BINDIR)/$(CONTRACT).yul $(BINDIR)/$(CONTRACT).bin $(BINDIR)/$(CONTRACT).runtime

$(BINDIR)/%.yul: $(SRCDIR)/%.sol
	solc --overwrite -o $(BINDIR) $(YUL_FLAGS) $<

%.bin: %.yul
	solc --overwrite -o $(BINDIR) --bin src/$(CONTRACT).sol

%.runtime: %.yul
	solc --overwrite -o $(BINDIR) --bin-runtime src/$(CONTRACT).sol

clean:
	rm *~ $(BINDIR)
