##rm(list=ls()) # limpa tudo na memória

source("myfunctions/load.R")

#Inspecionado os dados
dados<-read.csv("../../inputs/meteorology/noaaMeteorology.csv",sep=",",colClasses="character")

## removendo dir=*** e wind=***, pois são dados não medido 
dados<-dados[!(dados$DIR=="***" & dados$SPD=="***"),]

## Removendo wind="***", pois não sei o que significa
dados<-dados[!(dados$SPD=="***"),]

## Removendo direção 990, pois não sei o que significa
dados<-dados[!(dados$DIR=='990'),]

#Convertendo o vento
dados$SPD<-as.numeric(dados$SPD)
dados$SPD<-dados$SPD*0.44704 # conversão para m/s

## Ocorrências de calmaria serão adicionadas em uma coluna extra como TRUE (dir="***" e SPD=0)
dados$Calmaria<-(dados$DIR=="***" & dados$SPD==0) #coluna extra

# Converte direção para inteiro
dados$DIR<-as.integer(dados$DIR)

write.csv(dados,"../../outputs/noaa_from_harvard.csv",row.names=FALSE)
