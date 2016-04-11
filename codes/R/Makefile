# Makefile para scripts R

.PLONY: clean all

all:
	# Sequência de códigos para cálculo da concentração elementar
	Rscript experimental_results/detectionLimit.R
	Rscript experimental_results/blackCarbon.R
	Rscript experimental_results/edxResults.R
	Rscript experimental_results/mainSplit.R
	Rscript experimental_results/duplicates.R
	Rscript experimental_results/grossoResidencial.R 
	Rscript experimental_results/grossoTraffic.R 
	Rscript experimental_results/removeHarmathan.R
	Rscript experimental_results/preparePMF_FA.R 
	
	# Scripts gerais
	Rscript scripts/clean_noaa_data.R
	Rscript scripts/plot_windRose.R
	Rscript scripts/blackCarbonCalibration.R
	Rscript scripts/blackCarbonCetesb.R
	Rscript scripts/blackCarbonRefletancia.R
	Rscript scripts/census2010.R
	Rscript scripts/descriptive_statistics.R
	Rscript scripts/edxCalibration_comparacao.R
	Rscript scripts/edxCalibration.R
	Rscript scripts/plot_edxCalibration_comparacao.R
	Rscript scripts/plot_edxCalibration.R
	Rscript scripts/EPA.R
	Rscript scripts/factor_analysis.R
	Rscript scripts/graficos.R
	Rscript scripts/maps.R
	Rscript scripts/PIB.R
	Rscript scripts/samples.R
	Rscript scripts/tabela_descritiva_com_harmatan.R
	Rscript scripts/tabela_descritiva_sem_harmatan.R
	Rscript scripts/tabelas_pmf.R
	Rscript scripts/plot_fatorResposta.R

clean:
	rm -rf *~ 
