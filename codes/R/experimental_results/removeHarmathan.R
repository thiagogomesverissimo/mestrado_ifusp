#rm(list=ls())
source("myfunctions/load.R")

# All conditions
residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 
conditions<-c(residencial,traffic)

# Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste(i,"unc","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

# Date as rowname
lista = c(conditions,paste(conditions,'unc',sep=""))
for(i in lista){
  # set rowname
  code=paste("rownames(",i,") = ",i,"$Date",sep="")
  eval(parse(text=code))
  # set Date
  code=paste(i,"$Date","<-","as.POSIXct(strptime(",i,"$Date",",format='%Y-%m-%d %H:%M:%S',tz='GMT'))",sep="")
  eval(parse(text=code))
}

### Critérios: 
# 1) definir que o harmatão ocorre somente nos meses de: Nov,Dez, Jan, Fev 
harmathan<-c('November','December','January','February')
# 2) definir que o harmatão os dias que ocorre concetração do Si > 10000 ng/m3
limiteSi = 10.0

RIsH <- RIcH[ !(months(RIcH$Date) %in% harmathan) & RIcH$Si < limiteSi, ]
TIsH <- TIcH[ !(months(TIcH$Date) %in% harmathan) & TIcH$Si < limiteSi, ]

RFsH <- RFcH[ !(months(RFcH$Date) %in% harmathan) & RFcH$Si < limiteSi, ]
TFsH <- TFcH[ !(months(TFcH$Date) %in% harmathan) & TFcH$Si < limiteSi, ]

RGsH <- RGcH[ !(months(RGcH$Date) %in% harmathan) & RGcH$Si < limiteSi, ]
TGsH <- TGcH[ !(months(TGcH$Date) %in% harmathan) & TGcH$Si < limiteSi, ]

# Exclusão dos meses do Harmathan nas incertezas
RIsHunc = RIcHunc[rownames(RIsH),]
TIsHunc = TIcHunc[rownames(TIsH),]

RFsHunc = RFcHunc[rownames(RFsH),]  
TFsHunc = TFcHunc[rownames(TFsH),]  

RGsHunc = RGcHunc[rownames(RGsH),]  
TGsHunc = TGcHunc[rownames(TGsH),]

# Salvando csv's com novas siglas
conditions<-gsub('c','s',conditions)
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

