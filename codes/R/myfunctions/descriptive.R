descriptive2latex <- function(data,sigla){
  
  # Teste
  #sigla = 'RIeH'
  #source("myfunctions/load.R")
  #detach("package:Hmisc", unload=TRUE) 
  #data = read.csv('../../outputs/pmf_fa/RIeH.csv')
  
  tabela = describe(data[,-1])
  tabela = tabela[,c(2,3,13,5,8,9)]
  tabela[,c(2:6)] = tabela[,c(2:6)]*1000
  tabela[c("mass"),c(2:6)] = tabela[c("mass"),c(2:6)]/1000
  if(grepl('F',sigla)) tabela[c("BC"),c(2:6)] = tabela[c("BC"),c(2:6)]/1000
  tabela[,c(2:6)] = format(round(tabela[,c(2:6)],2), scientific=F,nsmall=2,decimal.mark = ',')
  tabela[,1] = as.integer(tabela[,1])

  latex_file = paste('../../outputs/descriptive_',sigla,'.tex',sep='')
  print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = T, 
      sanitize.text.function = identity,
      file=latex_file)
}

massa_temporal <- function(sigla,moda='pm2.5') {
  #sigla="RFcH"
  max_eixo_y = log10(4000)
  arquivocsv = paste('../../outputs/pmf_fa/',sigla,'.csv',sep="")
  arquivopdf = paste('../../outputs/massa_temporal_',sigla,'.pdf',sep="") 
  pdf(arquivopdf)
  data=read.csv(arquivocsv)
  data$Date = strptime(data$Date,format="%d/%m/%Y %H:%M")
  mar.default <- c(5,4,4,2) + 0.5
  par(mar = mar.default + c(0, 1, 0, 0))
  plot(data$Date, 
       log10(data$mass),
       type="p",
       ylab=expression("log("*mu*g/m^3*")"),
       ylim = c(0,max_eixo_y),
       xlab = 'Ano',
       pch=16,
       col="darkorange2")
  grid()
  if (moda=='pm2.5') {
    abline(h=log10(25),col='red') 
    legend("bottom",c('OMS'),col=c('red'),bty = "n",pch = 15,cex=1.3)
  }
  if (moda=='pm10') {
    abline(h=log10(150),col='blue')
    abline(h=log10(50),col='red')
    legend("bottom",c('Média diária em Gana/Brasil (EPA-GH/CONAMA)',
                      'Média diária da OMS'),
           col=c('blue','red'),bty = "n",pch = 15,cex=1.25)
  }

  dev.off()
}
