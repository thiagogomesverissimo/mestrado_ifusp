rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych
detach("package:Hmisc", unload=TRUE) 

#residencial = c('RFcH','RGcH','RIcH')   
#traffic = c('TFcH','TGcH','TIcH') 

residencial = c('RFcH','RIcH')   
traffic = c('TFcH','TIcH') 

# All conditions
conditions<-c(residencial,traffic)

# Lendo arquivos de concentrações
for (i in conditions){
  code=paste(i,"<-","read.csv('","../../outputs/concentrations/",i,".csv')",sep="")
  if(debug) print(code)
  eval(parse(text=code))
}

rel<-rbind('\\begin{tabular}{rrrrrr}')
rel<-rbind(rel,'\\hline')
rel<-rbind(rel,"Descrição & n & Média & Desvio Padrão & Mediana & Ultrapassagens OMS \\\\")
rel<-rbind(rel,'\\hline')
# Estatística descritiva
for (i in conditions){
  #x='RFcH'
  code=paste("describe(",i,"$mass)",sep="")
  x=eval(parse(text=code))
  x<-round(x,2)
  # Utrapassagem padrão da OMS
  if(substr(i,2,2)=="F"){
    ultra_code<-paste("sum(",i,"$mass>25)/x$n",sep="")
    ultra<-eval(parse(text=ultra_code))*100
    ultra = round(ultra,2)
    ultra = paste(ultra,'\\%')
  }
  else if(substr(i,2,2)=="I"){
    ultra_code<-paste("sum(",i,"$mass>50)/x$n",sep="")
    ultra<-eval(parse(text=ultra_code))*100
    ultra = round(ultra,2)
    ultra = paste(ultra,'\\%')
  }
  else
    ultra = '-'
  
  linha<-paste(i,x[2],x[3],x[13],x[5],ultra,sep=" & ")
  rel<-rbind(rel,paste(linha,' \\\\',sep=''))
}
rel<-rbind(rel,'\\hline')
rel<-rbind(rel,'\\end{tabular}')

# Salva tex 
write.table(rel,'../../outputs/tabela_descritiva_com_harmatan.tex',
          row.names=F,
          col.names=F,
          quote=F)


