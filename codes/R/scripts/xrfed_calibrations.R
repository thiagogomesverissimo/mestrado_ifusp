rm(list=ls())
source("myfunctions/load.R")

# Gera gráficos para cada calibração

#### Plot Calibração Maio de 2010 ####

## Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv')
coefs1_akerr = c(0.17052600,-0.02805800,0.00093775,0.00001916)
coefs2_akerr = c(-5.89488000,0.56112200,-0.01621390,0.00015109)
cores = col=c('blue','red','black')
edxCalibration('2010MaiAkerr','linha K: Maio de 2010','K',medidos,cores,coefs1_akerr,coefs2_akerr)

## Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv')
coefs1_akerr = c(-0.90276721,0.10112016,-0.0043561,0.0000889436792,-0.000000842128969,0.000000003)

# Meu ajuste
model <- lm(medidos$R ~ poly(medidos$Z,5,raw=TRUE))
coefs1_thiago = model$coefficients
coefs1_thiago = as.vector(coefs1_thiago)
cores = col=c('blue','black')

edxCalibration('2010MaiAkerr','linha L: Maio de 2010','L',medidos,cores,coefs1_thiago)

#### Plot Calibração Novembro de 2010 ####

# Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2010NovMedidosAkerr.csv')
coefs1_akerr = c(0.15167500,-0.02464890,0.00077391,0.00001999)
coefs2_akerr = c(-5.97961000,0.56777700,-0.01642280,0.00015341)
cores = col=c('blue','red','black')
edxCalibration('2010NovAkerr','linha K: Novembro de 2010','K',medidos,cores,coefs1_akerr,coefs2_akerr)

# Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2010NovMedidosAkerr.csv')
coefs1_akerr = c(-0.852155,0.095432,-0.0041149,0.0000841603,-0.00000079806,0.0000000028404)
cores = col=c('blue','black')
edxCalibration('2010NovAkerr','linha L: Novembro de 2010','L',medidos,cores,coefs1_akerr)

#### PLot Calibração Abril de 2011 ####

# Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2011AbrMedidosAkerr.csv')
coefs1_akerr = c(0.15987616,-0.026726302,0.00095542146,0.000014469997)
coefs2_akerr = c(-4.3221494, 0.4083262,-0.011499903, 0.00010389019)
cores = col=c('blue','red','black')
edxCalibration('2011AbrAkerr','linha K: Abril de 2011','K',medidos,cores,coefs1_akerr,coefs2_akerr)

# Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2011AbrMedidosAkerr.csv')
coefs1_akerr = c(-0.71619926,0.07987028,-0.003424948,0.00006946821,-0.00000064936,0.0000000022665)
cores = col=c('blue','black')
edxCalibration('2011AbrAkerr','linha L: Abril de 2011','L',medidos,cores,coefs1_akerr)


# usada de exemplo texto 
#### Maio de 2010 Linha K
pdf('../../outputs/plot_R_maio2010K.pdf')
K = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv')
x = K$Z
y = K$R
y_erro = K$Uncert

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
axis(side=2, at=seq(0, 0.6, by=0.05))

errbar(x,y, y + y_erro, y- y_erro ,pch=20, add=TRUE)
dev.off()

#### Maio de 2010 Linha L
pdf('../../outputs/plot_R_maio2010L.pdf')
L = read.csv('../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv')
x = L$Z
y = L$R
y_erro = L$Uncert

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

errbar(x,y, y + y_erro, y- y_erro ,pch=20, add=TRUE)

dev.off()

