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

### Critério 1: definir que o harmatão ocorre somente nos meses de: Nov,Dez, Jan, Fev
harmathan<-c('November','December','January','February')

# Exclusão dos meses do Harmathan

RFsH <- RFcH[ !(months(RFcH$Date) %in% harmathan), ]
RGsH <- RGcH[ !(months(RGcH$Date) %in% harmathan), ]
RIsH <- RIcH[ !(months(RIcH$Date) %in% harmathan), ]
TFsH <- TFcH[ !(months(TFcH$Date) %in% harmathan), ]
TGsH <- TGcH[ !(months(TGcH$Date) %in% harmathan), ]
TIsH <- TIcH[ !(months(TIcH$Date) %in% harmathan), ]

# Exclusão dos meses do Harmathan nas incertezas

#RFsHunc <- RFcHunc[ !(months(RFcHunc$Date) %in% harmathan), ]
#RGsHunc <- RGcHunc[ !(months(RGcHunc$Date) %in% harmathan), ]
#RIsHunc <- RIcHunc[ !(months(RIcHunc$Date) %in% harmathan), ]
#TFsHunc <- TFcHunc[ !(months(TFcHunc$Date) %in% harmathan), ]
#TGsHunc <- TGcHunc[ !(months(TGcHunc$Date) %in% harmathan), ]
#TIsHunc <- TIcHunc[ !(months(TIcHunc$Date) %in% harmathan), ]

### Critério 2: definir que o harmatão os dias que ocorre concetração do Si > 10000 ng/m3

RIsH <- RGcH[ !(months(RIcH$Date) %in% harmathan) & RIcH$Si < 10.0, ]
TIsH <- TGcH[ !(months(TIcH$Date) %in% harmathan) & TIcH$Si < 10.0, ]

a = RFsH[ rownames(RFsH) %in% rownames(RIcH),]

RFsH <- subset(RFcH,RFcH$Si > 10.0)
RGsH <- subset(RGcH,RGcH$Si > 10.0)
RIsH <- subset(RIcH,RIcH$Si > 10.0)
TFsH <- subset(TFcH,TFcH$Si > 10.0)
TGsH <- subset(TGcH,TGcH$Si > 10.0)
TIsH <- subset(TIcH,TIcH$Si > 10.0)


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

