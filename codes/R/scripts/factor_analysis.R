rm(list=ls())
source("myfunctions/load.R")

# Testes
print(FactorAnalysis('TFcH',5)$loadings,cutoff=4e-1)

# Conta amostras
file=read.csv('../../outputs/pmf_fa/RFcH.csv')
nrow(file)

## Residencial Fino
FactorAnalysis('RFcH',4)
FactorAnalysis('RFcH',5)
FactorAnalysis('RFcH',6)
FactorAnalysis('RFsH',4)
FactorAnalysis('RFsH',5)
FactorAnalysis('RFsH',6)

## Residencial Grosso
FactorAnalysis('RGcH',4)
FactorAnalysis('RGcH',5)
FactorAnalysis('RGcH',6)
FactorAnalysis('RGsH',4)
FactorAnalysis('RGsH',5)
FactorAnalysis('RGsH',6)

## Avenida Fino
FactorAnalysis('TFcH',4)
FactorAnalysis('TFcH',5)
FactorAnalysis('TFcH',6)
FactorAnalysis('TFsH',4)
FactorAnalysis('TFsH',5)
FactorAnalysis('TFsH',6)

## Residencial Grosso
FactorAnalysis('TGcH',4)
FactorAnalysis('TGcH',5)
FactorAnalysis('TGcH',6)
FactorAnalysis('TGsH',4)
FactorAnalysis('TGsH',5)
FactorAnalysis('TGsH',6)
