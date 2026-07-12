DEPENDS= Makefile $(wildcard *.md) _config.yml _toc.yml references.bib $(wildcard examples/*.ipynb) $(wildcard examples/assets/*)
.PHONY: all clean full

all: _build/.build-stamp

_build/.build-stamp: $(DEPENDS)
	jupyter-book build . --all
	touch _build/.build-stamp

full: clean
	jupyter-book build . --all
	touch _build/.build-stamp

clean:
	rm -rf _build
