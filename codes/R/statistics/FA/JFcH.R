rm(list=ls())
setwd("~/repos/mymaster_physics/codes/R")
source("myfunctions/load.R")

base<-read.csv("../../outputs/concentrations/JFcH.csv",header=TRUE,dec=".")

#Datas: serão usadas no gráfico dos factor scores
datas<-base$Date

#ver elementos
colnames(base)

#Colunas removidas
removidos<-c('SampleID','Date','Cr','Br','Rb','Sr','Zr','Cu','Zn')

base = base[,!(colnames(base) %in% removidos)]

#Não sei se eu incluirei essa análise mais detalhada!
#Correlation Matrix
#base.cor<-round(cor(base),2) 
#corrplot(base.cor, type = "lower",method="circle")

#Bartlet Test: p.value pequeno rejeitamos a hipotese de correlaçao nula (matriz identidade)
#cortest.bartlett(base,nrow(base))

#determinante: but can do the determinant need it to be above 0.00001
#det(base.cor) ###PROBLEMA


#Estima quantidade de Fatores
fa.parallel(base)

#PCA
base.principal<-principal(base,nfactors=3,rotate="varimax")

base.principal$factors

#Classifica elementos pelos loadings
base.principal = fa.sort(base.principal)
base.principal
#Scree plot
png(file='../../outputs/AFCH_scree_plot.png')
plot(base.principal$values,type='b',
     ylab='Autovalor',
     xlab='Componentes',
     main = 'AFCH')
dev.off()
dev.off()

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

#loadings
print(fa2latex(base.principal), 
      type="latex", 
      include.rownames = T, 
      sanitize.text.function = identity,
      file="../../outputs/AFCH_loadings.tex")

print(loadings(base.principal),cutoff=2e-1)

data.frame(unclass(base.principal))

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






CICH<-read.csv("../../outputs/CICH.csv",header=TRUE)
CFSH<-read.csv("../../outputs/CFSH.csv",header=TRUE)
CISH<-read.csv("../../outputs/CISH.csv",header=TRUE)
AFCH<-read.csv("../../outputs/AFCH.csv",header=TRUE)
TFCH<-read.csv("../../outputs/TFCH.csv",header=TRUE)
AICH<-read.csv("../../outputs/AICH.csv",header=TRUE)
TICH<-read.csv("../../outputs/TICH.csv",header=TRUE)
AFSH<-read.csv("../../outputs/AFSH.csv",header=TRUE)
TFSH<-read.csv("../../outputs/TFSH.csv",header=TRUE)
AISH<-read.csv("../../outputs/AISH.csv",header=TRUE)
TISH<-read.csv("../../outputs/TISH.csv",header=TRUE)
CFH<-read.csv("../../outputs/CFH.csv",header=TRUE)
CIH<-read.csv("../../outputs/CIH.csv",header=TRUE)