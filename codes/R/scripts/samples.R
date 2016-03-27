#rm(list=ls())
source("myfunctions/load.R")

# Informations about Nima samples provided by Kathie by email
infoNima = read.csv("../../inputs/infoNima/infoNima.csv",header=TRUE)

# Análise EDX
pm = read.csv('../../outputs/pm.csv')

# Remover danificas (e criar data.frame for latex)
danificadas<-nrow(subset(infoNima,infoNima$QCFlag==1)) # QCflag=1 problemas sérios.
danificadas<- danificadas + nrow(subset(infoNima,is.na(infoNima$MassConc))) # 4 problemáticas
duplicadas <-  as.integer(nrow(subset(infoNima,infoNima$Duplicate==1))/2)

samples<-data.frame(matrix(NA,nrow=1,ncol=5))

colnames(samples)<-c('Total de amostras',
                     'Somente de Nima',
                     'Nima danificadas',
                     'Nima duplicadas',
                     'Nima válidas')

samples[1,1] <- nrow(pm)
samples[1,2] <- nrow(infoNima)
samples[1,3] <- duplicadas
samples[1,4] <- danificadas
infoNima <- subset(infoNima,infoNima$QCFlag==0) #Remover danificadas
infoNima <- subset(infoNima,!is.na(infoNima$MassConc)) #Remover danificadas
samples[1,5]<-nrow(infoNima) - duplicadas

#Para não colocar \begin{table}...\end{table} usar floating = FALSE no print:
print(xtable(samples),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/samples.tex")

