rm(list=ls())
source("myfunctions/load.R")

#### Calibração Maio de 2010
medidos = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/K2010MaioAjustadosAkerr.csv')

colnames(medidos) = c('Z','Rmedido','Umedido')
colnames(ajustados) = c('Z','Rajustado','Uajustado')

tabela = merge(medidos,ajustados,all=T)

tabela = cbind(tabela,'razaoMedido'=100*(tabela$Umedido/tabela$Rmedido))
tabela = cbind(tabela,'razaoAjustado'=100*(tabela$Uajustado/tabela$Rajustado))

tabela[,2:5] = format(tabela[,2:5], scientific=T,digits=2)
tabela[,6:7] = format(tabela[,6:7], digits=2)

tabela[is.na(tabela)] = '-'

tabela[,6] = paste(tabela[,6],'\\%')
