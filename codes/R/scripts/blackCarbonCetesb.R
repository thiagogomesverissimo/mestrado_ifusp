#rm(list=ls())
source("myfunctions/load.R")

# Copiado do Américo
coefs_akerr = c(-42.96398,88.3336)
dados = read.csv('../../inputs/BlackCarbon/calibration/amostras_Cetesb2012.csv')

# Pontos experimentais
x = log10(dados$refletancia)
y = dados$ug_cm2
y_erro = dados$erro_massa 

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,2,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)

pdf('../../outputs/BlackCarbonCetesb.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))
#par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), mar=c(0, 0, 0, 0), new=TRUE)
plot(0,0,
     xlim = c(0.4,2.2),
     ylim = c(0,100),
     type = "n",
     xlab = 'Log10 da refletância em %',
     ylab = expression(frac(mu*g,cm^2)),
     axes=F)

axis(side=1, at=seq(0.4, 2.2, by=0.05))
axis(side=2, at=seq(0, 100, by=10))

p <- polynomial(coefs_thiago)
lines(p,xlim = c(0.4,2.2),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
legend("topleft", legend = expression(a + bx + cx^2), cex=0.8, bty = "n")

legenda = paste(letters[1:3],format(coefs_akerr, scientific=T),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste \n polinomial grau 2: \n\n',legenda)
#legenda = c(legenda,'Medidas')

#legend("bottomright", legend = legenda, inset=c(-0.2,0), col=c('red','black'), pch = 15, cex=0.7, bty = "n")
legend("topright", legend = legenda, col='red',inset=c(0,-0.1),pch = 15, cex=0.8, bty = "n")

dev.off()

# Exporta tabela para Latex
tabela = dados

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/BlackCarbonCetesb2012.tex")
