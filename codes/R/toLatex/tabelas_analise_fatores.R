##
rm(list=ls())
source("myfunctions/load.R")

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# All conditions
conditions<-c(residencial,traffic)

# Inclui tabelas sem os meses do Harmathan
conditions = c(conditions,gsub('c','s',conditions))

#conditions
#lapply(conditions,briefFA)

briefFA('RFsH')
briefFA('RFcH')
briefFA('RGsH')
briefFA('RGcH')

briefFA('TFsH')
briefFA('TFcH')
briefFA('TGsH')
briefFA('TGcH')
