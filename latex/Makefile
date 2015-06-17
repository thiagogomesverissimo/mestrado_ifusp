FILE=mestrado

# Arquivo para gerar abreviaturas 
# As vezes é necessário passar o caminho absoluto /usr/share etc.
NOMENCL=nomencl.ist

.PHONY: fast clean

# Dica: pode-se usar batchmode ao invés de nonstopmode.

fast:
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex 
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex
	makeindex $(FILE).nlo -s $(NOMENCL) -o $(FILE).nls
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex
	bibtex $(FILE).aux
	pdflatex -interaction=nonstopmode -halt-on-error $(FILE).tex
	make clean
	
clean:
	rm -rf *.aux *.bbl *.toc *.out *.log *.nls *.nlo \
               *.lof *.lot *.blg *.ilg *.synctex.gz
	rm -rf */*.aux */*.bbl */*.toc */*.out */*.log   \
               */*.nls */*.nlo */*.lof */*.lot */*.blg */*.ilg */*.synctex.gz
	rm -rf *~ */*~
