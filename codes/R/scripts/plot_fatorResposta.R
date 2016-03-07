rm(list=ls())
source("myfunctions/load.R")

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

