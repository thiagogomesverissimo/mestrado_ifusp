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

#### MP10 no Harmatão
RIeH = read.csv('../../outputs/pmf_fa/RIeH.csv')
TIeH = read.csv('../../outputs/pmf_fa/TIeH.csv')
inalavel_harmatao = merge(RIeH,TIeH,all=T)
descriptive2latex(inalavel_harmatao,'inalavel_harmatao')

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

#### Comparação de MP2.5 na avenida e residências com e sem Harmatão ####
data = read.csv('../../outputs/pmf_fa/RFcH.csv');elementos = colnames(data)[-1]
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RFcH = data

data = read.csv('../../outputs/pmf_fa/RFsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RFsH = data

data = read.csv('../../outputs/pmf_fa/TFcH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
TFcH = data

data = read.csv('../../outputs/pmf_fa/TFsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
TFsH = data

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Residencial} & \\multicolumn{2}{c}{Avenida} \\\\\n',
                      'Z & com Harmatão & sem Harmatão & com Harmatão & sem Harmatão \\\\\n')

tabela = cbind(elementos,RFcH,RFsH,TFcH,TFsH)

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F,
      add.to.row = addtorow,
      include.colnames = F,
      sanitize.text.function = identity,
      file='../../outputs/fino_2sitios.tex')

#### Comparação de MP10 na avenida e residências com e sem Harmatão ####
data = read.csv('../../outputs/pmf_fa/RIcH.csv');elementos = colnames(data)[-1]
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RIcH = data

data = read.csv('../../outputs/pmf_fa/RIsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RIsH = data

data = read.csv('../../outputs/pmf_fa/TIcH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
TIcH = data

data = read.csv('../../outputs/pmf_fa/TIsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[c(1,nrow(data)),] = data[c(1,nrow(data)),]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
TIsH = data

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Residencial} & \\multicolumn{2}{c}{Avenida} \\\\\n',
                      'Z & com Harmatão & sem Harmatão & com Harmatão & sem Harmatão \\\\\n')

tabela = cbind(elementos,RIcH,RIsH,TIcH,TIsH)

print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = F,
      add.to.row = addtorow,
      include.colnames = F,
      sanitize.text.function = identity,
      file='../../outputs/inalavel_2sitios.tex')
