rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 

#### médias de MP2.5 para comparação com outras cidades
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
TFsH = read.csv('../../outputs/pmf_fa/TFsH.csv')
fino_sH = merge(RFsH,TFsH,all=T)
descriptive2latex(fino_sH,'fino_sH')
# for copies
#fino_sH = fino_sH[,-1]
#fino_sH = fino_sH*1000
#write.csv(file="/tmp/media.csv",describe(fino_sH)[,c(3,4)])
#100*sum(RFsH$mass>25)/nrow(RFsH)
#100*sum(TFsH$mass>25)/nrow(TFsH)
#100*mean(fino_sH$BC)/mean(fino_sH$mass)

#### média de MP2.5 para comparação com outras cidades com Harmatão
RFcH = read.csv('../../outputs/pmf_fa/RFcH.csv')
TFcH = read.csv('../../outputs/pmf_fa/TFcH.csv')
fino_cH = merge(RFcH,TFcH,all=T)
#fino_cH = fino_cH[,-1]
#fino_cH = fino_cH*1000
#write.csv(file="/tmp/media.csv",describe(fino_cH)[,c(3,4)])
#100*sum(RFcH$mass>25)/nrow(RFcH)
#100*sum(TFcH$mass>25)/nrow(TFcH)
#100*mean(fino_cH$BC)/mean(fino_cH$mass)

#### MP10 só Harmatão
RIeH = read.csv('../../outputs/pmf_fa/RIeH.csv')
TIeH = read.csv('../../outputs/pmf_fa/TIeH.csv')
inalavel_harmatao = merge(RIeH,TIeH,all=T)
descriptive2latex(inalavel_harmatao,'inalavel_harmatao')

#### MP10 com total
RIcH = read.csv('../../outputs/pmf_fa/RIcH.csv')
TIcH = read.csv('../../outputs/pmf_fa/TIcH.csv')
inalavel_cH = merge(RIcH,TIcH,all=T)
#descriptive2latex(inalavel_cH,'inalavel_cH')
# ultrapassagens 
100*sum(RIcH$mass>150)/nrow(RIcH) #EPA/CONAMA
100*sum(TIcH$mass>150)/nrow(TIcH) #EPA/CONAMA
100*sum(RIcH$mass>50)/nrow(RIcH) # OMS
100*sum(TIcH$mass>50)/nrow(TIcH) # OMS
100*mean(RFcH$mass)/mean(RIcH$mass)

#### MP10 sem harmatão
RIsH = read.csv('../../outputs/pmf_fa/RIsH.csv')
TIsH = read.csv('../../outputs/pmf_fa/TIsH.csv')
inalavel_sH = merge(RIsH,TIsH,all=T)
descriptive2latex(inalavel_sH,'inalavel_sH')
# ultrapassagens e BC
100*sum(RIsH$mass>150)/nrow(RIsH) #EPA/CONAMA
100*sum(TIsH$mass>150)/nrow(TIsH) #EPA/CONAMA
100*sum(RIsH$mass>50)/nrow(RIsH) # OMS
100*sum(TIsH$mass>50)/nrow(TIsH) # OMS
100*mean(RFsH$mass)/mean(RIsH$mass)

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
data[1,] = data[1,]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RIcH = data

data = read.csv('../../outputs/pmf_fa/RIsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[1,] = data[1,]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
RIsH = data

data = read.csv('../../outputs/pmf_fa/TIcH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[1,] = data[1,]/1000
data = format(round(data,1),nsmall=1,scientic=F,decimal.mark = ',')
data = paste(data$mean,data$se,sep='$\\pm$')
TIcH = data

data = read.csv('../../outputs/pmf_fa/TIsH.csv')
data = describe(data[,-1])[,c(3,13)]*1000
data[1,] = data[1,]/1000
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
