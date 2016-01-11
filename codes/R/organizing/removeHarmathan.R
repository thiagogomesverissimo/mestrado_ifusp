rm(list=ls())
source("myfunctions/load.R")

# Siglas
#conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
#              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# All conditions
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

# Transformando as colunas Date para tipo R-Date. 
for(i in conditions){
  #Formatando a coluna dates com formato de data
  code=paste(i,"$Date","<-","as.POSIXct(strptime(",i,"$Date",",format='%Y-%m-%d %H:%M:%S',tz='GMT'))",sep="")
  code_unc=paste(i,"unc","$Date","<-","as.POSIXct(strptime(",i,"unc","$Date",",format='%Y-%m-%d %H:%M:%S',tz='GMT'))",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}


# Harmathan: dez, Jan, Fev, Março
harmathan<-c('December','January','February','March')

# Exclusão dos meses do Harmathan

RFsH <- RFcH[ !(months(RFcH$Date) %in% harmathan), ]
RGsH <- RGcH[ !(months(RGcH$Date) %in% harmathan), ]
RIsH <- RIcH[ !(months(RIcH$Date) %in% harmathan), ]
TFsH <- TFcH[ !(months(TFcH$Date) %in% harmathan), ]
TGsH <- TGcH[ !(months(TGcH$Date) %in% harmathan), ]
TIsH <- TIcH[ !(months(TIcH$Date) %in% harmathan), ]

# Exclusão dos meses do Harmathan nas incertezas

RFsHunc <- RFcHunc[ !(months(RFcHunc$Date) %in% harmathan), ]
RGsHunc <- RGcHunc[ !(months(RGcHunc$Date) %in% harmathan), ]
RIsHunc <- RIcHunc[ !(months(RIcHunc$Date) %in% harmathan), ]
TFsHunc <- TFcHunc[ !(months(TFcHunc$Date) %in% harmathan), ]
TGsHunc <- TGcHunc[ !(months(TGcHunc$Date) %in% harmathan), ]
TIsHunc <- TIcHunc[ !(months(TIcHunc$Date) %in% harmathan), ]

# Novas siglas sem Harmathan
conditions<-gsub('c','s',conditions)

# Salvando csv's
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

