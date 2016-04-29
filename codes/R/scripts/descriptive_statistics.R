rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 

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

#### MP2.5 total
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
TFsH = read.csv('../../outputs/pmf_fa/TFsH.csv')
fino_sH = merge(RFsH,TFsH,all=T)
descriptive2latex(fino_sH,'fino_sH')

#### MP10 total
RIsH = read.csv('../../outputs/pmf_fa/RIsH.csv')
TIsH = read.csv('../../outputs/pmf_fa/TIsH.csv')
inalavel_sH = merge(RIsH,TIsH,all=T)
descriptive2latex(inalavel_sH,'inalavel_sH')

#### Comparação de MP2.5 na avenida e residências com e sem Harmatão
RFcH = read.csv('../../outputs/pmf_fa/RFcH.csv')
RFcH = describe(RFcH[,-1])[,c(3,13)]*1000
data
tabela[c("mass"),c(2:6)] = tabela[c("mass"),c(2:6)]/1000
if(grepl('F',sigla)) tabela[c("BC"),c(2:6)] = tabela[c("BC"),c(2:6)]/1000

RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
RFsH = describe(RFsH[,-1])[,c(3,13)]

TFcH = read.csv('../../outputs/pmf_fa/TFcH.csv')
TFcH = describe(TFcH[,-1])[,c(3,13)]

TFsH = read.csv('../../outputs/pmf_fa/TFsH.csv')
TFsH = describe(TFsH[,-1])[,c(3,13)]

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Residencial} & \\multicolumn{2}{c}{Avenida} \\\\\n',
                      'Z & com Harmatão & sem Harmatão & com Harmatão & sem Harmatão \\\\\n')

rownames(RFsH)
tabela = cbind(rownames(RFcH),RFcH[,1],RFsH[,1],TFcH[,1],TFsH[,1])

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F,
      add.to.row = addtorow,
      include.colnames = F,
      sanitize.text.function = identity,
      file='../../outputs/fino_2sitios.tex')






fino_sH = merge(RFsH,TFsH,all=T)
fino_sH = fino_sH[,-1]
fino_sH = fino_sH*1000
write.csv(file="/tmp/media.csv",describe(fino_sH)[,c(3,4)])



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
