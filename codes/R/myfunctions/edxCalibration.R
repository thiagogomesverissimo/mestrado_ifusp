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
  
  #y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
  y_legenda = expression( '[' ~ mu*A ~ s ~ '('*mu*g/cm^2 ~ ")]"^-1)
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
    box()
  }
  if (line == 'L') {
    axis(side=1, at=c(25:85))
    axis(side=2, at=seq(0, 0.2, by=0.01))
    box()
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

montaColuna = function(data) {
  # Test
  #data = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv', row.names = 1)
  #data = fix_significativos(data*1000)
  
  data = cbind(data,incerteza_relativa = 100*(as.numeric(data[,2])/as.numeric(data[,1])))
  data[,3] = sprintf("%.1f",data[,3])
  data = cbind(data,new=paste(data[,1],'$\\pm$' ,data[,2],'(',data[,3],')',sep=''))
  
  # decimal com vírgula
  data[,4] = str_replace_all(data[,4],'\\.',',')
  return(data[,4])  
}