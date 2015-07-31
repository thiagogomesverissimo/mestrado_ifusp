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


## Traffic
# Cria a coluna StringDate no formato dia/mês/ano
TFcH = cbind(TFcH,StringDate=strftime(TFcH$Date,format="%d/%m/%Y"))
TFcHunc = cbind(TFcHunc,StringDate=strftime(TFcHunc$Date,format="%d/%m/%Y"))
TIcH = cbind(TIcH,StringDate=strftime(TIcH$Date,format="%d/%m/%Y"))
TIcHunc = cbind(TIcHunc,StringDate=strftime(TIcHunc$Date,format="%d/%m/%Y"))

# mantem dias que estão em RFcH e RIcH:
t1remove = intersect(TIcH$StringDate,TFcH$StringDate)
t2remove = intersect(TFcH$StringDate,TFcH$StringDate)
tremove = intersect(t1remove,t2remove)
TFcH = subset(TFcH, TFcH$StringDate %in% tremove)
TFcHunc = subset(TFcHunc, TFcHunc$StringDate %in% tremove)
TIcH = subset(TIcH, TIcH$StringDate %in% tremove)
TIcHunc = subset(TIcHunc, TIcHunc$StringDate %in% tremove)

nrow(TFcH)
nrow(TIcH)


## Residential
# Cria a coluna StringDate no formato dia/mês/ano
RFcH = cbind(RFcH,StringDate=strftime(RFcH$Date,format="%d/%m/%Y"))
RIcH = cbind(RIcH,StringDate=strftime(RIcH$Date,format="%d/%m/%Y"))

# mantem dias que estão em RFcH e RIcH:
RFcH = subset(RFcH, RFcH$StringDate %in% intersect(RIcH$StringDate,RFcH$StringDate))
RIcH = subset(RIcH, RIcH$StringDate %in% intersect(RIcH$StringDate,RFcH$StringDate))
