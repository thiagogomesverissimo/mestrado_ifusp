

#Thanks to Paul L. Delamater, Andrew O. Finley and Chad Babcock.
#A big part of this material was took from: 
#http://blue.for.msu.edu/lab-notes/NOAA_0.1-1/NOAA-ws-data.pdf
http://www1.ncdc.noaa.gov/pub/data/ish/ish-abbreviated.txt
ftp://ftp.ncdc.noaa.gov/pub/data/ish/ish-abbreviated.txt

#código da estação de Ghana: 654720

#Com a URL é construida (USAF-WBAN-ANO são números):
#ftp://ftp.ncdc.noaa.gov/pub/data/noaa/ANO/USAF-WBAN-ANO.gz

#URL onde os dados estão disponíveis:
base_url = "ftp://ftp.ncdc.noaa.gov/pub/data/noaa/"
#base_url = "http://www1.ncdc.noaa.gov/pub/data/noaa/"

#Baixando arquivos
dir.create("../../outputs/noaa")
for(year in 2006:2008){
    wget<-paste("wget -P ../../outputs/noaa ftp://ftp.ncdc.noaa.gov/pub/data/noaa/",
                year,
                "/",
                "654720-99999-",
                year,
                ".gz",
                sep="")
    #print(wget)
    system(wget,intern=FALSE,ignore.stderr=TRUE)
}

system("gunzip -r ../../outputs/noaa/*.gz",intern=FALSE,ignore.stderr=TRUE)

#Bibliotecas necessárias...
# sudo apt-get install libgdal1-dev libproj-dev
library(rgdal)
library(spdep)
library(sp)
library(fields)
library(MBA)

#conversão do padrão metar para csv
files<-list.files("../../outputs/noaa/")
column.widths<-c(4,6,5,4,2,2,2,2,1,6,7,5,5,5,4,3,1,1,4,1,5,1,1,1,6,1,1,1,5,1,5,1,5,1)

for (i in 1:length(files)){
  data<-read.fwf(paste("../../outputs/noaa/",files[i],sep=""),column.widths)
  data<-data[,c(2:8,10:11,13,16,19,29,31,33)]
  names(data)<-c("USAFID","WBAN","YR","M","D","HR","MIN","LAT","LONG","ELEV","WIND.DIR","WIND.SPD","TEMP","DEW.POINT","ATM.PRESS")
  data$LAT<-data$LAT/1000
  data$LONG<-data$LONG/1000
  data$TEMP<-data$TEMP/10
  data$WIND.SPD<-data$WIND.SPD/10
  data$DEW.POINT<-data$DEW.POINT/10
  data$ATM.PRESS<-data$ATM.PRESS/10
  write.csv(data,file=paste("../../outputs/noaa/",files[i],".csv",sep=""),row.names=FALSE)
}

#grafico com as estações em michigan
my.state<-map('county', 'Accra')
title("Accra")
map.axes()
points(stations$LONG,stations$LAT,pch=16,col="red")

files<-list.files("data/stations")

#escolhendo uma estação
st<-read.csv(file=paste("data/csv/",files[2],".csv",sep=""))

#Remover as colunas: WIND.DIR,DEW.POINT,ATM.PRES
st$ATM.PRESS<-NULL
st$WIND.DIR<-NULL
st$DEW.POINT<-NULL

#999.9 é NA
st$TEMP[st$TEMP=="999.9"]<-NA
st$WIND.SPD[st$WIND.SPD=="999.9"]<-NA

#Há estações que medem de 15 e 15 minutos. Vamos pegar só os dados de hora em hora.
dim(st)
st<-subset(st,st$MIN==0)
dim(st)

st<-st[order(st$M,st$D,st$HR),]
st$DATE<-as.Date(paste(st$YR,st$M,st$D,sep="-"),format="%Y-%m-%d")

diaria<-list(DATE=format(st$DATE,"%Y-%m-%d"))
d.mean<-aggregate(st$TEMP,diaria,mean,na.rm=T)
d.mean$DATE<-as.Date(d.mean$DATE)

mensal<-list(DATE=format(st$DATE,"%Y-%m"))
m.mean<-aggregate(st$TEMP,mensal,mean,na.rm=T)
m.mean$DATE<-as.Date(paste(m.mean$DATE,"-15",sep="")) #dia 15 de cada mês

plot(st$DATE,st$TEMP,main="Temperature readings",ylab="Celsius Degree",xlab="month",col="gray")
points(d.mean$DATE,d.mean$x,col="brown",cex = .3)
lines(m.mean$DATE,m.mean$x,type="b",pch=16)
legend("topleft",c("Hourly","Daily mean","monthly mean"),inset=0.02,pch=c(1,1,16),col=c("grey","red","black"))


d.mean<-aggregate(st$WIND.SPD,diaria,mean,na.rm=T)
d.mean$DATE<-as.Date(d.mean$DATE)

m.mean<-aggregate(st$WIND.SPD,mensal,mean,na.rm=T)
m.mean$DATE<-as.Date(paste(m.mean$DATE,"-15",sep="")) #dia 15 de cada mês

plot(st$DATE,st$WIND.SPD,main="wind readings",ylab="m/s",xlab="month",col="gray")
points(d.mean$DATE,d.mean$x,col="brown",cex = .3)
lines(m.mean$DATE,m.mean$x,type="b",pch=16)
legend("topleft",c("Hourly","Daily mean","monthly mean"),inset=0.02,pch=c(1,1,16),col=c("grey","red","black"))
