rm(list=ls())

source("myfunctions/load.R")

residencial = c('RFcH','RGcH','RIcH')   
traffic = c('TFcH','TGcH','TIcH') 

# All conditions
conditions<-c(residencial,traffic)

concentration_subsets<-data.frame(rbind(
  c('RFcH','Residencial', '$MP_{2.5}$'),
  c('TFcH','Tráfego intenso', '$MP_{2.5}$'),
  c('RIcH','Residencial', '$MP_{10}$'),
  c('TIcH','Tráfego intenso', '$MP_{10}$'),
  c('RGcH','Residencial', '$MP_{2.5-10}$'),
  c('TGcH','Tráfego intenso', '$MP_{2.5-10}$')
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
      file="../../outputs/tabela_subset_com_harmata.tex")