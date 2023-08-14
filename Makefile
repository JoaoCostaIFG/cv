.PHONY: all
all:
	xelatex -halt-on-error JoaoCostaCV.tex

## Extensions
EXTS=aux toc idx ind ilg log out lof lot lol bbl blg brf tdo fls nav snm fdb_latexmk vrb

## clean
.PHONY: clean
clean:
	for EXT in ${EXTS}; do \
	  find `pwd` -name \*\.$${EXT} -exec rm -v \{\} \; ; done
