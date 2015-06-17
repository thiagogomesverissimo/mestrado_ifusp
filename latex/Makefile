FILE=mestrado

.PHONY: fast debug clean

# Dica: pode-se usar batchmode ao invés de nonstopmode.

fast:
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex 
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex
	make clean
	
debug:	%.tex
	pdflatex $(FILE).tex
#	pdflatex $(FILE).tex
#	makeindex $(FILE).nlo -s nomencl.ist -o $(FILE).nls
#	bibtex $(FILE).aux
#	pdflatex $(FILE).tex
#	pdflatex $(FILE).tex

clean:
	rm -rf *.aux *.bbl *.toc *.out *.log *.nls *.nlo *.lof *.lot *.blg *.ilg *.synctex.gz
	rm -rf */*.aux */*.bbl */*.toc */*.out */*.log */*.nls */*.nlo */*.lof */*.lot */*.blg */*.ilg */*.synctex.gz
	rm -rf *~ */*~
