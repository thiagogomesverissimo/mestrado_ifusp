rm(list=ls())
source("myfunctions/load.R")

####
#TODO: Intercalibração com Pierre
dados=read.csv('../../inputs/BlackCarbon/americo/Pierre_calib_TJQuadros.csv')
x = log10(dados$ref.policarbonado)
y = dados$TOT_ug_cm2
y_erro = dados$efetiva

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,1,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
#coefs_akerr = c()
coefs = coefs_thiago

pdf('../../outputs/JQ_TOT_Refletancia.pdf')

mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0,2),
     ylim = c(0,20),
     type = "n",
     xlab = 'Refletância(%)',
     ylab = expression('TOT ('~mu*g ~ cm^-2~')'),
     axes=F)

log10.axis(1, at=seq(0, 100, 1))
#axis(side=1, at=seq(0, 2, by=0.2))
axis(side=2, at=seq(0, 20, by=2))
box()

p <- polynomial(coefs)
lines(p,xlim = c(0.4,2),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda R e p-value
pv = pvalue(model)
pv = signif(pv,3)
rsquared = summary(model)$r.squared
rsquared = signif(rsquared,2)

rsquared = str_replace(rsquared,'\\.',',')
code = paste0('expression(R^2~"= ',rsquared,'")') 
l1 = eval(parse(text=code))

pv = str_replace(pv,'\\.',',')
code = paste0('expression(p < ~" ',pv,'")') 
l2 = eval(parse(text=code))

legend("bottom", legend = c(l1,l2), cex=1.3, bty = "n",horiz=T)

####  
l1 = expression('ajuste linear: a + bx\n')

l2 = paste(letters[1:2],format(coefs, scientific=F),sep=' = ')
l2 = paste(l2,'\n',sep='')
l2 = paste(l2,collapse=" ")
l2 = gsub('\\.',',',l2)

legend("topright", legend = paste(l1,l2),bty="n",cex=1.3)

dev.off()

#########################

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
coefs = coefs_thiago

pdf('../../outputs/BC_janio_quadros.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))

plot(0,0,
     xlim = c(0,60),
     ylim = c(0,60),
     type = "n",
     xlab = expression('Massa calculada com alvos padrões produzidos na CETESB (' ~ mu*g ~cm^-2 ~')' ),
     ylab = expression('Alvos paralelos quartzo TOT (' ~ mu*g ~cm^-2 ~ ')'),
     axes=F)

axis(side=1, at=seq(0, 60, by=10))
axis(side=2, at=seq(0, 60, by=10))
box()

p <- polynomial(coefs_thiago)
lines(p,xlim = c(0,60),col='red')

errbar(x,y,y + y_erro, y - y_erro, pch=20, add=TRUE)

# legenda R e p-value
pv = pvalue(model)
pv = signif(pv,3)
rsquared = summary(model)$r.squared
rsquared = signif(rsquared,2)

rsquared = str_replace(rsquared,'\\.',',')
code = paste0('expression(R^2~"= ',rsquared,'")') 
l1 = eval(parse(text=code))

pv = str_replace(pv,'\\.',',')
code = paste0('expression(p < ~" ',pv,'")') 
l2 = eval(parse(text=code))

legend("center", legend = c(l1,l2), cex=1.3, bty = "n",horiz=T)

#
l1 = expression('ajuste linear: a + bx\n')
l2 = paste(letters[1:2],format(coefs, scientific=F),sep=' = ')
l2 = paste(l2,'\n',sep='')
l2 = paste(l2,collapse=" ")
l2 = gsub('\\.',',',l2)

legend("topright", legend = paste(l1,l2),bty="n",cex=1.3)

dev.off()

# Exporta tabela para Latex
dados = read.csv('../../inputs/BlackCarbon/americo/janio_quadros.csv')
dados[,2:3] = fix_significativos(dados[,2:3])
dados[,4:5] = fix_significativos(dados[,4:5])

tot = paste(dados$TOT,dados$TOT_incerteza,sep='$\\pm$')
dados = cbind(dados,tot)

cetesb = paste(dados$cetesb,dados$cetesb_incerteza,sep='$\\pm$')
dados = cbind(dados,cetesb)

tabela = dados[,c(1,6,7)]

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('ID &  TOT$^1$ & CETESB$^2$   \\\\\n',
                      '   & \\multicolumn{2}{c}{$\\mu g/cm^2$ }  \\\\\n')

print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      include.colnames = F,
      add.to.row = addtorow,
      sanitize.text.function = identity,
      file="../../outputs/BC_janio_quadros.tex")

