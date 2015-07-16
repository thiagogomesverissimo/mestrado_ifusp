rm(list=ls())

source("myfunctions/load.R")

conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

#Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste(i,"unc","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

#Duplicates
for (i in conditions){
  code=paste(i,"<-duplicates(",i,")",sep="")
  code_unc=paste(i,"unc","<-duplicates(",i,"unc)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

#Salvando csv's
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

#TODO: Estatística quantitativa depois da eliminação das duplicadas.
