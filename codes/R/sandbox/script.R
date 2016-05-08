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
