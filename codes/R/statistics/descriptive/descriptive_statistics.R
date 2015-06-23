rm(list=ls())
source("myfunctions/load.R")

CFSH<-read.csv("../../outputs/CFCH.csv",header=TRUE)
base = CFSH

#ver elementos
colnames(base)

#seleciona elementos para PCA
elementos<-c(
  'X11' ,'X12' ,'X13' ,
  'X14' ,'X15' ,'X16' ,
  'X17' ,'X19' ,'X20' ,
  'X22' ,'X23' ,'X24' ,
  'X25' ,'X26' ,'X28' ,
  'X29' ,'X30' ,'X35' ,
  'X37' ,'X38' ,'X39' ,
  'X40' ,'X56' ,'X82'
)
base = base[,c(elementos,'diaMedio','BCmass','MassConc')]

#Cria um data.frame com a porcentagem dos elementos na Massa total
contrib_elementos_na_massa =data.frame()
for (linha in seq(nrow(base))) {
  data_in_line<-c(100*sum(base[linha,elementos])/base[linha,c('MassConc')])
  contrib_elementos_na_massa<-rbind(contrib_elementos_na_massa,data_in_line)
}
contrib_elementos_na_massa<-cbind(base[,c('diaMedio')],contrib_elementos_na_massa)

#Cria um data.frame com a porcentagem do BlackCarbon na Massa total
contrib_bc_na_massa<-data.frame(base[,c('diaMedio')],base[,c('BCmass')]/base[,c('MassConc')]*100)

#base: Colunas de concentrações, excluindo o diaMedio
base<- base[, !(colnames(base) %in% c('diaMedio'))]

#Correlation Matrix
base.cor<-round(cor(base.pca),2) # NA resolver!
corrplot(base.cor, type = "lower",method="circle")

#Bartlet Test: p-valeu pequeno rejeitamos a hipotese de correlaçao nula (matriz identidade)
cortest.bartlett(base.pca,nrow(base.pca))

#determinante: but can do the determinant need it to be above 0.00001
det(base.cor) ###PROBLEMA