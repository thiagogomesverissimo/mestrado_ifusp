rm(list=ls())

source("myfunctions/load.R")

residencial = c('RFsH','RGsH','RIsH')   
traffic = c('TFsH','TGsH','TIsH') 

# All conditions
conditions<-c(residencial,traffic)

concentration_subsets<-data.frame(rbind(
  c('RFsH','Residencial', '$MP_{2.5}$'),
  c('TFsH','Tráfego intenso', '$MP_{2.5}$'),
  c('RIsH','Residencial', '$MP_{10}$'),
  c('TIsH','Tráfego intenso', '$MP_{10}$'),
  c('RGsH','Residencial', '$MP_{2.5-10}$'),
  c('TGsH','Tráfego intenso', '$MP_{2.5-10}$')
))

# Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  if(debug) print(code)
  eval(parse(text=code))
}

# Contabiliza o número de casos para cada condição
quantidades<-c()
for (i in conditions){
  comando = paste('quantidades<-append(quantidades,nrow(',i,'))',sep="")
  eval(parse(text=comando))
}
concentration_subsets<-cbind(concentration_subsets,Casos=quantidades)

# Renomeia colunas
colnames(concentration_subsets)<-c('Sigla','Região','Moda','Casos')

print(xtable(concentration_subsets), 
      type="latex", 
      include.rownames = F, 
      floating = FALSE,
      sanitize.text.function = identity,
      file="../../outputs/tabela_subset_sem_harmata.tex")
