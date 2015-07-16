rm(list=ls())

source("myfunctions/load.R")

#Há dados para BlackCarbon apenas para PM2.5
#Os dados de BlackCarbon estão em ug/cm2. Falta dividir pelo volume e multiplicar pela área.
BlackCarbon<-read.csv("../../inputs/BlackCarbon/all.csv")

names(BlackCarbon)[1]<-'SampleID'
names(BlackCarbon)[2]<-'BC'
names(BlackCarbon)[3]<-'BCerror'

#trata Id do BC
BlackCarbon<-TrataID(BlackCarbon,1)

#TODO: Faltantes Black Carbon, há o black carbon, ver com o américo
#Substituir pela media temporariamente, até eu encontrar os corretos. 
#GHA751 Amostra rasgada
print(sum(is.na(BlackCarbon$BC))) # Faltantes no geral
BlackCarbon$BC<-na2media(BlackCarbon$BC)
BlackCarbon$BCerror<-na2media(BlackCarbon$BCerror)
write.csv(BlackCarbon,"../../outputs/BlackCarbon.csv",row.names=F)
