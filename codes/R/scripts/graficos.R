rm(list=ls())
source("myfunctions/load.R")

# A função describe está no pacote Hmisc e psych, saudades do python...
detach("package:Hmisc", unload=TRUE) 

# Massa comparando com limites WHO
massa_temporal('RFcH','pm2.5')
massa_temporal('TFcH','pm2.5')

massa_temporal('RIcH','pm10')
massa_temporal('TIcH','pm10')

# Correlações
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
pairs(RFsH[,c(2,4,6,8,10,12)], lower.panel = panel.smooth,upper.panel = NULL, col="skyblue3")

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

