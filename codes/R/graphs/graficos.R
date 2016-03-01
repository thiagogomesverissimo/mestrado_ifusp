rm(list=ls())
source("myfunctions/load.R")

#Completos
RFcH<-read.csv("../../outputs/pmf_fa/RFcH.csv")
RFcH = RFcH[-which.max(RFcH$mass),]
RFcH$Date = strptime(RFcH$Date,format="%d/%m/%Y %H:%M")

pdf('../../outputs/RFcH_massa.pdf')
plot(RFcH$Date, 
     RFcH$mass,
     type="p",
     ylab=expression(" mg/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid()
dev.off()


plot(RFcH$Date, 
     RFcH$Na,
     type="p",
     ylab=expression(" mg/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid()




hist(RFcH$mass,main="PM10 - Distribuição da massa", xlab=expression(mu* "g/m" ^3),col="lightblue")

#função densidade
densidade<-density(RFcH$mass,na.rm=TRUE)
plot(densidade,main="PM2.5 densidade ")


#Histograma: Fazer para todos elementos?
#png(file='../../latex/images/pm/pm10distr_massa1.png')
#par(mfrow=c(2,4))
#for (i in seq(2,16,by=2)) {
#  hist(pm10[,i],
#       main=substitute("elemento: " *num,list(num=names(pm10)[i])), 
#       xlab=expression(mu* "g/m" ^3),
#       col="lightblue")
#}
#dev.off()

#png(file='../../latex/images/pm/pm25distr_massa1.png')
#par(mfrow=c(2,4))
#for (i in seq(18,32,by=2)) {
#  hist(pm10[,i],
#       main=substitute("elemento: " *num,list(num=names(pm2.5)[i])), 
#      xlab=expression(mu* "g/m" ^3),
#       col="lightblue")
#}
#dev.off()

#png(file='../../latex/images/pm/pm10totalmass.png')
#hist(pm10$MassConc,main="PM10 - Distribuição da massa", xlab=expression(mu* "g/m" ^3),col="lightblue")
#dev.off()

# por dia da semana
plot(as.factor(format(RFcH$Date,"%A")),RFcH[,7],col="lightpink")

#médias por mês
#meansFE<-aggregate(RFcH$S,format(RFcH$Date,"%Y-%m"),mean)
#meansFE$Date<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(meansFE))
#plot(meansFE$StartTime,meansFE$FE,type="l")


daterange=c(min(RFcH$Date),max(RFcH$Date))

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

#plotar uma amostra dos dados
#pairs(pm10[sample(1:nrow(pm10),50),c(2,4,6)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")

#plotar com TODOS dados
#pairs(pm10[,c(2,4,6,8,10,12)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")

#implemtar:
# Qual recorte do harmatan, ditribuição da velocidade do vento, subtrair pm10-pm25 corrigir erro
