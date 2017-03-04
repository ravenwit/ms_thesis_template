filename=main
bibname=main

Tex=pdflatex
Bibtex=bibtex

Buildtex=$(Tex) $(filename).tex

all:
	$(Buildtex)
	$(Bibtex) $(bibname)
	$(Buildtex)
	$(Buildtex)

clean-all:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~ *.lof *.lot

clean:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.toc *.out *~ *.lof *.lot
