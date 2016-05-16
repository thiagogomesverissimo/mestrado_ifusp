rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 

# Massa comparando com limites WHO
massa_temporal('RFcH','pm2.5')
massa_temporal('TFcH','pm2.5')

massa_temporal('RIcH','pm10')
massa_temporal('TIcH','pm10')

# Correlações
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
pairs(RFsH[,c(2,4,6,8,10,12)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")



