rm(list=ls())
source("myfunctions/load.R")

 
branco 
poluida = read.csv('../../inputs/edxAnalysis/ACC745poluida.csv')
poluida
library(ChemometricsWithR)
matplot(poluida[50:2040,1],lwd = 1)


