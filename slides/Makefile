.PLONY: clean images

main.pdf: main.tex slides1.tex
	pdflatex main.tex
	pdflatex main.tex
	pdflatex main.tex
	pdflatex main.tex
	make clean

clean:
	rm -rf  *.dvi *.aux *.bbl *.toc *.out *.log *.nls *.nlo *.lof *.lot *.blg *.ilg *.synctex.gz *.nav  *.snm  *.vrb *~
