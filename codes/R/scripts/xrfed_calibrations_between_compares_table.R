rm(list=ls())
source("myfunctions/load.R")

#### linha K ####

# maio de 2010
medidos = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/K2010MaioAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
maio2010 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# novembro de 2010
medidos = read.csv('../../inputs/edxCalibration/americo/K2010NovMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/K2010NovAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
nov2010 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# abril 2011
medidos = read.csv('../../inputs/edxCalibration/americo/K2011AbrMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/K2011AbrAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
abr2011 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# Mês de referência: maio2010. diferença relativa = (atual-anterior)/anterior
direfenca_relativa_nov2010 = as.data.frame(100*(nov2010$R-maio2010$R)/maio2010$R)
media_nov2010 = apply(direfenca_relativa_nov2010,2,mean)
media_nov2010 = format(round(media_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')
desvio_nov2010 = apply(direfenca_relativa_nov2010,2,sd)
desvio_nov2010 = format(round(desvio_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')
dr_nov2010 = paste(media_nov2010,'(',desvio_nov2010,')',sep='')
direfenca_relativa_nov2010 = format(round(direfenca_relativa_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')

# Abril 2011
direfenca_relativa_abr2011 = as.data.frame(100*(abr2011$R-maio2010$R)/maio2010$R)
media_abr2011 = apply(direfenca_relativa_abr2011,2,mean)
media_abr2011 = format(round(media_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')
desvio_abr2011 = apply(direfenca_relativa_abr2011,2,sd)
desvio_abr2011 = format(round(desvio_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')
dr_abr2011 = paste(media_abr2011,'(',desvio_abr2011,')',sep='')
direfenca_relativa_abr2011 = format(round(direfenca_relativa_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')

tabela = cbind(rownames(maio2010),maio2010[,c(4,3)],nov2010[,c(4,3)],abr2011[,c(4,3)],
               direfenca_relativa_nov2010,direfenca_relativa_abr2011)

last_line = matrix(c('\\hline',rep(' ',5),'Média(Desvio Padrão)',dr_nov2010,dr_abr2011),ncol = 9)
colnames(last_line) = colnames(tabela[2,])
tabela = rbind(tabela,last_line)

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Maio 2010} & \\multicolumn{2}{c}{Novembro 2010} & \\multicolumn{2}{c}{Abril 2011} & \\multicolumn{2}{c}{Diferença Relativa a Maio 2010} \\\\\n
                       Z & medido & ajustado & medido & ajustado & medido & ajustado  & Novembro 2010 & Abril 2011 \\\\\n',
                      '\\hline \\multicolumn{7}{c}{$\\mu g / m^3$ (\\% incerteza/valor)} & \\multicolumn{2}{c}{\\%}  \\\\\n')

print(xtable(tabela),
        type="latex", 
        floating = FALSE,
        include.rownames = F,
        add.to.row = addtorow,
        include.colnames = F,
        sanitize.text.function = identity,
        file='../../outputs/edxAllCalibrationK.tex')


#### linha L ####

# maio de 2010
medidos = read.csv('../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/L2010MaioAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
maio2010 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# novembro de 2010
medidos = read.csv('../../inputs/edxCalibration/americo/L2010NovMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/L2010NovAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
nov2010 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# abril 2011
medidos = read.csv('../../inputs/edxCalibration/americo/L2011AbrMedidosAkerr.csv', row.names = 1)
ajustados = read.csv('../../inputs/edxCalibration/americo/L2011AbrAjustadosAkerr.csv', row.names = 1)
medidos = cbind(medidos,medidos = montaColuna(medidos))
ajustados = cbind(ajustados,ajustados = montaColuna(ajustados))
abr2011 = cbind(ajustados,medidos = medidos[rownames(ajustados),3])

# Mês de referência: maio2010. diferença relativa = (atual-anterior)/anterior
direfenca_relativa_nov2010 = as.data.frame(100*(nov2010$R-maio2010$R)/maio2010$R)
media_nov2010 = apply(direfenca_relativa_nov2010,2,mean)
media_nov2010 = format(round(media_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')
desvio_nov2010 = apply(direfenca_relativa_nov2010,2,sd)
desvio_nov2010 = format(round(desvio_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')
dr_nov2010 = paste(media_nov2010,'(',desvio_nov2010,')',sep='')
direfenca_relativa_nov2010 = format(round(direfenca_relativa_nov2010,2),nsmall=2,scientic=F,decimal.mark = ',')

# Abril 2011
direfenca_relativa_abr2011 = as.data.frame(100*(abr2011$R-maio2010$R)/maio2010$R)
media_abr2011 = apply(direfenca_relativa_abr2011,2,mean)
media_abr2011 = format(round(media_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')
desvio_abr2011 = apply(direfenca_relativa_abr2011,2,sd)
desvio_abr2011 = format(round(desvio_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')
dr_abr2011 = paste(media_abr2011,'(',desvio_abr2011,')',sep='')
direfenca_relativa_abr2011 = format(round(direfenca_relativa_abr2011,2),nsmall=2,scientic=F,decimal.mark = ',')

tabela = cbind(rownames(maio2010),maio2010[,c(4,3)],nov2010[,c(4,3)],abr2011[,c(4,3)],
               direfenca_relativa_nov2010,direfenca_relativa_abr2011)

last_line = matrix(c('\\hline',rep(' ',5),'Média(Desvio Padrão)',dr_nov2010,dr_abr2011),ncol = 9)
colnames(last_line) = colnames(tabela[2,])
tabela = rbind(tabela,last_line)

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Maio 2010} & \\multicolumn{2}{c}{Novembro 2010} & \\multicolumn{2}{c}{Abril 2011} & \\multicolumn{2}{c}{Diferença Relativa a Maio 2010} \\\\\n
                       Z & medido & ajustado & medido & ajustado & medido & ajustado  & Novembro 2010 & Abril 2011 \\\\\n',
                      '\\hline \\multicolumn{7}{c}{$\\mu g / m^3$ (\\% incerteza/valor)} & \\multicolumn{2}{c}{\\%}  \\\\\n')

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F,
      tabular.environment = 'longtable',
      add.to.row = addtorow,
      include.colnames = F,
      sanitize.text.function = identity,
      file='../../outputs/edxAllCalibrationL.tex')

