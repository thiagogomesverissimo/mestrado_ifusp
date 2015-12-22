# Makefile para scripts R

.PLONY: clean all

all:
	# Sequência de códigos para cálculo da concentração elementar
	Rscript organizing/detectionLimit.R
	Rscript organizing/blackCarbon.R
	Rscript organizing/edxResults.R
	Rscript organizing/mainSplit.R
	Rscript organizing/duplicates.R
	Rscript organizing/grossoResidencial.R 
	Rscript organizing/grossoTraffic.R 
	Rscript organizing/removeHarmathan.R
	Rscript organizing/preparePMF_FA.R 
	
	#Sequência de código para meteorologia
	Rscript meteorology/noaa_from_harvard.R
	Rscript meteorology/windFrequency.R
	#Rscript meteorology/noaa_ftp.R

	# Estatísticas
	Rscript statistics/FactorAnalysis/factor_analysis.R
	#Rscript statistics/CMB/componentes_absolutos.R 
	#Rscript statistics/CMB/create_CMB_files.R  
	#Rscript statistics/CMB/speciate_africa.R
	#Rscript statistics/descriptive/descriptive_statistics.R
	#Rscript statistics/PMF/main.R
	
	#Latex
	Rscript toLatex/samples.R
	Rscript toLatex/tabela_descritiva_com_harmatan.R
	Rscript toLatex/tabela_descritiva_sem_harmatan.R
	Rscript toLatex/tabelas_pmf.R
	Rscript toLatex/tabelas_analise_fatores.R

	# Gráficos
	#Rscript graphs/graficos.R

clean:
	rm -rf *~ 
