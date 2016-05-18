rm(list=ls())
source("myfunctions/load.R")

# Pontos experimentais
dados = read.csv('../../inputs/BlackCarbon/americo/Gana_TOT_Refletancia.csv')
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
     xlim = c(0,2),
     ylim = c(0,50),
     type = "n",
     xlab = 'Refletância(%)',
     ylab = expression('TOT ('~mu*g ~ cm^-2~')'),
     axes=F)

log10.axis(1, at=seq(0, 100, 1))
#axis(side=1, at=seq(0, 2, by=0.1))
axis(side=2, at=seq(0, 50, by=5))
box()

p <- polynomial(coefs_akerr)
lines(p,xlim = c(0.4,2),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda
legend("topleft", legend = expression(a + bx + cx^2 + dx^3 + ex^4), cex=1, bty = "n")

legenda = paste(letters[1:5],format(coefs_akerr, scientific=F),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('\n Coeficientes do ajuste \n polinomial de grau 4: \n\n',legenda)

#legend("topright", legend = legenda, col='red',inset=c(0.1,-0.1), cex=1.1, bty = "n")
legend("topright", legend = legenda, col='red', cex=1.1, bty = "n")

dev.off()

# ajuste
x = log10(dados$refletancia)
ajuste_thiago = p[1] + p[2]*x + p[3]*x^2 + p[4]*x^3 + p[5]*x^4
dados = cbind(dados,ajuste_thiago)

#### Exporta tabela para Latex

# manobra para corrigir os significativos da incerteza efetiva
dados = cbind(dados,dados[,3])
dados[,c(10,5)] = fix_significativos(dados[,c(10,5)])

# TOT
dados[,3:4] = fix_significativos(dados[,3:4])
tot = paste(dados$tot.ugcm2,dados$Tot.incerteza,sep='$\\pm$')
dados = cbind(dados,tot)

# ajuste
dados[,c(9,8)] = fix_significativos(dados[,c(9,8)])
ajuste_thiago = paste(dados$ajuste_thiago,dados$ajuste.incerteza,sep='$\\pm$')
dados = cbind(dados,ajuste_thiago)

tabela = dados[,c(1,2,6,11,5,12)]

tabela[,3] = str_replace_all(tabela[,3],'\\.',',') #refletancia
tabela[,4] = str_replace_all(tabela[,4],'\\.',',') #tot 
tabela[,5] = str_replace_all(tabela[,5],'\\.',',') # efetiva
tabela[,6] = str_replace_all(tabela[,6],'\\.',',') #ajuste
 
addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('ID-Quartzo & ID-PTFE & refletância (\\%) & TOT  & $\\sigma_{efetivo}$ & Ajustado   \\\\\n',
                      '\\hline & & \\multicolumn{1}{c}{  $\\pm$ 1,1\\% } & \\multicolumn{3}{c}{$\\mu g/cm^2$ }  \\\\\n')

print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      include.colnames = F,
      add.to.row = addtorow,
      sanitize.text.function = identity,
      file="../../outputs/Gana_TOT_Refletancia.tex")

#### Comparação da nova calibração com monarch71

acc = read.csv('../../inputs/BlackCarbon/refletancia/ACC.csv',header=F)
gha = read.csv('../../inputs/BlackCarbon/refletancia/GHA.csv',header=F)
gpe = read.csv('../../inputs/BlackCarbon/refletancia/gpe.csv',header=F)
afr = read.csv('../../inputs/BlackCarbon/refletancia/afr.csv',header=F)

# agrega
refletancias = rbind(afr,gha,gpe,acc)
refletancias = TrataID(refletancias,1)
rownames(refletancias) = refletancias[,1]

# Nima MP2.5
nima = read.csv('../../outputs/pmConc.csv')
nima = subset(nima,nima$SampleType == 'PM2.5')
rownames(nima) = nima[,1]

# refletâncias em Nima
refletancias_nima = refletancias[rownames(nima),]
refletancias_nima = refletancias_nima[,-3:-4]
refletancias_nima = refletancias_nima[refletancias_nima[,2]>10,]

# ajustes com Monarch71 linear
x=log10(refletancias_nima$V2)
p = c(34.14473,-17.39258)
calibM71_linear = p[1] + p[2]*x

# ajustes com Monarch71 segundo grau lapat
x=log10(refletancias_nima$V2)
p = c(82.8046,-72.8235,15.7169) #lapat
calibM71_lapat = p[1] + p[2]*x + p[3]*x^2

# ajuste com tot
p = c(96.0195,-174.675,139.44272,-53.08335,7.51411)
calibTOT = p[1] + p[2]*x + p[3]*x^2 + p[4]*x^3 + p[5]*x^4

pdf('../../outputs/BC_compara_calibs.pdf')

mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0,100),
     ylim = c(0.5,2.7),
     type = "n",
     xlab = 'Refletância (%)',
     ylab = 'Calibração antiga com M71 / Calibração nova com TOT',
     axes=F)

axis(side=1, at=seq(0, 100, by=10))
axis(side=2, at=seq(0.5,2.7, by=0.1))
box()

points(refletancias_nima[,2],calibM71_linear/calibTOT,col='blue')
points(refletancias_nima[,2],calibM71_lapat/calibTOT,col='red')
legenda=c('M71 com ajuste de 1° Grau',
         'M71 com ajuste de 2° Grau')
legend('topright',legenda, ncol=1,col=c('blue','red'),bty='n',pch = 15, cex=1)

dev.off()

# recife 
recife = read.csv('../../inputs/BlackCarbon/americo/recife.csv')
recife = recife[!is.na(recife$refletancia),]
recife = recife[recife$refletancia<95,]
x = log10(recife$refletancia)
p = c(16.9023755079,-8.451187754) # TOT recife
recife_TOT = p[1] + p[2]*x 

p = c(82.8046,-72.8235,15.7169) #lapat
recife_lapat = p[1] + p[2]*x + p[3]*x^2

# thiago
p = c(34.14473,-17.39258)
recife_lapat_linear = p[1] + p[2]*x 

pdf('../../outputs/BC_compara_calibs_recife.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))
plot(0,0,
     xlim = c(0,100),
     ylim = c(0.5,2.7),
     type = "n",
     xlab = 'Refletância (%)',
     ylab = 'Calibração antiga com M71 / Calibração nova com TOT',
     axes=F)

axis(side=1, at=seq(0, 100, by=10))
axis(side=2, at=seq(0.5,2.7, by=0.1))
box()

#points(recife$refletancia,recife_lapat_linear/recife_TOT,col='blue')
points(recife$refletancia,recife_lapat/recife_TOT,col='red')
legenda=c('M71 com ajuste de 2° Grau')
legend('topright',legenda, ncol=1,col=c('red'),bty='n',pch = 15, cex=1)

dev.off()