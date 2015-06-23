rm(list=ls())
setwd("~/repos/mymaster_physics/codes/R")
source("myfunctions/load.R")

#O PMF grava todas soluções para todos o Q. Mas a do menor Q é a primeira do arquivos. 
#Ler o arquivo de entrada do PMF para descobrirmos o número de linha.
JFcH<-read.csv("../../outputs/pmf/JFcH.csv")
linhas<-nrow(JFcH)

contributions<-read.csv("../../inputs/pmf/JFcH/JFcH_contributions.csv",skip=3,nrow=linhas)
profiles<-read.csv("../../inputs/pmf/JFcH/JFcH_profiles.csv",skip=3)
residuals<-read.csv("../../inputs/pmf/JFcH/JFcH_residuals.csv",skip=3)
