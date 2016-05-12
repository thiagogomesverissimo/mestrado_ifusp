edxCalibration = function(name,titulo,line,pontos,cores,coefs1,coefs2=c(-999)) {

  filename_pdf = paste('../../outputs/Calibration',line,name,'.pdf',sep='')
  pdf(filename_pdf)
  
  # Gráfico 'vazio'
  mar.default <- c(5,4,4,2) + 0.1
  par(mar = mar.default + c(0, 3, 0, 0))
  
  if (line=='K') 
    xylim = as.data.frame(cbind('x'=c(5,50),'y'=c(0,0.6)))
  if (line=='L') 
    xylim = as.data.frame(cbind('x'=c(25,85),'y'=c(0,0.2)))
  
  y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
  plot(0,0,
       xlim = xylim$x,
       ylim = xylim$y,
       type = "n",
       xlab = 'Z - Número Atômico',
       main = titulo,
       ylab = y_legenda,
       axes=F)
  
  if (line == 'K') {
    axis(side=1, at=c(5:48))
    axis(side=2, at=seq(0, 0.6, by=0.1))
  }
  if (line == 'L') {
    axis(side=1, at=c(25:85))
    axis(side=2, at=seq(0, 0.2, by=0.01))
  }
  
  p <- polynomial(coefs1)
  if (line=='K')
    lines(p,xlim = c(10,26),col=cores[1])
  if (line=='L')
    lines(p,xlim = c(29,82),col=cores[1])
  
  # Se houver um segundo ajuste
  if (coefs2[1]!=-999) {
    p <- polynomial(coefs2)
    lines(p,xlim = c(22,43),col=cores[2])
  }

  errbar(pontos$Z,pontos$R, pontos$R + pontos$Uncert, pontos$R - pontos$Uncert,pch=20, add=TRUE)
  
  # legenda
  if (line=='K'){
    legend("bottomright", legend = expression('Ajuste polinomial: '  ~ a + bx + cx^2 + dx^3), cex=1.1, bty = "n")
    legenda1 = paste(letters[1:4],format(coefs1, scientific=T),sep=' = ')
    legenda1 = paste(legenda1,'\n',sep='')
    legenda1 = paste(legenda1,collapse=" ")
    legenda1 = gsub('\\.',',',legenda1)
    legenda1 = paste('\n Coeficientes 1° ajuste \n (Z de 11 até 26): \n ',legenda1)
  
    legenda2 = paste(letters[1:4],format(coefs2, scientific=T),sep=' = ')
    legenda2 = paste(legenda2,'\n',sep='')
    legenda2 = paste(legenda2,collapse=" ")
    legenda2 = gsub('\\.',',',legenda2)
    legenda2 = paste('\n Coeficientes 2° ajuste \n (Z de 22 até 43): \n',legenda2)
  
    legenda = c(legenda1,legenda2,'Alvos de calibração')
  }
  if (line=='L') {
    legend("bottomright", legend = expression('Ajuste polinomial: ' ~a + bx + cx^2 + dx^3 + ex^4 + fx^5), cex=1.1, bty = "n")
    legenda = paste(letters[1:6],format(coefs1, scientific=T),sep=' = ')
    legenda = paste(legenda,'\n',sep='')
    legenda = paste(legenda,collapse=" ")
    legenda = gsub('\\.',',',legenda)
    legenda = paste('\n Coeficientes do ajuste (Z de 29 até 82): \n',legenda)
    legenda = c(legenda,'Alvos de calibração')
  }
  
  legend("topleft", legend = legenda, col=cores, pch = 15, cex=0.9, bty = "n")
  dev.off()
}

# Function took from http://stackoverflow.com/questions/5173692/how-to-return-number-of-decimal-places-in-r
decimalplaces <- function(x) {
  if ((x %% 1) != 0) {
    nchar(strsplit(sub('0+$', '', as.character(x)), ".", fixed=TRUE)[[1]][[2]])
  } else {
    return(0)
  }
}

montaColuna = function(data){
  #test 
  data = read.csv('../../inputs/edxCalibration/americo/K2010MaioAjustadosAkerr.csv', row.names = 1)
  
  data[,1:2] = data[,1:2]*1000
  data = cbind(data,incerteza_relativa = 100*(data[,2]/data[,1]))

  # ajusta as incertezas para dois significativos
  data$Uncert = signif(data$Uncert,digits = 2)
  
  # ajusta as medidas de acordo com as incertezas
  for (i in 1:nrow(data)) {
    data[i,1] = round(data[i,1],digits = decimalplaces(data[i,2]))
  }

  # remove zero da direita
  data$R = prettyNum(data$R)
  data$Uncert = prettyNum(data$Uncert)

  # zero a direita qdo menor q 10
  for (i in 1:nrow(data)) {
    print(decimalplaces(data[i,2]))
  }
    
  #> mynumber = 1001
  # as.numeric(unlist(strsplit(as.character(mynumber),"")))
  
  data = format(round(data,1),digits=1,nsmall=1,scientic=F,decimal.mark = ',') 
  #data = cbind(data,new=paste(data[,1],'$\\pm$' ,data[,2],' ( ',data[,3],'\\%)',sep=''))
  data = cbind(data,new=paste(data[,1],'$\\pm$' ,data[,2],'(',data[,3],')',sep=''))
  data[,4]
}
