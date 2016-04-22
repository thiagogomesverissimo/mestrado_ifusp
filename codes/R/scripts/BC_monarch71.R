#rm(list=ls())
source("myfunctions/load.R")

#### Filtros Monarch 71 (filtros do IFUSP)
ref2007 = read.csv('../../inputs/BlackCarbon/americo/Refletancia2007.csv')
x = ref2007$Log10Ref
y = ref2007$ug_cm2
y_erro = ref2007$erro_ug_cm2 

# Ajuste polinomial, vou ajustar, mas vou mostrar a do Lapat
#model <- lm(y ~ poly(x,2,raw=TRUE))
model <- lm(y ~ poly(x,1,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
#coefs_lapat = c(82.8046,72.8235,15.7169)

pdf('../../outputs/BC_monarch71.pdf')
# Gráfico empty
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
#legend("topleft", legend = expression(a + bx + cx^2), cex=0.8, bty = "n")
legend("topleft", legend = expression(a + bx), cex=0.8, bty = "n")

#legenda = paste(letters[1:3],format(coefs_lapat, scientific=T),sep=' = ')
legenda = paste(letters[1:2],format(coefs_thiago, scientific=T),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste linear: \n\n',legenda)
#legenda = c(legenda,'Medidas')

#legend("bottomright", legend = legenda, inset=c(-0.2,0), col=c('red','black'), pch = 15, cex=0.7, bty = "n")
legend("topright", legend = legenda, col='red',inset=c(0,-0.1),pch = 15, cex=0.8, bty = "n")

dev.off()

# Exporta tabela para Latex
ajuste_thiago = p[1] + p[2]*ref2007$Log10Ref
ref2007 = cbind(ref2007,ajuste_thiago)

fabricante= paste(ref2007$ug_cm2,ref2007$erro_ug_cm2,sep='$\\pm$')
ref2007 = cbind(ref2007,fabricante)

ref2007$Monarch21 = sub('BC','',ref2007$Monarch21)
ref2007$Monarch21 = as.integer(ref2007$Monarch21)

#incerteza_relativa = (ref2007$ug_cm2 - ref2007$ajuste_thiago)/ref2007$ug_cm2
#ref2007 = cbind(ref2007,incerteza_relativa)

tabela = ref2007[,c(1,4,5,6,11,10)]

colnames(tabela) = c('ID','Ref1','Ref2','Ref3','fabricante','ajustado')
print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/BC_monarch71.tex")

