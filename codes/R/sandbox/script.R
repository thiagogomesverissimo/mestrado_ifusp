rm(list=ls())
source("myfunctions/load.R")

detach("package:Hmisc", unload=TRUE) 
RGeH = read.csv('../../outputs/pmf_fa/RGeH.csv')
describe(RGeH)

RGsH = read.csv('../../outputs/pmf_fa/RGsH.csv')
describe(RGsH)

RFeH = read.csv('../../outputs/pmf_fa/RFeH.csv')
describe(RFeH)

RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
describe(RFsH)

# Distribuição da massa
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
RFsH$Date = strptime(RFsH$Date,format="%d/%m/%Y %H:%M")
hist(RFsH$mass,main="PM10 - Distribuição da massa", xlab=expression(mu* "g/m" ^3),col="lightblue",breaks = 100)

# Distribuição da massa para multiplos elementos
pm10 = read.csv('../../outputs/pmf_fa/RIcH.csv')
par(mfrow=c(2,4))
for (i in seq(2,16,by=2)) {
  hist(pm10[,i],
       main=substitute("elemento: " *num,list(num=names(pm10)[i])), 
       xlab=expression(mu* "g/m" ^3),
       col="lightblue")
}

#função densidade
densidade<-density(RFcH$Fe,na.rm=TRUE)
plot(densidade,main="PM2.5 densidade ")



# por dia da semana
data = read.csv('../../outputs/pmf_fa/RFsH.csv')
data$date = as.POSIXct(strptime(data$Date,format="%d/%m/%Y %H:%M"))
#timeVariation(data,pollutant = 'Fe',period = 'year')
#trendLevel(data,pollutant = "Fe")
#linearRelation(data,x= 'Fe',y='mass')

#scatterPlot(data,x='Fe',y='Si',linear = TRUE,type = c("season", "weekend"))


#dias_semana = read.csv('../../inputs/traducoes/weekdays.csv',header=F)
#match(days,dias_semana[,1])
#dias_semana[match(days,dias_semana),2]



#plot(as.factor(format(data$Date,"%Y-%m")),RFcH[,7],col="lightpink")

#days = format(data$Date,"%A")
#days[match(teses$grau,map_grau$antigo),2]

#RFcH[,7]
#teses$grau = map_grau[match(teses$grau,map_grau$antigo),2]

#meansFE<-aggregate(data$S,format(data$Date,"%Y-%m"),mean)
#meansFE$Date<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(meansFE))
#plot(meansFE$StartTime,meansFE$FE,type="l")

##por ano # fazer por semana
#yearsFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y"),mean,na.rm=TRUE) #herda o nome da coluna nox
#yearsFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(yearsFE))
#plot(yearsFE$StartTime,yearsFE$FE,type="l")

##por valores máximos
#maxsFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y-%m"),max,na.rm=TRUE)
#maxsFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(maxsFE))
#plot(maxsFE$StartTime,maxsFE$FE,type="l")

## sumarizing por mês,ano
##criar uma nova coluna para 12:00 de casa dia e não esqucer de conver para data as.Date(means$date)

# melhorando plot
#meansFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y-%m"),mean,na.rm=TRUE) 
#meansFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(meansFE))
#plot(meansFE$StartTime,meansFE$FE,type="b",
#     lwd=1.5,
#     pch=16,
#     col="darkorange2")
#grid()

# poluição semanal
#png(file='../../latex/images/pm/semanalFE.png')
#meansFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%w-%H"),mean,na.rm=TRUE) 
#plot(meansFE$FE,
#     xaxt="n", # não plotar eixo x
#     type="n", 
#     main="Ferro por dia da semana",
#     xlab="dia da semana",
#     ylab="ng"
#)
#axis(1,at=seq(1,169,24),labels=FALSE) # 24 horas vezes 7 dias
#days<-c("sun","mon","tue","wed","thu","fri","sat")
#location.days<-seq(13,157,24)
#mtext(days,side=1,line=1,at=location.days)
#abline(v =seq(1,169,24),col="grey85")
#lines(meansFE$FE,col="darkorange2",lwd=2)
#dev.off()


#box and whisker plot
#as.factor(format(pm10$StartTime,"%m"))
#plot(as.factor(format(pm10$StartTime,"%m")),pm10$FE)
#plot(as.factor(format(pm10$StartTime,"%m-%Y")),pm10$FE,col="lightpink")



#implemtar:
# Qual recorte do harmatan, ditribuição da velocidade do vento, subtrair pm10-pm25 corrigir erro
