rm(list=ls())
source("myfunctions/load.R")

noaa_harvard<-read.csv("../../outputs/noaa_from_harvard.csv")
noaa_harvard$YRMODAHRMN<-strptime(noaa_harvard$YRMODAHRMN,"%Y%m%d%H%M")

teste = noaa_harvard[,c(3,9,8)]
colnames(teste) = c("date","ws","wd")

write.csv(teste,'../../outputs/noaa2openair.csv',row.names=F)
