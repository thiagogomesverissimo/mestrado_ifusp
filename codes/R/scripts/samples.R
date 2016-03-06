rm(list=ls())
source("myfunctions/load.R")

# Informations about Nima samples provided by Kathie by email
infoNima = read.csv("../../inputs/infoNima/infoNima.csv",header=TRUE)

# Análise EDX
pm = read.csv('../../outputs/pmConc.csv')

# Remover danificas (e criar data.frame for latex)
danificadas<-nrow(subset(infoNima,infoNima$QCFlag==1)) # QCflag=1 problemas sérios.
danificadas<- danificadas + nrow(subset(infoNima,is.na(infoNima$MassConc))) # 4 problemáticas
samples<-data.frame(matrix(NA,nrow=1,ncol=4))
colnames(samples)<-c('Coletadas no projeto',
                     'Somente de Nima',
                     'Danificadas',
                     'Válidas')
samples[1,1] <- nrow(pm)
samples[1,2] <- nrow(infoNima)
samples[1,3] <- danificadas
infoNima <- subset(infoNima,infoNima$QCFlag==0) #Remover danificadas
infoNima <- subset(infoNima,!is.na(infoNima$MassConc)) #Remover danificadas
samples[1,4]<-nrow(infoNima)

#Para não colocar \begin{table}...\end{table} usar floating = FALSE no print:
print(xtable(samples),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/samples.tex")

