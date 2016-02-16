rm(list=ls())
source("myfunctions/load.R")

#### Calibração Novembro de 2010 -  Linha K ####

pdf('../../outputs/CalibrationLineK2010novAkerr.pdf')
# Gráfico 'vazio'

mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))

y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
plot(0,0,
     xlim = c(5,50),
     ylim = c(0,0.6),
     type = "n",
     xlab = 'Z - Número Atômico',
     ylab = y_legenda,
     axes=F)

axis(side=1, at=c(5:48))
axis(side=2, at=seq(0, 0.6, by=0.1))


A	= 0.15167500
B1 = -0.02464890
B2 = 	0.00077391
B3 = 	0.00001999
p <- polynomial(c(A,B1,B2,B3))
lines(p,xlim = c(10,26),col="blue")

A	=-5.97961000
B1	=0.56777700
B2	=-0.01642280
B3	= 0.00015341
p <- polynomial(c(A,B1,B2,B3))
lines(p,xlim = c(22,43),col="red")

K = read.csv('../../inputs/edxCalibration/americo/K_nov2010medido.csv',dec=',')
errbar(K$Z,K$R, K$R + K$Uncert, K$R - K$Uncert,pch=20, add=TRUE)

cores = col=c('blue','red','black')
legendas = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
legend("topleft", legend = legendas, col=cores, pch = 15)

dev.off()

#### Calibração Novembro de 2010 - Linha L ####

pdf('../../outputs/CalibrationLineL2010novAkerr')

# Gráfico 'vazio'
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))

y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
plot(0,0,
     xlim = c(25,85),
     ylim = c(0,0.2),
     type = "n",
     xlab = 'Z - Número Atômico',
     ylab = y_legenda,
     axes=F)

axis(side=1, at=c(25:85))
axis(side=2, at=seq(0, 0.2, by=0.1))

A	= -0.852155
B1 = 0.095432
B2 = -0.0041149
B3 = 8.41603E-05
B4 = -7.9806E-07
B5 = 2.8404E-09
p <- polynomial(c(A,B1,B2,B3,B4,B5))
lines(p,xlim = c(29,85),col="blue")

L = read.csv('../../inputs/edxCalibration/americo/L_nov2010medido.csv',dec=',')
errbar(L$Z,L$R, L$R + L$Uncert, L$R - L$Uncert,pch=20, add=TRUE)

cores = col=c('blue','black')
legendas = c('ajuste','medidos')
legend("topleft", legend = legendas, col=cores, pch = 15)

dev.off()

#### Calibração Abril de 2011 -  Linha K ####

pdf('../../outputs/CalibrationLineK2011abrAkerr.pdf')
# Gráfico 'vazio'

mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))

y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
plot(0,0,
     xlim = c(5,50),
     ylim = c(0,0.6),
     type = "n",
     xlab = 'Z - Número Atômico',
     ylab = y_legenda,
     axes=F)

axis(side=1, at=c(5:48))
axis(side=2, at=seq(0, 0.6, by=0.1))


A  = 0.15167500
B1 = -0.02464890
B2 = 	0.00077391
B3 = 	0.00001999
p <- polynomial(c(A,B1,B2,B3))
lines(p,xlim = c(10,26),col="blue")

A	=-5.97961000
B1	=0.56777700
B2	=-0.01642280
B3	= 0.00015341
p <- polynomial(c(A,B1,B2,B3))
lines(p,xlim = c(22,43),col="red")

K = read.csv('../../inputs/edxCalibration/americo/K_abr2011medido.csv')
errbar(K$Z,K$R, K$R + K$Uncert, K$R - K$Uncert,pch=20, add=TRUE)

cores = col=c('blue','red','black')
legendas = c('ajuste1: Z 11-26',
             'ajuste2: Z 22-43',
             'medidos')
legend("topleft", legend = legendas, col=cores, pch = 15)

dev.off()

#### Calibração Novembro de 2010 - Linha L ####

pdf('../../outputs/CalibrationLineL2010novAkerr')

# Gráfico 'vazio'
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))

y_legenda = expression(frac(1,mu*A * s * frac(mu*g,cm^2)))
plot(0,0,
     xlim = c(25,85),
     ylim = c(0,0.2),
     type = "n",
     xlab = 'Z - Número Atômico',
     ylab = y_legenda,
     axes=F)

axis(side=1, at=c(25:85))
axis(side=2, at=seq(0, 0.2, by=0.1))

A	= -0.852155
B1 = 0.095432
B2 = -0.0041149
B3 = 8.41603E-05
B4 = -7.9806E-07
B5 = 2.8404E-09
p <- polynomial(c(A,B1,B2,B3,B4,B5))
lines(p,xlim = c(29,85),col="blue")

L = read.csv('../../inputs/edxCalibration/americo/L_nov2010medido.csv',dec=',')
errbar(L$Z,L$R, L$R + L$Uncert, L$R - L$Uncert,pch=20, add=TRUE)

cores = col=c('blue','black')
legendas = c('ajuste','medidos')
legend("topleft", legend = legendas, col=cores, pch = 15)

dev.off()
