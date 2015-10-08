# Makefile para scripts R

.PLONY: clean all

all:
	# shell
	sh ../shellscript/sedLatex_FactorAnalysis.sh
	sh ../shellscript/sedLatex_pmf.sh
	sh ../shellscript/sedLatex.sh

	# Python
	python ../python/edxCalibration_K.py
	python ../python/edxCalibration_L.py

clean:
	rm -rf *~ 
