edxCalibration = function(name,line,file_medidos,cores,legenda,coefs1,coefs2=c(-999)) {
  
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
       ylab = y_legenda,
       axes=F)
  
  if (line == 'K') {
    axis(side=1, at=c(5:48))
    axis(side=2, at=seq(0, 0.6, by=0.1))
  }
  if (line == 'L') {
    axis(side=1, at=c(25:85))
    axis(side=2, at=seq(0, 0.2, by=0.02))
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
  
  # Adiciona pontos
  pontos = read.csv(file_medidos)
  errbar(pontos$Z,pontos$R, pontos$R + pontos$Uncert, pontos$R - pontos$Uncert,pch=20, add=TRUE)
  
  # legenda
  legend("topleft", legend = legenda, col=cores, pch = 15)
  dev.off()
}