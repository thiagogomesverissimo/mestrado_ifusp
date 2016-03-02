rm(list=ls())
source("myfunctions/load.R")

coefs_akerr = c(96.0195,-174.675,139.44272,-53.08335,7.51411)

# Gráfico 'vazio'
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0,2),
     ylim = c(0,100),
     type = "n",
     xlab = 'Refletância (%)',
     ylab = expression(TOT*(frac(mu*g,cm^2))),
     axes=F)

axis(side=1, at=seq(0, 2, by=0.1))
axis(side=2, at=seq(0, 100, by=10))

p <- polynomial(coefs_akerr)
lines(p,xlim = c(0,2),col='red')

# Adiciona pontos experimentais
dados = read.csv('../../inputs/TOT_Refletancia.csv')
x = log10(dados$Refl)
y = dados$EC.ug.sq.cm.
y_erro = dados$EC.unc 
errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
if (line=='K'){
  legend("top", legend = expression(a + bx + cx^2 + dx^3), cex=0.7, bty = "n")
  legenda1 = paste(letters[1:4],format(coefs1, scientific=T),sep=' = ')
  legenda1 = paste(legenda1,'\n',sep='')
  legenda1 = paste(legenda1,collapse=" ")
  legenda1 = gsub('\\.',',',legenda1)
  legenda1 = paste('\n Coeficientes do ajuste polinomial \n de grau 3 para número atômico (Z) \n de 11 até 26: \n\n ',legenda1)
  
  legenda2 = paste(letters[1:4],format(coefs2, scientific=T),sep=' = ')
  legenda2 = paste(legenda2,'\n',sep='')
  legenda2 = paste(legenda2,collapse=" ")
  legenda2 = gsub('\\.',',',legenda2)
  legenda2 = paste('\n Coeficientes do ajuste polinomial \n de grau 3 para número atômico (Z) \n de 22 até 43: \n\n',legenda2)
  
  legenda = c(legenda1,legenda2,'Pontos experimentais medidos \n com alvos de calibração')
}
if (line=='L') {
  legend("top", legend = expression(a + bx + cx^2 + dx^3 + ex^4 + fx^5), cex=0.7, bty = "n")
  legenda = paste(letters[1:6],format(coefs1, scientific=T),sep=' = ')
  legenda = paste(legenda,'\n',sep='')
  legenda = paste(legenda,collapse=" ")
  legenda = gsub('\\.',',',legenda)
  legenda = paste('\n Coeficientes do ajuste polinomial \n de grau 5  para número atômico (Z) \n de 29 até 82: \n\n',legenda)
  legenda = c(legenda,'Pontos experimentais medidos \n com alvos de calibração')
}

legend("topleft", legend = legenda, col=cores, pch = 15, cex=0.7, bty = "n")

