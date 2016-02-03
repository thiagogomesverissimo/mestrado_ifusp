rm(list=ls())
source("myfunctions/load.R")

## Residencial Fino
FactorAnalysis('RFcH',4)
#print(FactorAnalysis('RFcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('RFsH',4)
print(FactorAnalysis('RFsH',4)$loadings,cutoff=4e-1)

## Redidencial Grosso
FactorAnalysis('RGcH',4)
#print(FactorAnalysis('RGcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('RGsH',4)
print(FactorAnalysis('RGsH',4)$loadings,cutoff=2e-1)

## Traffic fino
FactorAnalysis('TFcH',4)
#print(FactorAnalysis('TFcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('TFsH',4)
print(FactorAnalysis('TFsH',4)$loadings,cutoff=4e-1)

## Traffic grosso
FactorAnalysis('TGcH',4)
print(FactorAnalysis('TGcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('TGsH',4)
print(FactorAnalysis('TGsH',5)$loadings,cutoff=4e-1)

