source("myfunctions/load.R")

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# Fontes encontradas em Harvard:
#   Solid waste burning: Br. 
#   Road dust & vehicle: Al, Si, Ca, Fe, Zn, BC.  
#   Crustal: Al, Si, Mg, Ti, Mn, Fe.
#   Aged biomass particles: K, Cl, S, BC
#   Fresh biomass burning: K, Cl, S, BC
#   Sea salt: Na, Cl, S

# Zn/Cu podem representa veículos por causa do mencanismo interno do carro. 
# Zn: Freio, pneu, peças.

## RFsH
base<-read.csv("../../outputs/pca/RFsH.csv",header=TRUE)

# Datas serão usadas no gráfico dos factor scores
datas<-base$Date
base = base[,-1]

# Colunas removidas
removidos<-c('Cr','Br','Rb','Sr','Zr','Cu','Zn','Ni')
base = base[,!(colnames(base) %in% removidos)]

# PCA igual a do SPSS
base.principal<-principal(base,nfactors=5,rotate="varimax")

# Loadings
base.principal = fa.sort(base.principal)
print(loadings(base.principal),cutoff=2e-1)
loaging_latex = fa2latex(base.principal,
                         font.size = 'tiny',
                         caption='Loadings RFsH')
write(loaging_latex,file='../../outputs/loadings_RFsH.tex')


# Scree plot
png(file='../../outputs/RFsH_scree_plot.png')
plot(base.principal$values,type='b',
     ylab='Autovalor',
     xlab='Componentes',
     main = 'Scree Plot RFsH')
dev.off()
dev.off()


base.principal$communality
base.principal$uniquenesses
base.principal$values
base.principal$fit
base.principal$fit.off
base.principal$complexity
base.principal$chi
base.principal$EPVAL
base.principal$objective
base.principal$residual
base.principal$rms
base.principal$dof
base.principal$null.model
base.principal$criteria
base.principal$STATISTIC
base.principal$PVAL
base.principal$weights
base.principal$r.scores
base.principal$Structure
base.principal$scores
base.principal$order



#scores 
#TODO: Arrumar o eixo x para mostrar os meses
pdf(file='../../outputs/AFCH_factor_scores.pdf')
par(mfrow=c(3,1)) 
 plot(datas,base.principal$scores[,1])
 plot(datas,base.principal$scores[,2])
 plot(datas,base.principal$scores[,3])
dev.off()
dev.off()

#Comunalidade
print(xtable(data.frame(base.principal$communality)), 
      type="latex", 
      include.rownames = T, 
      sanitize.text.function = identity,
      file="../../outputs/AFCH_communality.tex")

#Uniquenesses
base.fa$uniquenesses
fa2latex(base.principal)
#loadings
print(fa2latex(base.principal), 
      type="latex", 
      include.rownames = T, 
      sanitize.text.function = identity,
      file="../../outputs/AFCH_loadings.tex")


# Os factor loading são diferentes do SPSS, pois o SPSS usa kaiser normalization
kaiser(base.fa,rotate="varimax")


##########################################
modelPCA<-principal(base,nfactor=3,rotate="varimax")
plot(modelPCA$value,type="b") # Para ver quantos fatores reter

#Correlacao reproduzida e comunalidade (R^2 ???)
y = factor.model(modelPCA$loadings)
comunalidade = diag(y)

#Diferenca entre a correlacao estimada pelo modelo e a observada
#singularidade: 1 - comunalidade (variancia explicada)
residuo<-factor.residuals(xcor,modelPCA$loadings)
singularidade<-diag(residuo)
View(singularidade)

#Plotar o residuo para ver se ele eh normalmente distribuido
hist(residuo)

#Rotacao Varimax
modelPCAvarimax<-principal(base,nfactor=4,rotate="varimax")
plot(modelPCAvarimax$value,type="b")

#Matrix loading, classificando por loading cortando em 0.3
#h2 comunalidade e u2 a uniciidade (ou singularidade)
print.psych(modelPCAvarimax,cut=0.3,sort=TRUE)

#Rotacao Promax
modelPCApromax<-principal(base,nfactor=4,rotate="promax")

#Matrix loading, classificando por loading cortando em 0.3
#h2 comunalidade e u2 a unicidade (ou singularidade)
#Olhar a correlao dos fatores entre si.
print.psych(modelPCApromax,cut=0.3,sort=TRUE)


#Factor socores from PCA
modelPCAscores<-principal(base,nfactors=4,rotate="varimax",score=TRUE)
modelPCAscores
scores<-modelPCAscores$scores
plot(scores[,1:2])
plot(scores[,c(1,3)])
plot(scores[,c(1,4)])
plot(scores[,c(2,3)])
plot(scores[,c(2,4)])
plot(scores[,c(3,4)])




load = modelPCA$rotation
load

# DotPlot PC1
sorted.loadings = load[order(load[,1]),1]
Main="Loadings Plot for PC1" 
xlabs="Variable Loadings"
dotplot(sorted.loadings,main=Main,xlab=xlabs,cex=1.5,col="red")

# DotPlot PC3
sorted.loadings = load[order(load[,3]),3]
Main="Loadings Plot for PC2"
xlabs="Variable Loadings"
dotplot(sorted.loadings,main=Main,xlab=xlabs,cex=1.5,col="red")

# Scores = matriz concentração X Matriz de loadings
scores <- acc2.5ajustado %*% acc2.5eigen$vectors
plot(scores)
abline(0,0,col="red")
abline(0,90,col="blue")

#numero de fatores
ev <- eigen(cor(base,use='pairwise.complete.obs')) # get eigenvalues
ap <- parallel(subject=nrow(base),var=ncol(base),rep=100,cent=.05)
nS <- nScree(ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS) 

omega(base)

#Não sei se eu incluirei essa análise mais detalhada!
#Correlation Matrix
#base.cor<-round(cor(base),2) 
#corrplot(base.cor, type = "lower",method="circle")

#Bartlet Test: p.value pequeno rejeitamos a hipotese de correlaçao nula (matriz identidade)
#cortest.bartlett(base,nrow(base))

#determinante: but can do the determinant need it to be above 0.00001
#det(base.cor) ###PROBLEMA
