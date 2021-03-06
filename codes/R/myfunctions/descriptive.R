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

# http://stackoverflow.com/questions/6955440/displaying-minor-logarithmic-ticks-in-x-axis-in-r
log10.axis <- function(side, at, ...) {
  at.minor <- log10(outer(1:9, 10^(min(at):max(at))))
  lab <- sapply(at, function(i) as.expression(bquote(10^ .(i))))
  axis(side=side, at=at.minor, labels=NA, tcl=par("tcl")*0.5, ...)
  axis(side=side, at=at, labels=lab, ...)
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
       #ylab=expression("log(" * mu*g/m^3*")"),
       ylab=expression(mu~g~m^-3),
       xlab = 'Ano',
       yaxt="n",
       ylim = c(0,4),
       col="darkorange2")
  log10.axis(2, at=seq(0, 8, 2))
  grid()
  if (moda=='pm2.5') {
    abline(h=log10(25),col='red') 
    legend("bottom",c('Padrão diário OMS'),col=c('red'),bty = "n",pch = 15,cex=1.3)
  }
  if (moda=='pm10') {
    abline(h=log10(150),col='blue')
    abline(h=log10(50),col='red')
    legend("bottom",c('Padrão diário EPA-GH/CONAMA',
                      'Padrão diário OMS'),
           col=c('blue','red'),bty = "n",pch = 15,cex=1.4)
  }

  dev.off()
}

#### 
plot_epa <-function(x,y,elemento) {
  #x = epa$Al
  #y = iag$Al
  #elemento = 'Al'
  
  filepath = paste('../../outputs/','epa_iag_',elemento,'.pdf',sep='')
  pdf(filepath)
  maximo = max(c(x,y),na.rm = T)
  limite = round(1.1*maximo)
  reg <- lm(y ~ x)
  coefficients(reg)
  mar.default <- c(5,4,4,2) + 0.5
  par(mar = mar.default + c(0, 2, 0, 0))
  plot(x,y,
       main = elemento,
       xlim = c(0,limite),
       ylim = c(0,limite),
       pch=1,
       col='blue',
       ylab = expression("(EPA-US) " ~ n*g ~ cm^-2),
       xlab = expression("(LAPAt) " ~ n*g ~ cm^-2))
  abline(0, 1,col="red")
  
  # ajuste
  model <- lm(y ~ poly(x,1,raw=TRUE))
  coefs = model$coefficients
  p <- polynomial(coefs)
  lines(p,col='blue')
  
  # legenda R e p-value
  pvalue = signif(pvalue(model),3)
  rsquared = summary(model)$r.squared
  rsquared = signif(rsquared,2)
  
  rsquared = str_replace(rsquared,'\\.',',')
  code = paste0('expression(R^2~"= ',rsquared,'")') 
  l1 = eval(parse(text=code))
  
  pvalue = str_replace(pvalue,'\\.',',')
  code = paste0('expression(p < ~" ',pvalue,'")') 
  l2 = eval(parse(text=code))
  
  legend("bottomright", legend = c(l1,l2), cex=1.4, bty = "n",horiz=T)
  
  ##
  l1 = expression('a + bx: \n')
  l2 = paste(letters[1:2],format(coefs, scientific=F),sep=' = ')
  l2 = paste(l2,'\n',sep='')
  l2 = paste(l2,collapse=" ")
  l2 = gsub('\\.',',',l2)
  
  legend("topleft", legend = paste(l1,l2),bty="n",cex=1.4,pch=15,col='blue')
  #legend("centerright", legend = elemento,  pch = 15,cex=2)
  dev.off()
}
