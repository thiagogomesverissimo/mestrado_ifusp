rm(list=ls())
source("myfunctions/load.R")

# Siglas
residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH')

# All conditions
conditions<-c(residencial,traffic)

# Inclui tabelas sem os meses do Harmathan
conditions = c(conditions,gsub('c','s',conditions))

# Inclui Harmatão only
conditions <- c(conditions,'RIeH','RIeH','TIeH','RGeH','TGeH','RFeH','TFeH')

conditions_mass = list()
conditions_unc = list()

# Lendo arquivos de concentrações
for (i in conditions){
  code=paste("conditions_mass[['",i,"']]","<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  code_unc=paste("conditions_unc[['",i,"']]","<-","read.csv('","../../outputs/concentrations/",i,"unc.csv')",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}

# Eliminando colunas desnecessárias
removidos = c("SampleID","SiteName","SampleType","diamesano","volumem3",
              "Duplicate","Cr","Rb","Sr","Zr","Cu","Ni")
for(i in names(conditions_mass)){
  
  #i = 'RFcH'
  data = conditions_mass[[i]]
  data_unc = conditions_unc[[i]]
  
  # Remove colunas desnecessárias
  data = data[,!names(data) %in% removidos]
  data_unc = data_unc[,!names(data_unc) %in% removidos]
  
  # Transforma a coluna Date em tipo date para ordenação
  data$Date = as.POSIXct(strptime(data$Date,format='%Y-%m-%d %H:%M:%S',tz='GMT'))
  data_unc$Date = as.POSIXct(strptime(data_unc$Date,format='%Y-%m-%d %H:%M:%S',tz='GMT'))
  
  # ordena por Date, pois o PMF só aceita se estiver ordenado
  data<-data[order(data$Date),]
  data_unc<-data_unc[order(data_unc$Date),]

  # data no formato do PMF como rownames
  rownames(data) <- strftime(data$Date,format='%d/%m/%Y %H:%M')
  rownames(data_unc) <- strftime(data_unc$Date,format='%d/%m/%Y %H:%M')
  
  # remove coluna date para fazer conta do 8%
  data = data[,-1]
  data_unc = data_unc[,-1]
  
  # muda na lista de fato
  conditions_mass[[i]] = data
  conditions_unc[[i]] = data_unc
}

# Acrescenta 8% da concentração no erro 
conditions_unc8 = list()
for(i in names(conditions_mass)) {
  conditions_unc8[[i]] = sqrt( (conditions_mass[[i]]*0.08)^2 + conditions_unc[[i]]^2 )
}

# Cria diretório pmf_fa
if(!('pmf_fa' %in% list.files("../../outputs/"))) dir.create("../../outputs/pmf_fa")

# Salvar os arquivos para análise PMF/FA, não pode ter aspas
for(i in names(conditions_mass)){
  folder = '../../outputs/pmf_fa/'
  
  # coloca as colunas Date
  conditions_mass[[i]] = cbind(Date=rownames(conditions_mass[[i]]),conditions_mass[[i]])
  conditions_unc[[i]] = cbind(Date=rownames(conditions_unc[[i]]),conditions_unc[[i]])
  conditions_unc8[[i]] = cbind(Date=rownames(conditions_unc8[[i]]),conditions_unc8[[i]])
  
  # Salva
  write.csv(conditions_mass[[i]], paste(folder,i,'.csv',sep=''),quote=F,row.names=F)
  write.csv(conditions_unc[[i]], paste(folder,i,'unc.csv',sep=''),quote=F,row.names=F)
  write.csv(conditions_unc8[[i]], paste(folder,i,'unc8.csv',sep=''),quote=F,row.names=F)
}

