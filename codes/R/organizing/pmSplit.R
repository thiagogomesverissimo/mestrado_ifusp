rm(list=ls())
source("myfunctions/load.R")

# Leitura dos arquivos Fino
pmFino = read.csv('../../outputs/pmFino.csv')
pmFinoError = read.csv('../../outputs/pmFinoError.csv')

# Leitura dos arquivos Inalável
pmInalavel = read.csv('../../outputs/pmInalavel.csv')
pmInalavelError = read.csv('../../outputs/pmInalavelError.csv')

# Converte as datas
pmFino$Date<-as.POSIXct(strptime(pmFino$Date,format="%Y-%m-%d %H:%M:%S",tz="GMT"))
pmFinoError$Date<-as.POSIXct(strptime(pmFinoError$Date,format="%Y-%m-%d %H:%M:%S",tz="GMT"))
pmInalavel$Date<-as.POSIXct(strptime(pmInalavel$Date,format="%Y-%m-%d %H:%M:%S",tz="GMT"))
pmInalavelError$Date<-as.POSIXct(strptime(pmInalavelError$Date,format="%Y-%m-%d %H:%M:%S",tz="GMT"))

# Classifica data.frame pela data


## Critérios para a separação
#  NMA: área residencial, ruas não pavimentadas (R) 
#  NMT: avenida principal, com tráfego intenso de veículos (T)
#  Nomeclatura: 
#  - Local (R-residiencial, T-traffic ou J-joint) 
#  - Fino, Grosso ou Inalável (F, G, I) 
#  - Com/Sem/Exclusivamente Harmathan (cH / sH / eH)


# Harmathan: dez, Jan, Fev, Março
harmathan<-c('December','January','February','March')

#Divisões do MP Fino
JFcH <- pmFino
RFcH <- subset(pmFino,pmFino$SiteName=="NMA")
TFcH <- subset(pmFino,pmFino$SiteName=="NMT")
JFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan),]
RFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan) & pmFino$SiteName=="NMA",]
TFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan) & pmFino$SiteName=="NMT",]
JFeH <- pmFino[months(pmFino$Date) %in% harmathan,]

#Data.frame das incertezas MP Fino
JFcHunc <- pmFinoError
RFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMA")
TFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMT")
JFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan),]
RFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan) & pmFinoError$SiteName=="NMA",]
TFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan) & pmFinoError$SiteName=="NMT",]
JFeHunc <- pmFinoError[months(pmFinoError$Date) %in% harmathan,]

#Divisões do MP Inalável
JIcH <- pmInalavel
RIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMA")
TIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMT")
JIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan),]
RIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan) & pmInalavel$SiteName=="NMA",]
TIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan) & pmInalavel$SiteName=="NMT",]
JIeH <- pmInalavel[months(pmInalavel$Date) %in% harmathan,]

#Data.frame das incertezas MP Inalável
JIcHunc <- pmInalavelError
RIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMA")
TIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMT")
JIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan),]
RIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan) & pmInalavelError$SiteName=="NMA",]
TIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan) & pmInalavelError$SiteName=="NMT",]
JIeHunc <- pmInalavelError[months(pmInalavelError$Date) %in% harmathan,]

conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

#Verifica se existe diretório 'concentrations', se não, criar uma. 
if(!('concentrations' %in% list.files("../../outputs/"))) dir.create("../../outputs/concentrations")

#Salvando csv's
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

