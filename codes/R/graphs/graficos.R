rm(list=ls())
setwd("~/Dropbox/pesquisa/ghana/git/mestradoif/R")
library("psych")
library("lattice")

#Completos
CFCH<-read.csv("Routputs/tablesFULL/CFCH.csv",header=TRUE)
CICH<-read.csv("Routputs/tablesFULL/CICH.csv",header=TRUE)
CFSH<-read.csv("Routputs/tablesFULL/CFSH.csv",header=TRUE)
CISH<-read.csv("Routputs/tablesFULL/CISH.csv",header=TRUE)
AFCH<-read.csv("Routputs/tablesFULL/AFCH.csv",header=TRUE)
TFCH<-read.csv("Routputs/tablesFULL/TFCH.csv",header=TRUE)
AICH<-read.csv("Routputs/tablesFULL/AICH.csv",header=TRUE)
TICH<-read.csv("Routputs/tablesFULL/TICH.csv",header=TRUE)
AFSH<-read.csv("Routputs/tablesFULL/AFSH.csv",header=TRUE)
TFSH<-read.csv("Routputs/tablesFULL/TFSH.csv",header=TRUE)
AISH<-read.csv("Routputs/tablesFULL/AISH.csv",header=TRUE)
TISH<-read.csv("Routputs/tablesFULL/TISH.csv",header=TRUE)
CFH<-read.csv("Routputs/tablesFULL/CFH.csv",header=TRUE)
CIH<-read.csv("Routputs/tablesFULL/CIH.csv",header=TRUE)
noaa<-read.csv("Routputs/noaa/noaaOrganizado.csv",header=TRUE)



