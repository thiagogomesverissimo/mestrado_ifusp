rm(list=ls())
source("myfunctions/load.R")

#### Linha K
mai2010 = read.csv('../../inputs/edxCalibration/americo/K2010MaioAjustadosAkerr.csv')
nov2010 = read.csv('../../inputs/edxCalibration/americo/K2010NovAjustadosAkerr.csv') 
abr2011 = read.csv('../../inputs/edxCalibration/americo/K2011AbrAjustadosAkerr.csv') 
# conta do Américo (atual-anterior)/anterior

tabela = cbind(Z = mai2010$Z,Maio2010Nov2010 = 100*(nov2010$R-mai2010$R)/mai2010$R)
tabela = cbind(tabela, Nov2010Abr2011 = 100*(abr2011$R-nov2010$R)/nov2010$R)
tabela = cbind(tabela, Mai2010Abr2011 = 100*(abr2011$R-mai2010$R)/mai2010$R)
row.names(tabela) = tabela[,1]

medias = apply(tabela[,-1],2,mean)
desvios = apply(tabela[,-1],2,sd)
tabela[,2:4] = format(tabela[,2:4],digits=2,nsmall=2)

tabela[,2] = paste(tabela[,2],'\\%',sep='')
tabela[,3] = paste(tabela[,3],'\\%',sep='')
tabela[,4] = paste(tabela[,4],'\\%',sep='')

medias = c('\\hline \\textbf{Média}',paste(format(medias,digits=2,nsmall=2),'\\%',sep=''))
desvios = c('\\textbf{Desvio Padrão}',paste(format(desvios,digits=2,nsmall=2),'\\%',sep=''))
tabela = rbind(tabela,medias)
tabela = rbind(tabela,desvios)

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file='../../outputs/comparaCalibrationK.tex')

#### Linha L
mai2010 = read.csv('../../inputs/edxCalibration/americo/L2010MaioAjustadosAkerr.csv')
nov2010 = read.csv('../../inputs/edxCalibration/americo/L2010NovAjustadosAkerr.csv') 
abr2011 = read.csv('../../inputs/edxCalibration/americo/L2011AbrAjustadosAkerr.csv') 
# conta do Américo (atual-anterior)/anterior

tabela = cbind(Z = mai2010$Z,Maio2010Nov2010 = 100*(nov2010$R-mai2010$R)/mai2010$R)
tabela = cbind(tabela, Nov2010Abr2011 = 100*(abr2011$R-nov2010$R)/nov2010$R)
tabela = cbind(tabela, Mai2010Abr2011 = 100*(abr2011$R-mai2010$R)/mai2010$R)
row.names(tabela) = tabela[,1]

medias = apply(tabela[,-1],2,mean)
desvios = apply(tabela[,-1],2,sd)
tabela[,2:4] = format(tabela[,2:4],digits=2,nsmall=2)

tabela[,2] = paste(tabela[,2],'\\%',sep='')
tabela[,3] = paste(tabela[,3],'\\%',sep='')
tabela[,4] = paste(tabela[,4],'\\%',sep='')

medias = c('\\hline \\textbf{Média}',paste(format(medias,digits=2,nsmall=2),'\\%',sep=''))
desvios = c('\\textbf{Desvio Padrão}',paste(format(desvios,digits=2,nsmall=2),'\\%',sep=''))
tabela = rbind(tabela,medias)
tabela = rbind(tabela,desvios)

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file='../../outputs/comparaCalibrationL.tex')



