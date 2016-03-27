# Encontrar o grosso subtraindo o fino do inalável.

#rm(list=ls())
source("myfunctions/load.R")

# Tabela periódica
periodicTable<-read.csv("../../inputs/constants/periodic_table.csv",header=TRUE)

# leitura dos arquivos gerados por: pmSplit.R
TIcH = read.csv('../../outputs/concentrations/TIcH.csv')
TIcHunc = read.csv('../../outputs/concentrations/TIcHunc.csv')
TFcH = read.csv('../../outputs/concentrations/TFcH.csv')
TFcHunc = read.csv('../../outputs/concentrations/TFcHunc.csv')

# Removendo duplicado. 
# !!! Investigar depois com calma porque ainda está duplicado.
TIcH = subset(TIcH,!duplicated(TIcH$diamesano))
TIcHunc = subset(TIcHunc,!duplicated(TIcHunc$diamesano))
TFcH = subset(TFcH,!duplicated(TFcH$diamesano))
TFcHunc = subset(TFcHunc,!duplicated(TFcHunc$diamesano))

# mantém dias que estão em TFcH e em TIcH:
datas_comuns = intersect(TFcH$diamesano,TIcH$diamesano)
TFcH = subset(TFcH, TFcH$diamesano %in% datas_comuns)
TFcHunc = subset(TFcHunc, TFcHunc$diamesano %in% datas_comuns)
TIcH = subset(TIcH, TIcH$diamesano %in% datas_comuns)
TIcHunc = subset(TIcHunc, TIcHunc$diamesano %in% datas_comuns)

# Elementos comuns
elementos = intersect(colnames(TFcH),colnames(TIcH))
elementos = intersect(periodicTable$code,elementos)

# Classifica os data.frame pela data
TIcH = TIcH[order(TIcH$Date),]
TIcHunc = TIcHunc[order(TIcHunc$Date),]
TFcH = TFcH[order(TFcH$Date),]
TFcHunc = TFcHunc[order(TFcHunc$Date),]

# Calcula concentração do grosso
TGcH = TIcH[,c('mass',elementos)] - TFcH[,c('mass',elementos)]
TGcHunc = sqrt(TIcHunc[,c('mass',elementos)]**2 + TFcHunc[,c('mass',elementos)]**2)
TGcHunc = as.data.frame(TGcHunc)

# !!! Subtitui os negativos TEMPORARIAMENTE pelo limite de detecção
TGcH[TGcH<0.000001] = NA
for(i in elementos){
  Zi = periodicTable[periodicTable$code==i,1]
  TGcH[,i]<-na2LD(Zi,TGcH[,i])
  TGcHunc[,i]<-na2LD(Zi,TGcHunc[,i],erro=T)
}

# Adiciona as colunas iniciais
colunas_iniciais = TIcH[,c('SiteName','SampleType','Date','diamesano','volumem3')]
TGcH = cbind(colunas_iniciais,TGcH)
TGcHunc = cbind(colunas_iniciais,TGcHunc)

# !!!  APAGA TEMPORARIAMENTE OS QUE TEM A MASSA NEGATIVA
removidos = subset(TGcH,is.na(TGcH$mass))$diamesano
TGcH = subset(TGcH,!(TGcH$diamesano %in% removidos))
TGcHunc = subset(TGcHunc,!(TGcHunc$diamesano %in% removidos))

write.csv(TGcH,'../../outputs/concentrations/TGcH.csv',row.names=F)
write.csv(TGcHunc,'../../outputs/concentrations/TGcHunc.csv',row.names=F)