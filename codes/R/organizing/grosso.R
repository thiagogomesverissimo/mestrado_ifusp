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

# Classifica os data.frame pela data
RIcH = RIcH[order(RIcH$Date),]
RIcHunc = RIcHunc[order(RIcHunc$Date),]
RFcH = RFcH[order(RFcH$Date),]
RFcHunc = RFcHunc[order(RFcHunc$Date),]

## Residential
# Cria a coluna StringDate no formato dia/mês/ano
RFcH = cbind(RFcH,StringDate=strftime(RFcH$Date,format="%d/%m/%Y"))
RFcHunc = cbind(RFcHunc,StringDate=strftime(RFcHunc$Date,format="%d/%m/%Y"))
RIcH = cbind(RIcH,StringDate=strftime(RIcH$Date,format="%d/%m/%Y"))
RIcHunc = cbind(RIcHunc,StringDate=strftime(RIcHunc$Date,format="%d/%m/%Y"))

# Removendo duplicado. ### Investigar depois com calma porque tá duplicado.
RIcH = subset(RIcH,!duplicated(RIcH$StringDate))
RIcHunc = subset(RIcHunc,!duplicated(RIcHunc$StringDate))

# mantém dias que estão em RFcH e RIcH:
datas_comuns = intersect(RFcH$StringDate,RIcH$StringDate)
RFcH = subset(RFcH, RFcH$StringDate %in% datas_comuns)
RFcHunc = subset(RFcHunc, RFcHunc$StringDate %in% datas_comuns)
RIcH = subset(RIcH, RIcH$StringDate %in% datas_comuns)
RIcHunc = subset(RIcHunc, RIcHunc$StringDate %in% datas_comuns)

# Elementos comuns
elementos = intersect(colnames(RFcH),colnames(RIcH))
elementos = intersect(periodicTable$code,elementos)

# Calcula concentração do grosso
RGcH = RIcH[,c('mass',elementos)] - RFcH[,c('mass',elementos)]
RGcHunc = sqrt(RIcHunc[,c('mass',elementos)]**2 + RFcHunc[,c('mass',elementos)]**2)

# !!! Subtitui os negativos TEMPORARIAMENTE pelo limite de detecção
RGcH[RGcH<0.000001] = NA
for(i in elementos){
  Zi = periodicTable[periodicTable$code==i,1]
  RGcH[,i]<-na2LD(Zi,RGcH[,i])
  RGcHunc[,i]<-na2LD(Zi,RGcHunc[,i],erro=T)
}

# Adiciona as colunas iniciais
colunas_iniciais = RIcH[,c('SampleID','SiteName','SampleType','Date','volumem3','Duplicate')]
RGcH = cbind(colunas_iniciais,RGcH)
RGcHunc = cbind(colunas_iniciais,RGcHunc)

# !!!  APAGA TEMPORARIAMENTE OS QUE TEM A MASSA NEGATIVA
removidos = subset(RGcH,is.na(RGcH$mass))$SampleID
RGcH = subset(RGcH,!(RGcH$SampleID %in% removidos))
RGcHunc = subset(RGcHunc,!(RGcHunc$SampleID %in% removidos))

write.csv(RGcH,'../../outputs/concentrations/RGcH.csv',row.names=F)

## Traffic: TIcH - TFcH 

# Cria a coluna StringDate no formato dia/mês/ano
TFcH = cbind(TFcH,StringDate=strftime(TFcH$Date,format="%d/%m/%Y"))
TFcHunc = cbind(TFcHunc,StringDate=strftime(TFcHunc$Date,format="%d/%m/%Y"))
TIcH = cbind(TIcH,StringDate=strftime(TIcH$Date,format="%d/%m/%Y"))
TIcHunc = cbind(TIcHunc,StringDate=strftime(TIcHunc$Date,format="%d/%m/%Y"))

# mantem dias que estão em TFcH e TIcH:
datas_comuns = intersect(TIcH$StringDate,TFcH$StringDate)
TFcH = subset(TFcH, TFcH$StringDate %in% datas_comuns)
TFcHunc = subset(TFcHunc, TFcHunc$StringDate %in% datas_comuns)
TIcH = subset(TIcH, TIcH$StringDate %in% datas_comuns)
TIcHunc = subset(TIcHunc, TIcHunc$StringDate %in% datas_comuns)

nrow(TFcH)
nrow(TIcH)