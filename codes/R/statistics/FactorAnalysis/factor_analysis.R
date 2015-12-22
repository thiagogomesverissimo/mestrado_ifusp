rm(list=ls())
source("myfunctions/load.R")

# Siglas
# residencial = c('RFcH','RGcH','RIcH')   
# traffic = c('TFcH','TGcH','TIcH')

FactorAnalysis('RFcH',5)
FactorAnalysis('TFcH',4)
FactorAnalysis('RIcH',4)
FactorAnalysis('TIcH',4)
FactorAnalysis('RGcH',4)
FactorAnalysis('TGcH',4)

FactorAnalysis('RFsH',5)
FactorAnalysis('TFsH',5)
FactorAnalysis('RIsH',4)
FactorAnalysis('TIsH',4)
FactorAnalysis('RGsH',4)
FactorAnalysis('TGsH',4)



