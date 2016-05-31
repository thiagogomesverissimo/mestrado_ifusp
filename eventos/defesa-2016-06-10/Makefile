.PLONY: clean images

main.pdf: defesa.tex
	pdflatex -interaction=nonstopmode -halt-on-error defesa.tex 
	pdflatex -interaction=nonstopmode -halt-on-error defesa.tex 
	pdflatex -interaction=nonstopmode -halt-on-error defesa.tex 
	make clean

clean:
	rm -rf  *.dvi *.aux *.bbl *.toc *.out *.log *.nls *.nlo *.lof *.lot *.blg *.ilg *.synctex.gz *.nav  *.snm  *.vrb *~
