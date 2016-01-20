rm(list=ls())
source("myfunctions/load.R")

noaa_harvard<-read.csv("../../outputs/noaa_from_harvard.csv")
noaa_harvard$YRMODAHRMN<-strptime(noaa_harvard$YRMODAHRMN,"%Y%m%d%H%M")

# Calmaria no openair way, ou seja, quando wd==0
noaa_harvard[noaa_harvard$Calmaria,8] = 0

# Preparando data.frame para windRose
noaa_harvard = noaa_harvard[,c(3,9,8)]
colnames(noaa_harvard) = c("date","ws","wd")

my.statistic <- list("fun"=length,
                     "unit" = "%",
                     "scale" = "all", 
                     "lab" = "" , 
                     "fun2" = function(x) paste(signif(mean(x, na.rm = TRUE), 3),'m/s') , 
                     "lab2" = "velocidade média do vento",
                     "labcalm" = function(x) round(x, 1))

pdf(file='../../outputs/windRoseNoaaHarvard.pdf')
  windRose(noaa_harvard, statistic=my.statistic, angle=22.5)
dev.off()


meses_harmatao = c('December', 'January') #'February'
harmatao = subset(noaa_harvard, months(noaa_harvard$date) %in% meses_harmatao)
pdf(file='../../outputs/windRoseHarmatao.pdf')
  windRose(harmatao, statistic=my.statistic, angle=22.5)
dev.off()           

