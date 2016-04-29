#rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 
path = '../../outputs/pmf_fa/'

descriptive2latex(path,'RFcH')
descriptive2latex(path,'RGcH')
descriptive2latex(path,'RIcH')

descriptive2latex(path,'TFcH')
descriptive2latex(path,'TGcH')
descriptive2latex(path,'TIcH')

descriptive2latex(path,'RFsH')
descriptive2latex(path,'RGsH')
descriptive2latex(path,'RIsH')

descriptive2latex(path,'TFsH')
descriptive2latex(path,'TGsH')
descriptive2latex(path,'TIsH')

descriptive2latex(path,'RIeH')
descriptive2latex(path,'TIeH')

#### média de MP2.5 para comparação com outras cidades
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
TFsH = read.csv('../../outputs/pmf_fa/TFsH.csv')
fino_sH = merge(RFsH,TFsH,all=T)
fino_sH = fino_sH[,-1]
fino_sH = fino_sH*1000
write.csv(file="/tmp/media.csv",describe(fino_sH)[,c(3,4)])

#### média de MP2.5 para comparação com outras cidades com Harmatão
RFcH = read.csv('../../outputs/pmf_fa/RFcH.csv')
TFcH = read.csv('../../outputs/pmf_fa/TFcH.csv')
fino_cH = merge(RFcH,TFcH,all=T)
fino_cH = fino_cH[,-1]
fino_cH = fino_cH*1000
write.csv(file="/tmp/media.csv",describe(fino_cH)[,c(3,4)])
  
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
