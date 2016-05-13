rm(list=ls())
source("myfunctions/load.R")

#### Filtros Monarch 71 (filtros do IFUSP)
ref2007 = read.csv('../../inputs/BlackCarbon/americo/Refletancia2007.csv')
x = ref2007$Log10Ref
y = ref2007$ug_cm2
y_erro = ref2007$erro_ug_cm2 

# Ajuste polinomial, vou ajustar, mas vou mostrar a do Lapat
model <- lm(y ~ poly(x,1,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
coefs_lapat = c(82.8046,-72.8235,15.7169)

pdf('../../outputs/BC_monarch71.pdf')
# Gráfico empty
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))
#par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), mar=c(0, 0, 0, 0), new=TRUE)

plot(0,0,
     xlim = c(1,2),
     ylim = c(0,26),
     type = "n",
     xlab = 'Log10 da refletância em %',
     ylab = expression(mu~g~cm^-2),
     axes=F)

axis(side=1, at=seq(1, 2, by=0.05))
axis(side=2, at=seq(0, 26, by=2))
box()

p <- polynomial(coefs_thiago)
lines(p,xlim = c(1.5,2),col='red')

p <- polynomial(coefs_thiago)
lines(p,xlim = c(1,1.5),col='red',type="l", lty=2)

p <- polynomial(coefs_lapat)
lines(p,xlim = c(1.5,2),col='blue')

p <- polynomial(coefs_lapat)
lines(p,xlim = c(1,1.5),col='blue',type="l", lty=2)

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda R e p-value
pvalue = signif(pvalue(model),3)
rsquared = summary(model)$r.squared
rsquared = signif(rsquared,2)

rsquared = str_replace(rsquared,'\\.',',')
code = paste0('expression(R^2~"= ',rsquared,'")') 
l1 = eval(parse(text=code))

pvalue = str_replace(pvalue,'\\.',',')
code = paste0('expression(p < ~" ',pvalue,'")') 
l2 = eval(parse(text=code))

legend("bottomleft", legend = c(l1,l2), cex=1.3, bty = "n",horiz=T)

# legenda
legend("top", legend = expression('ajuste polinomial: ' ~ a + bx + cx^2), cex=1.2, bty = "n",inset=c(-0.5,0))

# Legenda Thiago
legenda = paste(letters[1:2],format(coefs_thiago, scientific=F),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('ajuste 1°: \n',legenda)
legenda_thiago = legenda

# Legenda Lapat
legenda = paste(letters[1:3],format(coefs_lapat, scientific=F),sep=' = ')
legenda = paste(legenda,'\n',sep='')
legenda = paste(legenda,collapse=" ")
legenda = gsub('\\.',',',legenda)
legenda = paste('ajuste 2°: \n',legenda)
legenda_lapat = legenda

legenda = c(legenda_lapat,legenda_thiago)
legend("topright",legend = legenda, col=c('blue','red'),pch = 15, cex=1.2, bty = "n",ncol=1)

dev.off()

# Exporta tabela para Latex
ref2007 = read.csv('../../inputs/BlackCarbon/americo/Refletancia2007.csv')
p = c(34.14473,-17.39258)
ajuste_thiago = p[1] + p[2]*ref2007$Log10Ref
ref2007 = cbind(ref2007,ajuste_thiago)

ref2007[,2:3] = fix_significativos(ref2007[,2:3])
fabricante= paste(ref2007$ug_cm2,ref2007$erro_ug_cm2,sep=' $\\pm$ ')
ref2007 = cbind(ref2007,fabricante)

ref2007$Monarch21 = sub('BC','',ref2007$Monarch21)
ref2007$Monarch21 = as.integer(ref2007$Monarch21)

tabela = ref2007[,c(1,4,5,6,7,11,10)]
tabela[,2:5] = format(round(tabela[,2:5],1),nsmall=1,decimal.mark=',')

tabela[,7] = sprintf("%.2f",tabela[,7])
tabela[,6] = str_replace_all(tabela[,6],'\\.',',')
tabela[,7] = str_replace_all(tabela[,7],'\\.',',')

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('ID & \\multicolumn{4}{c}{Refletâncias (\\%)} & Alvo Padrão & Ajustado   \\\\\n',
                      '   & 1 & 2 & 3 & média & $\\mu g/cm^2$ & $\\mu g/cm^2$   \\\\\n')

print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      include.colnames = F,
      add.to.row = addtorow,
      sanitize.text.function = identity,
      file="../../outputs/BC_monarch71.tex")

