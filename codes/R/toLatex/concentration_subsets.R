rm(list=ls())

source("myfunctions/load.R")

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# All conditions
conditions<-c(residencial,traffic)

concentration_subsets<-data.frame(rbind(
#  c('JFcH','via residencial e avenida com tráfego intenso', '$MP_{2.5}$' , 'com Harmathan'),
  c('RFcH','residencial', '$MP_{2.5}$', 'com Harmathan'),
  c('TFcH','avenida com tráfego intenso', '$MP_{2.5}$', 'com Harmathan'),
#  c('JFsH','via residencial e avenida com tráfego intenso', '$MP_{2.5}$', 'sem Harmathan'),
#  c('RFsH','residencial', '$MP_{2.5}$', 'sem Harmathan'),
#  c('TFsH','avenida com tráfego intenso', '$MP_{2.5}$', 'sem Harmathan'),
#  c('JFeH','via residencial e avenida com tráfego intenso', '$MP_{2.5}$', 'só Harmathan'),
#  c('JIcH','via residencial e avenida com tráfego intenso', '$MP_{10}$', 'com Harmathan'),
  c('RIcH','residencial', '$MP_{10}$','com Harmathan'),
  c('TIcH','avenida com tráfego intenso', '$MP_{10}$','com Harmathan'),
#  c('JIsH','via residencial e avenida com tráfego intenso', '$MP_{10}$', 'sem Harmathan'),
#  c('RIsH','residencial', '$MP_{10}$', 'sem Harmathan'),
#  c('TIsH','avenida com tráfego intenso', '$MP_{10}$', 'sem Harmathan'),
#  c('JIeH','via residencial e avenida com tráfego intenso', '$MP_{10}$', 'só Harmathan'),
  c('RGcH','residencial', '$MP_{2.5_10}$','com Harmathan'),
  c('TGcH','avenida com tráfego intenso', '$MP_{2.5_10}$','com Harmathan')
))

# Nomes das colunas
colnames(concentration_subsets)<-c('Sigla','Região','Moda','Harmathan')

#Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  if(debug) print(code)
  eval(parse(text=code))
}

# Adiciona coluna para Casos
concentration_subsets = cbind(concentration_subsets,Casos=NA)

# Contabiliza o número de casos para cada condição
for (i in concentration_subsets$Sigla){
  comando = paste('Casos=nrow(',i,')',sep="")
  eval(parse(text=comando))
  print(i)
}

quantidades<-c()
for (i in conditions){
  comando=paste('quantidades<-append(quantidades,nrow(',i,'))',sep="")
  eval(parse(text=comando))
}

concentration_subsets<-cbind(concentration_subsets,quantidades)
colnames(concentration_subsets)<-c('Sigla','Região','Moda','Harmathan','Casos')

print(xtable(concentration_subsets), 
      type="latex", 
      include.rownames = F, 
      floating = FALSE,
      sanitize.text.function = identity,
      file="../../outputs/concentration_subsets.tex")
