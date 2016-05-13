rm(list=ls())
source("myfunctions/load.R")

#### Testes
detach("package:Hmisc", unload=TRUE) 
base = read.csv('../../outputs/pmf_fa/RFsH.csv',row.names=1)
describe(base)
####


# Testes
print(FactorAnalysis('RFsH',5)$loadings,cutoff=4e-1)

# Conta amostras
file=read.csv('../../outputs/pmf_fa/RFsH.csv')
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

# Harmatão
FactorAnalysis('RIeH',4)
FactorAnalysis('TIeH',4)

FactorAnalysis('RGeH',4)
FactorAnalysis('TGeH',4)

FactorAnalysis('RFeH',4)
FactorAnalysis('TFeH',4)

FactorAnalysis('RGeH',5)
FactorAnalysis('TGeH',5)

FactorAnalysis('RFeH',5)
FactorAnalysis('TFeH',5)
