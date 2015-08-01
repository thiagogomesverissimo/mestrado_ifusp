# Encontrar o grosso subtraindo o fino do inalável.

rm(list=ls())
source("myfunctions/load.R")

conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

#Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste(i,"unc","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

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


# Lista de Elementos analisados pelo EDXRF
pmElementos<-names(pmConc)[2:length(names(pmConc))]

## Residential
# Cria a coluna StringDate no formato dia/mês/ano
RFcH = cbind(RFcH,StringDate=strftime(RFcH$Date,format="%d/%m/%Y"))
RFcHunc = cbind(RFcHunc,StringDate=strftime(RFcHunc$Date,format="%d/%m/%Y"))
RIcH = cbind(RIcH,StringDate=strftime(RIcH$Date,format="%d/%m/%Y"))
RIcHunc = cbind(RIcHunc,StringDate=strftime(RIcHunc$Date,format="%d/%m/%Y"))

# mantém dias que estão em RFcH e RIcH:
datas_comuns = intersect(RIcH$StringDate,RFcH$StringDate)
RFcH = subset(RFcH, RFcH$StringDate %in% datas_comuns)
RFcHunc = subset(RFcHunc, RFcHunc$StringDate %in% datas_comuns)
RIcH = subset(RIcH, RIcH$StringDate %in% datas_comuns)
RIcHunc = subset(RIcHunc, RIcHunc$StringDate %in% datas_comuns)

unique(RIcH$StringDate)

setdiff(RFcH$StringDate,RIcH$StringDate)
setdiff(RIcH$StringDate,RFcH$StringDate)

