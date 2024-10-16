N         := 40
OS_ARCH   := $(shell uname -sm | tr '[A-Z]' '[a-z]')
OS        := $(word 1, $(OS_ARCH))
ARCH      := $(word 2, $(OS_ARCH))
CODON_VER := 0.17.0
CODON_BIN := ./codon-deploy/bin/codon
CODON_URL := https://github.com/exaloop/codon/releases/download/v$(CODON_VER)/codon-$(OS)-$(ARCH).tar.gz

.PHONY: run void clean realclean

run: rfib_codon rfib_c rfib_crystal rfib_go rfib.jl rfib-chez.scm rfib_gerbil rfib.rkt rfib_d rfib.luajit rfib.pypy rfib_gambit rfib_sbcl rfib_chicken rfib.rb rfib.py
	@ echo
	@	for p in $^ ; do printf '%-15s: ' $$p ; ./$$p $(N) ; done

%_c: rfib.c
	gcc -Wall -O3 -flto -fPIC -o $@ $<

%_d: rfib.d
	ldc2 -of $@ $<

%_go: rfib.go
	go build -ldflags='-s -w ' --trimpath -o $@ $<

%_codon: rfib.py $(CODON_BIN)
	$(CODON_BIN) build -release -o $@ $<

%_chicken: rfib-chicken.scm
	csc -O3 -o $@ $<

%_gambit: rfib-gambit.scm
	gsc -o $@ -cc-options '-Wall -O3 -flto -fPIC' -exe -nopreload $<

%_gerbil: rfib-gerbil.scm
	gxc -O -exe -o $@ $<

%_sbcl: rfib.lisp
	sbcl --load $< \
		--eval "(sb-ext:save-lisp-and-die \"$@\" :toplevel #'main :executable t)"

%_crystal: rfib.cr
	crystal build --release -o $@ $<

%.py %.pypy %.luajit %.jl %.rkt %-chez.scm %.rb: void
	chmod +x *.py *.luajit *.jl *.rkt *-chez.scm *.rb

void:

$(CODON_BIN):
	curl -LO $(CODON_URL)
	tar -xzf codon-$(OS)-$(ARCH).tar.gz
	rm -f codon-$(OS)-$(ARCH).tar.gz

clean:
	rm -fr rfib_* __pycache__ *.o

realclean: clean
	rm -fr codon-*

