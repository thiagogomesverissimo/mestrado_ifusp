################################################
rel<-rbind("Sigla & Casos & Média & Desvio da média & Mediana & Ultrapassagens ")
#Estatística descritiva
for (i in conditions){
  code=paste("describe(",i,"$MassConc)",sep="")
  x=eval(parse(text=code))
  x<-round(x,2)
  #Utrapassagem padrão
  if(substr(i,2,2)=="F")
    ultra_code<-paste("sum(",i,"$MassConc>25)",sep="")
  else 
    ultra_code<-paste("sum(",i,"$MassConc>70)",sep="")
  ultra<-eval(parse(text=ultra_code))
  linha<-paste(i,x[2],x[3],x[13],x[5],ultra,sep=" & ")
  rel<-rbind(rel,linha)
}
rel
write.csv(rel,'../../outputs/nima_descritiva.csv',row.names=F)

xtable(describe(pmFinoNMA))

