rm(list=ls())
source("myfunctions/load.R")

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# All conditions
conditions<-c(residencial,traffic)

# Inclui tabelas sem os meses do Harmathan
conditions = c(conditions,gsub('c','s',conditions))

# Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste(i,"unc","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

# Eliminando colunas desnecessárias
removidos = 'c("SampleID","SiteName","SampleType","diamesano","volumem3","Duplicate")'
for(i in conditions){
  code=paste(i,"<-",i,"[,!names(",i,") %in% ", removidos, "]",sep="")
  code_unc=paste(i,"unc","<-",i,"unc","[,!names(",i,"unc",") %in% ", removidos ,"]",sep="")
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

# Ordenando pela coluna Date.
for(i in conditions){
  #Formatando a coluna dates com formato de data
  code=paste(i,"<-",i,"[order(",i,"$Date),]",sep="")
  code_unc=paste(i,"unc<-",i,"unc[order(",i,"unc$Date),]",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

# Cria diretório PCA
if(!('pca' %in% list.files("../../outputs/"))) dir.create("../../outputs/pca")

# Salvar os arquivos para análise pca, não pode ter aspas
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/pca/",i,".csv',","row.names=FALSE,quote=F)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/pca/",i,"unc.csv',","row.names=FALSE,quote=F)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

