.PLONY: clean images

main.pdf: main.tex projeto.tex metodologia.tex experimento.tex resultados.tex
	pdflatex -interaction=nonstopmode -halt-on-error main.tex 
	pdflatex -interaction=nonstopmode -halt-on-error main.tex 
	pdflatex -interaction=nonstopmode -halt-on-error main.tex 
	make clean

clean:
	rm -rf  *.dvi *.aux *.bbl *.toc *.out *.log *.nls *.nlo *.lof *.lot *.blg *.ilg *.synctex.gz *.nav  *.snm  *.vrb *~
