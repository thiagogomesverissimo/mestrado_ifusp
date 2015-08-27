rm(list=ls())
source("myfunctions/load.R")

# Siglas
# residencial = c('RFcH','RGcH','RIcH')   
# traffic = c('TFcH','TGcH','TIcH')

FactorAnalysis('RFsH',5)
FactorAnalysis('TFsH',5)
FactorAnalysis('RGsH',4)
FactorAnalysis('TGsH',4)




FactorAnalysis('TIcH',5)
