#rm(list=ls())
source("myfunctions/load.R")

noaa_harvard<-read.csv("../../outputs/noaa_from_harvard.csv")
noaa_harvard$YRMODAHRMN<-as.POSIXct(strptime(noaa_harvard$YRMODAHRMN,"%Y%m%d%H%M",tz="GMT"))

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
                     "lab2" = "v", # velocidade média
                     "labcalm" = function(x) round(x, 1))

# “default”, “year”, “hour”, “month”, “season”, “weekday”, “site”, “weekend”, 
# “monthyear”, “daylight”, “dst” (daylight saving time). 

# Conferir o fuso horário
#mydata <- cutData(noaa_harvard, type = "daylight")
#mydata$daylight = gsub('daylight','dia',mydata$daylight)
#mydata$daylight = gsub('nighttime','noite',mydata$daylight)

pdf(file='../../outputs/windRoseNoaaHarvard.pdf')
  windRose(noaa_harvard, statistic=my.statistic, angle=22.5)
dev.off()

pdf(file='../../outputs/windRose_daylight.pdf')
  windRose(noaa_harvard, statistic=my.statistic, angle=22.5, type="daylight")
dev.off()

pdf(file='../../outputs/windRose_horaria.pdf')
par(mar=c(5,3,2,2)+0.1)
windRose(noaa_harvard, 
         statistic=my.statistic, 
         angle=22.5, 
         type="hour",
         ws.int=2,
     #    width = 3,
     #    border = T,
         grid.line = 20,
         breaks=4)
dev.off()

pdf(file='../../outputs/windRose_mensal.pdf')
  windRose(noaa_harvard, statistic=my.statistic, angle=22.5, grid.line = 10,type="month")
dev.off()

# removendo o Harmatão
meses_harmatao = c('December', 'January') #'February'
harmatao = subset(noaa_harvard, months(noaa_harvard$date) %in% meses_harmatao)
pdf(file='../../outputs/windRoseHarmatao.pdf')
  windRose(harmatao, statistic=my.statistic, angle=22.5)
dev.off()           

