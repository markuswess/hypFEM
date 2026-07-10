DEPENDS= intro.md _config.yml _toc.yml examples.md references.bib $(wildcard examples/*.ipynb)
.PHONY: all clean full

all: _build/.build-stamp

_build/.build-stamp: $(DEPENDS)
	jupyter-book build .
	touch _build/.build-stamp

full:
	jupyter-book build --all .
	touch _build/.build-stamp

clean:
	rm -rf _build
