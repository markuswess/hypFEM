DEPENDS= intro.md _config.yml _toc.yml examples.md
.PHONY: clean

_build: $(DEPENDS)
	jupyter-book build --all .
