rm(list=ls())
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

# rosa dos ventos em 2007 completa
data2007 = subset(noaa_harvard, year(noaa_harvard$date) ==2007)
pdf(file='../../outputs/windRose2007.pdf')
  windRose(data2007, statistic=my.statistic, angle=22.5)
dev.off()

# rosa dos ventos horária
pdf(file='../../outputs/windRose_horaria.pdf')
par(mar=c(5,3,2,2)+0.1)
windRose(data2007, 
         statistic=my.statistic, 
         angle=22.5, 
         type="hour",
         ws.int=2,
         #    width = 3,
         #    border = T,
         grid.line = 20,
         breaks=4)
dev.off()

# rosa dos ventos mensal
#http://stackoverflow.com/questions/27355386/r-multiple-windrose-plot-using-windrose-from-openair-package
mensal <- cutData(data2007, type = "month")
#mensal$month = gsub('January','Janeiro',mensal$month)
#mensal$month = gsub('February','Fevereiro',mensal$month)
#mensal$month = gsub('March','Março',mensal$month)
#mensal$month = gsub('April','AbrilJaneiro',mensal$month)
#mensal$month = gsub('May','Maio',mensal$month)
#mensal$month = gsub('June','Junho',mensal$month)
#mensal$month = gsub('July','Julho',mensal$month)
#mensal$month = gsub('August','Agosto',mensal$month)
#mensal$month = gsub('September','Setembro',mensal$month)
#mensal$month = gsub('October','Outrubro',mensal$month)
#mensal$month = gsub('November','Novembro',mensal$month)
#mensal$month = gsub('December','Dezembro',mensal$month)
pdf(file='../../outputs/windRose_mensal.pdf')
  windRose(mensal, statistic=my.statistic, angle=22.5, grid.line = 10,type="month")
dev.off()

# removendo o Harmatão
meses_harmatao = c('December', 'January') #'February'
harmatao = subset(noaa_harvard, months(noaa_harvard$date) %in% meses_harmatao)
pdf(file='../../outputs/windRoseHarmatao.pdf')
  windRose(harmatao, statistic=my.statistic, angle=22.5)
dev.off()           

