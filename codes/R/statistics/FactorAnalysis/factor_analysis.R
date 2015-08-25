source("myfunctions/load.R")

# Siglas
residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH')

# All conditions
conditions<-c(residencial,traffic)

# Inclui tabelas sem os meses do Harmathan
conditions = c(conditions,gsub('c','s',conditions))

for(i in conditions){
  FactorAnalysis(i,6) 
}


