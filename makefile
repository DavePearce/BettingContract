SRCDIR=src
BINDIR=bin
YUL_FLAGS = --ir-optimized --optimize --debug-info none
SOLC_FLAGS = --overwrite --evm-version london
CONTRACT = betting

all: $(BINDIR)/$(CONTRACT).yul $(BINDIR)/$(CONTRACT).bin $(BINDIR)/$(CONTRACT).runtime

$(BINDIR)/%.yul: $(SRCDIR)/%.sol
	solc $(SOLC_FLAGS) -o $(BINDIR) $(YUL_FLAGS) $<

%.bin: %.yul
	solc $(SOLC_FLAGS) -o $(BINDIR) --bin src/$(CONTRACT).sol

%.runtime: %.yul
	solc $(SOLC_FLAGS) --optimize -o $(BINDIR) --bin-runtime src/$(CONTRACT).sol

clean:
	rm *~ $(BINDIR)
