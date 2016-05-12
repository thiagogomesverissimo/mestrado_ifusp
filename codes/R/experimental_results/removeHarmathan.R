rm(list=ls())
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

# 2) definir que o harmatão os dias que ocorre concetração do Si  > 10000 ng/m3
# (Aboh et al, 2010) não diz se este limite é para MP10 ou MP2.5, vou usar em ambos. 
limiteSi = 10.0 # inalável

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

### Exclusicamente Harmatão - arrumar os de cima com a mesma lógica
RIeH <- RIcH[ (months(RIcH$Date) %in% harmathan) & RIcH$Si > limiteSi, ]
RIeHunc = RIcHunc[rownames(RIeH),]

TIeH <- TIcH[ (months(TIcH$Date) %in% harmathan) & TIcH$Si > limiteSi, ]
TIeHunc = TIcHunc[rownames(TIeH),]

RGeH <- RGcH[rownames(RGcH) %in% rownames(RIeH),]
RGeHunc <- RGcHunc[rownames(RGcHunc) %in% rownames(RIeHunc),]

TGeH <- TGcH[rownames(TGcH) %in% rownames(TIeH),]
TGeHunc <- TGcHunc[rownames(TGcHunc) %in% rownames(TIeHunc),]

RFeH <- RFcH[rownames(RFcH) %in% rownames(RIeH),]
RFeHunc <- RFcHunc[rownames(RFcHunc) %in% rownames(RIeHunc),]

TFeH <- TFcH[rownames(TFcH) %in% rownames(TIeH),]
TFeHunc <- TFcHunc[rownames(TFcHunc) %in% rownames(TIeHunc),]
  
# Salvando csv's com novas siglas
conditions <- gsub('c','s',conditions)
conditions <- c(conditions,'RIeH','TIeH','RGeH','TGeH','RFeH','TFeH')
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

