#rm(list=ls())
source("myfunctions/load.R")

ref2007 = read.csv('../../inputs/CalibracaoRefletancia2007.csv')
x = ref2007$Log10Ref
y = ref2007$ug_cm2
y_erro = ref2007$erro_ug_cm2 

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Lapat
model <- lm(y ~ poly(x,2,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
coefs_lapat = c(82.8046,72.8235,15.7169)

pdf('../../outputs/CalibracaoRefletancia2007Lapat.pdf')
# Gráfico 'vazio'
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))
#par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), mar=c(0, 0, 0, 0), new=TRUE)
plot(0,0,
     xlim = c(1.5,2),
     ylim = c(0,10),
     type = "n",
     xlab = 'Log10 da refletância em %',
     ylab = expression(frac(mu*g,cm^2)),
     axes=F)

axis(side=1, at=seq(1.5, 2, by=0.05))
axis(side=2, at=seq(0, 10, by=1))

p <- polynomial(coefs_thiago)
lines(p,xlim = c(1.5,2),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
legend("topleft", legend = expression(a + bx + cx^2), cex=0.8, bty = "n")

legenda = paste(letters[1:3],format(coefs_lapat, scientific=T),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste \n polinomial grau 2: \n\n',legenda)
#legenda = c(legenda,'Medidas')

#legend("bottomright", legend = legenda, inset=c(-0.2,0), col=c('red','black'), pch = 15, cex=0.7, bty = "n")
legend("topright", legend = legenda, col='red',inset=c(0,-0.1),pch = 15, cex=0.8, bty = "n")

dev.off()

# Exporta tabela para Latex
tabela = ref2007[,c(1,2,3,4,5,6)]

colnames(tabela) = c('Monarca21IFUSP','ugcm2','erro','ref1','ref2','ref3')
print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/CalibracaoRefletancia2007.tex")
