rm(list=ls())
source("myfunctions/load.R")

## Critérios para a separação
#  NMA: área residencial, ruas não pavimentadas (R) 
#  NMT: avenida principal, com tráfego intenso de veículos (T)
#  Nomeclatura: 
#  - Local (R-residiencial, T-traffic ou J-joint) 
#  - Fino, Grosso ou Inalável (F, G, I) 
#  - Com/Sem/Exclusivamente Harmathan (cH / sH / eH)

# Siglas
conditions<-c('RFcH',
              'RIcH',
              'TFcH',
              'TIcH')

# Leitura dos arquivos do Fino
pmFino = read.csv('../../outputs/pmFino.csv')
pmFinoError = read.csv('../../outputs/pmFinoError.csv')

# Leitura dos arquivos do Inalável
pmInalavel = read.csv('../../outputs/pmInalavel.csv')
pmInalavelError = read.csv('../../outputs/pmInalavelError.csv')

#  Fino
RFcH <- subset(pmFino,pmFino$SiteName=="NMA")
TFcH <- subset(pmFino,pmFino$SiteName=="NMT")

# Incertezas Fino
RFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMA")
TFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMT")

# Inalável
RIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMA")
TIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMT")


# Incertezas Inalável
RIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMA")
TIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMT")

# Verifica se existe diretório 'concentrations', se não, criar um. 
if(!('concentrations' %in% list.files("../../outputs/"))) dir.create("../../outputs/concentrations")

# Salvando csv's
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}
