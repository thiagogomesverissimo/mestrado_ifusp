rm(list=ls())
source("myfunctions/load.R")

#Verificando faltantes:
#describe(pmConc[,pmElementos]) # ../../outputs/edxStatistics.csv
#TODO: Reportar período da amostragem
#min(pmFino$Date)
#max(pmFino$Date)

# A função describe está no pacote Hmisc e psych
#detach("package:Hmisc", unload=TRUE) 

#RFcH<-read.csv("../../outputs/pmf_fa/RFcH.csv",header=TRUE)
#base = RFcH


#describe(base*1000)

#Cria um data.frame com a porcentagem dos elementos na Massa total
#contrib_elementos_na_massa = c()

#for (linha in seq(nrow(base))) {
#  x<-c(100*sum(base[linha,-1:-2])/base[linha,c('mass')])
#  contrib_elementos_na_massa = append(contrib_elementos_na_massa,x)
#}
#contrib_elementos_na_massa<-cbind(base$Date,contrib_elementos_na_massa)
#base[,1]

#Cria um data.frame com a porcentagem do BlackCarbon na Massa total
#contrib_bc_na_massa<-data.frame(base[,c('diaMedio')],base[,c('BCmass')]/base[,c('MassConc')]*100)

#base: Colunas de concentrações, excluindo o diaMedio
#base<- base[, !(colnames(base) %in% c('diaMedio'))]

#Correlation Matrix
#base.cor<-round(cor(base.pca),2) # NA resolver!
#corrplot(base.cor, type = "lower",method="circle")

#Bartlet Test: p-valeu pequeno rejeitamos a hipotese de correlaçao nula (matriz identidade)
#cortest.bartlett(base.pca,nrow(base.pca))

#determinante: but can do the determinant need it to be above 0.00001
#det(base.cor) ###PROBLEMA