#rm(list=ls())
source("myfunctions/load.R")

# Copiado do Américo
dados = read.csv('../../inputs/BlackCarbon/americo/janio_quadros.csv')

# Pontos experimentais
x = dados$cetesb
y = dados$TOT
y_erro = sqrt(dados$cetesb_incerteza^2 + dados$TOT_incerteza^2)

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,1,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)

pdf('../../outputs/BC_janio_quadros.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0,60),
     ylim = c(0,60),
     type = "n",
     xlab = expression(paste('Refletância CETESB (',frac(mu*g,cm^2),')')),
     ylab = expression(paste('TOT (',frac(mu*g,cm^2),')')),
     axes=F)

axis(side=1, at=seq(0, 60, by=10))
axis(side=2, at=seq(0, 60, by=10))

p <- polynomial(coefs_thiago)
lines(p,xlim = c(0,60),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
legend("topleft", legend = expression(a + bx), cex=1.2, bty = "n")

legenda = paste(letters[1:2],format(coefs_thiago, scientific=T),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste linear: \n\n',legenda)

legend("topright", legend = legenda, col='red',inset=c(0,-0.1),pch = 15, cex=1.4, bty = "n")
dev.off()

# Exporta tabela para Latex
dados[,2:5] = format(dados[,2:5],digits=2,nsmall=2)

tot = paste(dados$TOT,dados$TOT_incerteza,sep='$\\pm$')
dados = cbind(dados,tot)

cetesb = paste(dados$cetesb,dados$cetesb_incerteza,sep='$\\pm$')
dados = cbind(dados,cetesb)

tabela = dados[,c(1,6,7)]
colnames(tabela) = c('ID','tot','cetesb')

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/BC_janio_quadros.tex")
