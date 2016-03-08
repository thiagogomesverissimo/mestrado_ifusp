rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 
path = '../../outputs/pmf_fa/'

descriptive2latex(path,'RFcH')
descriptive2latex(path,'TFcH')

descriptive2latex(path,'RIcH')
descriptive2latex(path,'TIcH')

descriptive2latex(path,'RGcH')
descriptive2latex(path,'TGcH')

descriptive2latex(path,'TFcH')

#### 
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
