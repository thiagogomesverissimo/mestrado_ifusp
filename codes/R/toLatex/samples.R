rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

samples<-read.csv("../../outputs/samples.csv",check.names=F)

#Para não colocar \begin{table}...\end{table} usar floating = FALSE no print:
print(xtable(samples),
      type="latex", 
      floating = FALSE,
      include.rownames = F, 
      sanitize.text.function = identity,
      file="../../outputs/samples.tex")

