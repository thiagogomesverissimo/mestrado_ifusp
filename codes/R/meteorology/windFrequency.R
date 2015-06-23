rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

noaa_harvard<-read.csv("../../outputs/noaa_from_harvard.csv")
noaa_harvard$YRMODAHRMN<-strptime(noaa_harvard$YRMODAHRMN,"%Y-%m-%d %H:%M:%S")


#Estações do ano desde agosto 2006 até agosto 2008
#Início e fim das datas para fazer os filtros.
autumn2006<-list(begin=strptime('21-09-2006','%d-%m-%Y'),end=strptime('20-12-2006','%d-%m-%Y'),titulo='Outono 2006')
winter2006_2007<-list(begin=strptime('21-12-2006','%d-%m-%Y'),end=strptime('20-03-2007','%d-%m-%Y'),titulo='Inverno 2006-2007')
spring2007<-list(begin=strptime('21-03-2007','%d-%m-%Y'),end=strptime('20-06-2007','%d-%m-%Y'),titulo='Primavera 2007')
summer2007<-list(begin=strptime('21-06-2007','%d-%m-%Y'),end=strptime('20-09-2007','%d-%m-%Y'),titulo='Verão 2007')
autumn2007<-list(begin=strptime('21-09-2007','%d-%m-%Y'),end=strptime('20-12-2007','%d-%m-%Y'),titulo='Outono 2007')
winter2007_2008<-list(begin=strptime('21-12-2007','%d-%m-%Y'),end=strptime('20-03-2008','%d-%m-%Y'),titulo='Inverno 2007-2008')
spring2008<-list(begin=strptime('21-03-2008','%d-%m-%Y'),end=strptime('20-06-2008','%d-%m-%Y'),titulo='Primavera 2008')
harmattan2006_2007<-list(begin=strptime('25-12-2006','%d-%m-%Y'),end=strptime('07-02-2007','%d-%m-%Y'),titulo='Harmattan(2006-2007)')
harmattan2007_2008<-list(begin=strptime('25-12-2007','%d-%m-%Y'),end=strptime('07-02-2008','%d-%m-%Y'),titulo='Harmattan(2007-2008)')

periodos<-list(autumn2006,winter2006_2007,spring2007,summer2007,autumn2007,winter2007_2008,spring2008,harmattan2006_2007,harmattan2007_2008)

for (i in periodos){
  windFrequency(subset(noaa_harvard,noaa_harvard[,3] >= i$begin & noaa_harvard[,3] <= i$end),i$titulo)
}




