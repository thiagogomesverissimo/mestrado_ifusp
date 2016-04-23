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
	Rscript scripts/censo.R
	Rscript scripts/descriptive_statistics.R
	Rscript scripts/IAGversusEPA.R
	Rscript scripts/factor_analysis.R
	Rscript scripts/graficos.R
	Rscript scripts/maps.R
	Rscript scripts/PIB.R
	Rscript scripts/samples.R
	Rscript scripts/tabelas_pmf.R
	Rscript scripts/plot_fatorResposta.R
	Rscript scripts/xrfed_calibrations.R
	Rscript scripts/xrfed_calibrations_between_compares.R
	Rscript scripts/BC_monarch71.R
	Rscript scripts/BC_cetesb.R
	Rscript scripts/TOTversusRefletancia.R
	Rscript scripts/BC_Janio_Quadros.R

clean:
	rm -rf *~ 
