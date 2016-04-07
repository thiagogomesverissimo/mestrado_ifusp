#rm(list=ls())
source("myfunctions/load.R")

## Residencial Fino
FactorAnalysis('RFcH',4)
FactorAnalysis('RFcH',5)
print(FactorAnalysis('RFcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('RFsH',4)
FactorAnalysis('RFsH',5)
#print(FactorAnalysis('RFsH',5)$loadings,cutoff=2e-1)

## Redidencial Grosso
FactorAnalysis('RGcH',4)
FactorAnalysis('RGcH',5)
#print(FactorAnalysis('RGcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('RGsH',4)
FactorAnalysis('RGsH',5)
#print(FactorAnalysis('RGsH',4)$loadings,cutoff=2e-1)

## Traffic fino
FactorAnalysis('TFcH',4)
FactorAnalysis('TFcH',5)
#print(FactorAnalysis('TFcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('TFsH',4)
FactorAnalysis('TFsH',5)
#print(FactorAnalysis('TFsH',4)$loadings,cutoff=4e-1)

## Traffic grosso
FactorAnalysis('TGcH',4)
FactorAnalysis('TGcH',5)
#print(FactorAnalysis('TGcH',4)$loadings,cutoff=4e-1)

FactorAnalysis('TGsH',4)
FactorAnalysis('TGsH',5)
#print(FactorAnalysis('TGsH',4)$loadings,cutoff=4e-1)