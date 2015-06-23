rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

#Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste(i,"unc","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  print(code); print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

#Eliminando colunas desnecessárias:
for(i in conditions){
  code=paste(i,"<-",i,"[,!names(",i,") %in% c('SiteName','SampleType','volumem3')]",sep="")
  code_unc=paste(i,"unc","<-",i,"unc","[,!names(",i,"unc",") %in% c('SiteName','SampleType','volumem3')]",sep="")
  #print(code); print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}


#Cria diretório concentrations
if(!('concentrations' %in% list.files("../../outputs/"))) dir.create("../../outputs/concentrations")

#Salvar os arquivos para análise PMF
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE,quote=F)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE,quote=F)",sep="")
    if(debug) print(code) 
    if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}
