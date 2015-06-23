rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

pmConc<-read.csv("../../outputs/pmConc.csv")

amostras_por_local<-data.frame(
  c(nrow(subset(pmConc,pmConc$SiteName=="NMA" & pmConc$SampleType=="PM2.5")),
    nrow(subset(pmConc,pmConc$SiteName=="NMT" & pmConc$SampleType=="PM2.5")),
    nrow(subset(pmConc,pmConc$SampleType=="PM2.5"))),
  c(nrow(subset(pmConc,pmConc$SiteName=="NMA" & pmConc$SampleType=="PM10")),
    nrow(subset(pmConc,pmConc$SiteName=="NMT" & pmConc$SampleType=="PM10")),
    nrow(subset(pmConc,pmConc$SampleType=="PM10"))),
  c(nrow(subset(pmConc,pmConc$SiteName=="NMA")),
    nrow(subset(pmConc,pmConc$SiteName=="NMT")),
    nrow(pmConc))
)
residencial<-'Área residencial, com ruas não pavimentadas' #NMA
trafego<-'Tráfego intenso, avenida pavimentada e região urbana' #NMT

colnames(amostras_por_local)<-c("$PM_{2.5}$","$PM_{10}$","Total")
rownames(amostras_por_local)<-c(residencial,trafego,'Total')

print(xtable(amostras_por_local),
      type="latex", 
      floating = FALSE,
      include.rownames = T, 
      sanitize.text.function = identity,
      file="../../outputs/amostras_por_local.tex")
