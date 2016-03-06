# Encontrar o grosso subtraindo o fino do inalável.

rm(list=ls())
source("myfunctions/load.R")

# Tabela periódica
periodicTable<-read.csv("../../inputs/constants/periodic_table.csv",header=TRUE)

# leitura dos arquivos gerados por: pmSplit.R
RIcH = read.csv('../../outputs/concentrations/RIcH.csv')
RIcHunc = read.csv('../../outputs/concentrations/RIcHunc.csv')
RFcH = read.csv('../../outputs/concentrations/RFcH.csv')
RFcHunc = read.csv('../../outputs/concentrations/RFcHunc.csv')

# Removendo duplicado. 
# !!! Investigar depois com calma porque ainda está duplicado.
RIcH = subset(RIcH,!duplicated(RIcH$diamesano))
RIcHunc = subset(RIcHunc,!duplicated(RIcHunc$diamesano))
RFcH = subset(RFcH,!duplicated(RFcH$diamesano))
RFcHunc = subset(RFcHunc,!duplicated(RFcHunc$diamesano))

# mantém dias que estão em RFcH e em RIcH:
datas_comuns = intersect(RFcH$diamesano,RIcH$diamesano)
RFcH = subset(RFcH, RFcH$diamesano %in% datas_comuns)
RFcHunc = subset(RFcHunc, RFcHunc$diamesano %in% datas_comuns)
RIcH = subset(RIcH, RIcH$diamesano %in% datas_comuns)
RIcHunc = subset(RIcHunc, RIcHunc$diamesano %in% datas_comuns)

# Elementos comuns
elementos = intersect(colnames(RFcH),colnames(RIcH))
elementos = intersect(periodicTable$code,elementos)

# Classifica os data.frame pela data
RIcH = RIcH[order(RIcH$Date),]
RIcHunc = RIcHunc[order(RIcHunc$Date),]
RFcH = RFcH[order(RFcH$Date),]
RFcHunc = RFcHunc[order(RFcHunc$Date),]

# Calcula concentração do grosso
RGcH = RIcH[,c('mass',elementos)] - RFcH[,c('mass',elementos)]
RGcHunc = sqrt(RIcHunc[,c('mass',elementos)]**2 + RFcHunc[,c('mass',elementos)]**2)
RGcHunc = as.data.frame(RGcHunc)

# !!! Subtitui os negativos TEMPORARIAMENTE pelo limite de detecção
RGcH[RGcH<0.000001] = NA
for(i in elementos){
  Zi = periodicTable[periodicTable$code==i,1]
  RGcH[,i]<-na2LD(Zi,RGcH[,i])
  RGcHunc[,i]<-na2LD(Zi,RGcHunc[,i],erro=T)
}

# Adiciona as colunas iniciais
colunas_iniciais = RIcH[,c('SiteName','SampleType','Date','diamesano','volumem3')]
RGcH = cbind(colunas_iniciais,RGcH)
RGcHunc = cbind(colunas_iniciais,RGcHunc)

# !!!  APAGA TEMPORARIAMENTE OS QUE TEM A MASSA NEGATIVA
removidos = subset(RGcH,is.na(RGcH$mass))$diamesano
RGcH = subset(RGcH,!(RGcH$diamesano %in% removidos))
RGcHunc = subset(RGcHunc,!(RGcHunc$diamesano %in% removidos))

write.csv(RGcH,'../../outputs/concentrations/RGcH.csv',row.names=F)
write.csv(RGcHunc,'../../outputs/concentrations/RGcHunc.csv',row.names=F)

