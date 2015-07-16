#Makefile para criar outputs

.PLONY: clean all

all:
	#Sequência de códigos para cálculo da concentração elementar
	Rscript organizing/detectionLimit.R
	Rscript organizing/blackCarbon.R
	Rscript organizing/main.R
	Rscript organizing/deleteColumns.R
	Rscript organizing/duplicatesMedia.R
	Rscript organizing/prepare_pmf_files.R 
	#Rscript organizing/grosso.R 
	
	#Sequência de código para meteorologia
	Rscript meteorology/noaa_from_harvard.R
	Rscript meteorology/windFrequency.R
	#Rscript meteorology/noaa_ftp.R

	#Latex
	Rscript toLatex/concentration_subsets.R
	Rscript toLatex/samples.R
	Rscript toLatex/amostras_por_local.R
	#Rscript toLatex/descriptive_statistics.R
	
	#Rscript graphs/graficos.R

	#Rscript statistics/CMB/componentes_absolutos.R 
	#Rscript statistics/CMB/create_CMB_files.R  
	#Rscript statistics/CMB/speciate_africa.R
	#Rscript statistics/descriptive/descriptive_statistics.R
	#Rscript statistics/FA/main.R
	#Rscript statistics/PMF/main.R

clean:
	rm -rf *~ 
