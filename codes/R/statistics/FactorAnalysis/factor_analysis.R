source("myfunctions/load.R")

# Siglas
residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH')

# All conditions
conditions<-c(residencial,traffic)

# Inclui tabelas sem os meses do Harmathan
conditions = c(conditions,gsub('c','s',conditions))

for(i in conditions){
  FactorAnalysis(i,5) 
}

# As exceções (que não são 6):
# FactorAnalysis('RFcH',4)
# FactorAnalysis('RGcH',5)
 FactorAnalysis('RGsH',4)
# FactorAnalysis('RIsH',5)
# FactorAnalysis('TGcH',5)
# FactorAnalysis('TGsH',5)
 FactorAnalysis('TFsH',4)