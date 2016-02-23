rm(list=ls())
source("myfunctions/load.R")

#### Calibração Maio de 2010 ####

# Linha K
cores = c('blue','red','black')
legenda = c('Maio 2010','Novembro 2010','Abril 2011')
coefs1_maio2010 = c(0.17052600,-0.02805800,0.00093775,0.00001916)
coefs2_maio2010 = c(-5.89488000,0.56112200,-0.01621390,0.00015109)
p1_maio2010 = polynomial(coefs1_maio2010)
p2_maio2010 = polynomial(coefs2_maio2010)

coefs1_nov2010 = c(0.15167500,-0.02464890,0.00077391,0.00001999)
coefs2_nov2010 = c(-5.97961000,0.56777700,-0.01642280,0.00015341)
p1_nov2010 = polynomial(coefs1_nov2010)
p2_nov2010 = polynomial(coefs2_nov2010)

coefs1_abril2011 = c(0.15987616,-0.026726302,9.55E-04,1.45E-05)
coefs2_abril2011 = c(-4.3221494, 0.4083262,-0.011499903, 1.04E-04)
p1_abril2011 = polynomial(coefs1_abril2011)
p2_abril2011 = polynomial(coefs2_abril2011)

pdf('../../outputs/CalibrationKcomparacao.pdf')

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

lines(p1_maio2010,xlim = c(10,26),col=cores[1])
lines(p1_nov2010,xlim = c(10,26),col=cores[2])
lines(p1_abril2011,xlim = c(10,26),col=cores[3])

lines(p2_maio2010,xlim = c(22,43),col=cores[1])
lines(p2_nov2010,xlim = c(22,43),col=cores[2])
lines(p2_abril2011,xlim = c(22,43),col=cores[3])

legend("topleft", legend = legenda, col=cores, pch = 15)
dev.off()


# Linha L
cores = c('blue','red','black')
legenda = c('Maio 2010','Novembro 2010','Abril 2011')

coefs1_maio2010 = c(-0.90276721,0.10112016,-0.0043561,8.89436792E-05,-8.42128969E-07,0.000000003)
p1_maio2010 = polynomial(coefs1_maio2010)

coefs1_nov2010 = c(-0.852155,0.095432,-0.0041149,8.41603E-05,-7.9806E-07,2.8404E-09)
p1_nov2010 = polynomial(coefs1_nov2010)

coefs1_abril2011 = c(-0.71619926,0.07987028,-0.003424948,0.00006946821,-0.00000064936,0.0000000022665)
p1_abril2011 = polynomial(coefs1_abril2011)

pdf('../../outputs/CalibrationLcomparacao.pdf')

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
axis(side=2, at=seq(0, 0.2, by=0.01))

lines(p1_maio2010,xlim = c(29,82),col=cores[1])
lines(p1_nov2010,xlim = c(29,82),col=cores[2])
lines(p1_abril2011,xlim = c(29,82),col=cores[3])

legend("topleft", legend = legenda, col=cores, pch = 15)
dev.off()