plot(noaa$YRMODAHRMN, 
     noaa$DIR,
     main="xxx",
     type="p",
     ylab=expression("ng/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 


#Podemos plotar massxTemperatura,massxdirecao,massa x velocidadevento
################################################################################
names(CFCH)
min(CFCH$diaMedio)
daterange=c(min(CFCH$diaMedio),max(CFCH$doiaMedio))

plot(CFCH$diaMedio, 
     CFCH$MassConc,
     main="xxx",
     type="p",
     ylab=expression("ng/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 

#Plotando algumas figuras
#Histograma: Fazer para todos elementos?
png(file='../../latex/images/pm/pm10distr_massa1.png')
par(mfrow=c(2,4))
for (i in seq(2,16,by=2)) {
  hist(pm10[,i],
       main=substitute("elemento: " *num,list(num=names(pm10)[i])), 
       xlab=expression(mu* "g/m" ^3),
       col="lightblue")
}
dev.off()

png(file='../../latex/images/pm/pm25distr_massa1.png')
par(mfrow=c(2,4))
for (i in seq(18,32,by=2)) {
  hist(pm10[,i],
       main=substitute("elemento: " *num,list(num=names(pm2.5)[i])), 
       xlab=expression(mu* "g/m" ^3),
       col="lightblue")
}
dev.off()

png(file='../../latex/images/pm/pm10totalmass.png')
hist(pm10$MassConc,main="PM10 - Distribuição da massa", xlab=expression(mu* "g/m" ^3),col="lightblue")
dev.off()

png(file='../../latex/images/pm/pm25totalmass.png')
hist(pm2.5$MassConc,main="PM10 - Distribuição da massa", xlab=expression(mu* "g/m" ^3),col="lightblue")
dev.off()

#função densidade
densidade<-density(pm2.5$MassConc,na.rm=TRUE)
png(file='../../latex/images/pm/pm25densidade.png')
plot(densidade,main="PM2.5 densidade ")
dev.off()

densidade<-density(pm10$MassConc,na.rm=TRUE)
png(file='../../latex/images/pm/pm10densidade.png')
plot(densidade,main="PM10 densidade ")
dev.off()

#Temporal Completo
png(file='../../latex/images/pm/pm10FeTemporal.png')
plot(pm10$EndTime, 
     pm10$FE,
     main="Fe pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10SITemporal.png')
plot(pm10$EndTime, 
     pm10$SI,
     main="Si pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10NaTemporal.png')
plot(pm10$EndTime, 
     pm10$NA.,
     main="Na pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10MgTemporal.png')
plot(pm10$EndTime, 
     pm10$MG,
     main="Mg pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10AlTemporal.png')
plot(pm10$EndTime, 
     pm10$AL,
     main="Al pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10PTemporal.png')
plot(pm10$EndTime, 
     pm10$P,
     main="P pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10STemporal.png')
plot(pm10$EndTime, 
     pm10$P,
     main="S pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10ClTemporal.png')
plot(pm10$EndTime, 
     pm10$CL,
     main="Cl pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10KTemporal.png')
plot(pm10$EndTime, 
     pm10$K,
     main="K pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10TiTemporal.png')
plot(pm10$EndTime, 
     pm10$TI,
     main="Ti pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10CaTemporal.png')
plot(pm10$EndTime, 
     pm10$CA,
     main="Ca pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10VTemporal.png')
plot(pm10$EndTime, 
     pm10$V,
     main="V pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10CrTemporal.png')
plot(pm10$EndTime, 
     pm10$CR,
     main="Cr pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10MnTemporal.png')
plot(pm10$EndTime, 
     pm10$MN,
     main="Mn pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10NiTemporal.png')
plot(pm10$EndTime, 
     pm10$NI,
     main="Ni pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()


png(file='../../latex/images/pm/pm10CuTemporal.png')
plot(pm10$EndTime, 
     pm10$CU,
     main="Cu pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10ZnTemporal.png')
plot(pm10$EndTime, 
     pm10$ZN,
     main="ZN pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10BrTemporal.png')
plot(pm10$EndTime, 
     pm10$BR,
     main="Br pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()


png(file='../../latex/images/pm/pm10RbTemporal.png')
plot(pm10$EndTime, 
     pm10$RB,
     main="Rb pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10SRTemporal.png')
plot(pm10$EndTime, 
     pm10$SR,
     main="Sr pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10ZrTemporal.png')
plot(pm10$EndTime, 
     pm10$ZR,
     main="Zr pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()


png(file='../../latex/images/pm/pm10PbTemporal.png')
plot(pm10$EndTime, 
     pm10$PB,
     main="Pb pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10BaTemporal.png')
plot(pm10$EndTime, 
     pm10$BA,
     main="Ba pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10YTemporal.png')
plot(pm10$EndTime, 
     pm10$Y,
     main="Y pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

png(file='../../latex/images/pm/pm10ThTemporal.png')
plot(pm10$EndTime, 
     pm10$TH,
     main="Th pm10",
     type="p",
     xlab="Ano",
     ylab=expression(mu* "g/m" ^3),
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid() 
dev.off()

plot(as.factor(format(pm2.5$StartTime,"%A")),pm2.5[,73],col="lightpink")
plot(as.factor(format(pm10$StartTime,"%A")),pm10[,73],col="lightpink")


#temporal com subset
plot(pm10$EndTime[1:200], pm10$FE[1:200],type="p",xlab="data em qual unidade?",ylab="nanogram") # type l means linha

#médias por mês
meansFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y-%m"),mean,na.rm=TRUE) 
meansFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(meansFE))
plot(meansFE$StartTime,meansFE$FE,type="l")


##por ano # fazer por semana
yearsFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y"),mean,na.rm=TRUE) #herda o nome da coluna nox
yearsFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(yearsFE))
plot(yearsFE$StartTime,yearsFE$FE,type="l")

##por valores máximos
maxsFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y-%m"),max,na.rm=TRUE)
maxsFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(maxsFE))
#plot(maxsFE$StartTime,maxsFE$FE,type="l")

## sumarizing por mês,ano
##criar uma nova coluna para 12:00 de casa dia e não esqucer de conver para data as.Date(means$date)

# melhorando plot
meansFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%Y-%m"),mean,na.rm=TRUE) 
meansFE$StartTime<-seq(min(pm10$StartTime),max(pm10$StartTime),length=nrow(meansFE))
plot(meansFE$StartTime,meansFE$FE,type="b",
     lwd=1.5,
     pch=16,
     col="darkorange2")
grid()

# poluição semanal
png(file='../../latex/images/pm/semanalFE.png')
meansFE<-aggregate(pm10["FE"],format(pm10["StartTime"],"%w-%H"),mean,na.rm=TRUE) 
plot(meansFE$FE,
     xaxt="n", # não plotar eixo x
     type="n", 
     main="Ferro por dia da semana",
     xlab="dia da semana",
     ylab="ng"
)
axis(1,at=seq(1,169,24),labels=FALSE) # 24 horas vezes 7 dias
days<-c("sun","mon","tue","wed","thu","fri","sat")
location.days<-seq(13,157,24)
mtext(days,side=1,line=1,at=location.days)
abline(v =seq(1,169,24),col="grey85")
lines(meansFE$FE,col="darkorange2",lwd=2)
dev.off()


#box and whisker plot
as.factor(format(pm10$StartTime,"%m"))
#plot(as.factor(format(pm10$StartTime,"%m")),pm10$FE)
#plot(as.factor(format(pm10$StartTime,"%m-%Y")),pm10$FE,col="lightpink")

#plotar uma amostra dos dados
#pairs(pm10[sample(1:nrow(pm10),50),c(2,4,6)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")

#plotar com TODOS dados
#pairs(pm10[,c(2,4,6,8,10,12)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")

#implemtar:
# Qual recorte do harmatan, ditribuição da velocidade do vento, subtrair pm10-pm25 corrigir erro
