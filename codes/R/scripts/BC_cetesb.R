rm(list=ls())
source("myfunctions/load.R")

# Copiado do Américo
coefs_akerr = c(88.3336,-42.96398)
dados = read.csv('../../inputs/BlackCarbon/americo/amostras_Cetesb2012.csv')

# Pontos experimentais
x = log10(dados$refletancia)
y = dados$ug_cm2
y_erro = dados$erro_massa 

# Ajuste polinomial, vou ajustar, mas vou mostrar o do Américo
model <- lm(y ~ poly(x,1,raw=TRUE))
coefs_thiago = model$coefficients
coefs_thiago = as.vector(coefs_thiago)
coefs = coefs_thiago 

pdf('../../outputs/BC_cetesb.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 3, 0, 0))
#par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), mar=c(0, 0, 0, 0), new=TRUE)
plot(0,0,
     xlim = c(0.4,2.2),
     ylim = c(0,100),
     type = "n",
     xlab = 'Refletância em %',
     ylab = expression(frac(mu*g,cm^2)),
     axes=F)

log10.axis(1, at=seq(0, 100, 1))
#axis(side=1, at=seq(0.4, 2.2, by=0.05))
axis(side=2, at=seq(0, 100, by=10))
box()

p <- polynomial(coefs_thiago)
lines(p,xlim = c(0.4,2.2),col='red')

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
l1 = expression('ajuste linear: a + bx\n')
l2 = paste(letters[1:2],format(coefs, scientific=F),sep=' = ')
l2 = paste(l2,'\n',sep='')
l2 = paste(l2,collapse=" ")
l2 = gsub('\\.',',',l2)

legend("topright", legend = paste(l1,l2),bty="n",cex=1.3)

dev.off()

# Exporta tabela para Latex
dados = read.csv('../../inputs/BlackCarbon/americo/amostras_Cetesb2012.csv')
ajustado = p[1] + p[2]*log10(dados$refletancia)
dados = cbind(dados,ajustado)

# Ajustado
dados[,c(8,7)] = fix_significativos(dados[,c(8,7)])
ajustado_com_erro=paste(dados$ajustado,dados$erro_matricial,sep="$\\pm$")
dados = cbind(dados,ajustado_com_erro)

# Medido
dados[,c(4,5)] = fix_significativos(dados[,c(4,5)])
balanca = paste(dados$ug_cm2,dados$erro_massa,sep='$\\pm$')
dados = cbind(dados,balanca)

#efetivo
tmp = fix_significativos(dados[,c(8,6)])
dados$erro_efetivo = tmp$erro_efetivo

# ref
dados$refletancia = sprintf('%.1f',dados$refletancia)

# vírgulas
tabela = dados[,c(1,2,10,6,9)] 
tabela[,2] = str_replace_all(tabela[,2],'\\.',',')
tabela[,3] = str_replace_all(tabela[,3],'\\.',',')
tabela[,4] = str_replace_all(tabela[,4],'\\.',',')
tabela[,5] = str_replace_all(tabela[,5],'\\.',',')

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('ID & Refletância (\\%) & Gravimetria & $\\sigma_{efetivo}$ & Ajustado \\\\\n',
                      '& $\\pm$ 1,1\\% & $\\mu g/cm^2$ & $\\mu g/cm^2$ & $\\mu g/cm^2$   \\\\\n')

print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      include.colnames = F,
      add.to.row = addtorow,
      sanitize.text.function = identity,
      file="../../outputs/cetesb2012.tex")