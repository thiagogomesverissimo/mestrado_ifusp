source("myfunctions/load.R")

# Siglas
residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH')

FactorAnalysis('RFsH',5)
FactorAnalysis('TFsH',5)
FactorAnalysis('RGsH',5)
FactorAnalysis('TGsH',5)

FactorAnalysis('TIcH',5)