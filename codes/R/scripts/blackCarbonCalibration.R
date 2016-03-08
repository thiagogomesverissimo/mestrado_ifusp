rm(list=ls())
source("myfunctions/load.R")

# Pontos experimentais
dados = read.csv('../../inputs/TOT_Refletancia.csv')
x = log10(dados$Refl)
y = dados$EC.ug.sq.cm.
y_erro = dados$EC.unc 

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,4,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
coefs_akerr = c(96.0195,-174.675,139.44272,-53.08335,7.51411)

pdf('../../outputs/TOTrefletanciaCalibration.pdf')
# Gráfico 'vazio'
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0.2,2),
     ylim = c(0,50),
     type = "n",
     xlab = 'Refletância (%)',
     ylab = expression(TOT*(frac(mu*g,cm^2))),
     axes=F)

axis(side=1, at=seq(0.2, 2, by=0.1))
axis(side=2, at=seq(0, 50, by=5))

p <- polynomial(coefs_akerr)
lines(p,xlim = c(0.4,2),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
legend("topleft", legend = expression(a + bx + cx^2 + dx^3 + ex^4), cex=0.8, bty = "n")

legenda = paste(letters[1:5],format(coefs_akerr, scientific=T),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste \n polinomial grau 4: \n\n',legenda)
#legenda = c(legenda,'Medidas')

#legend("bottomright", legend = legenda, inset=c(-0.2,0), col=c('red','black'), pch = 15, cex=0.7, bty = "n")
legend("topright", legend = legenda, col='red',inset=c(0.1,-0.1),pch = 15, cex=0.8, bty = "n")

dev.off()

# Exporta tabela para Latex
dados = dados[-1,-1]
colnames(dados) = c('Quartzo','Teflon','ugcm2','erro','efetivo','efetivo8','refletancia','errorefl')

tabela = dados
print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/TOTcalibration.tex")
