rm(list=ls()) # limpa tudo na memória
setwd("~/remota/repos/mestrado_ifusp/codes/R")

#Inspecionado os dados
dados<-read.csv("../../inputs/meteorology/noaaMeteorology.csv",sep=",",colClasses="character")

names(dados)
class(dados$DIR)
head(sort(dados$DIR))
head(dados[order(dados$DIR),8:9],30) # vemos os 30 primeiros em ordem crescente dir & wind 
tail(sort(dados$DIR)) #aqui podemos ver os valores 990 

#######################################################################################################
#trabalhando os dados
#Tipando a terceira coluna como data
head(dados[,3])
dados$YRMODAHRMN<-strptime(dados$YRMODAHRMN,"%Y%m%d%H%M")
class(dados[1,3]) #ver a classes
attributes(dados[1,3]) # ver atributos como: hora, segundo, dia, ano etc
max(dados[,3])
min(dados[,3])
max(dados[,3]) - min(dados[,3]) # Diferença de dias

## removendo dir=*** e wind=***, pois são dados não medido 
dados<-dados[!(dados$DIR=="***" & dados$SPD=="***"),]
head(dados[order(dados$DIR),8:9],30) # vemos os 30 primeiros em ordem crescente de dir & wind 

## Removendo wind="***", pois não sei o que significa
dados<-dados[!(dados$SPD=="***"),]
head(dados[order(dados$DIR),8:9],30)

#Convertendo o vento
dados$SPD<-as.numeric(dados$SPD)
dados$SPD<-dados$SPD*0.44704 # conversão para m/s
dados[is.na(dados$SPD),8:9] # pois o *** já foi removido
head(sort(dados[dados$SPD>0,9]))

## Ocorrências de calmaria serão adicionadas em uma coluna extra como TRUE (dir="***" e SPD=0)
dados$Calmaria<-(dados$DIR=="***" & dados$SPD==0) #coluna extra
sum(dados$Calmaria)
head(subset(dados,dados$Calmaria==T & dados$YR==2007)) # ver alguns dias de calmaria em 2007
dados$DIR<-as.integer(dados$DIR)
sum(is.na(dados$DIR))
dados[is.na(dados$DIR),8:9]

write.csv(dados,"../../outputs/noaa_from_harvard.csv",row.names=FALSE)