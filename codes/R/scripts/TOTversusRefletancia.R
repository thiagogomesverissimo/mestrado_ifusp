#rm(list=ls())
source("myfunctions/load.R")

# Pontos experimentais
dados = read.csv('../../inputs/BlackCarbon/americo/Gana_TOT_Refletancia.csv')
dados = dados[-1,]
x = log10(dados$refletancia)
y = dados$tot.ugcm2
y_erro = dados$Incerteza.efetiva

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,4,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
coefs_akerr = c(96.0195,-174.675,139.44272,-53.08335,7.51411)

pdf('../../outputs/Gana_TOT_Refletancia.pdf')
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
legend("topleft", legend = expression(a + bx + cx^2 + dx^3 + ex^4), cex=1, bty = "n")

legenda = paste(letters[1:5],format(coefs_akerr, scientific=T,digits=3,nsmall=3),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste \n polinomial grau 4: \n\n',legenda)
#legenda = c(legenda,'Medidas')

#legend("bottomright", legend = legenda, inset=c(-0.2,0), col=c('red','black'), pch = 15, cex=0.7, bty = "n")
legend("topright", legend = legenda, col='red',inset=c(0.1,-0.1),pch = 15, cex=1, bty = "n")

dev.off()

# ajuste
x = log10(dados$refletancia)
ajuste_thiago = p[1] + p[2]*x + p[3]*x^2 + p[4]*x^3 + p[5]*x^4
dados = cbind(dados,ajuste_thiago)

# Exporta tabela para Latex
dados[,3:9] = format(dados[,3:9],digits=2,nsmall=2)

tot = paste(dados$tot.ugcm2,dados$Tot.incerteza,sep='$\\pm$')
dados = cbind(dados,tot)

ajuste_thiago = paste(dados$ajuste_thiago,dados$ajuste.incerteza,sep='$\\pm$')
dados = cbind(dados,ajuste_thiago)

tabela = dados[,c(1,2,6,10,8,11)]

colnames(tabela)<- c('quartzo','teflon','refletancia','tot','efetiva','ajuste')

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/Gana_TOT_Refletancia.tex")
