rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

conc<-read.csv("../../outputs/pmf/RFsH.csv")

### Leitura do arquivo diagnostics.csv ###

# Estatística descritiva
Statistics = data.frame()

# Base run summary table
Q = data.frame()
 
# Sum of the squares of the differences in scaled residuals for each base run pair by species
d = data.frame()
 
# Sum of d across all species for each base run pair
D = data.frame()

diagnostics=readLines("../../inputs/pmf/RFsH_diagnostics.csv")

linhas_branco = which(diagnostics=="")

inicio = which(diagnostics=='**** Input Data Statistics ****')
fim = subset(linhas_branco,linhas_branco>inicio)[2]
fim = fim -1
inicio = inicio + 2
a=diagnostics[inicio:fim]
a[1]
apply(a,2,strsplit,split=",")

#   if(linha=='**** Input Data Statistics ****'){
#     print(linha)
#   }
#   else if(linha=='Base run summary table:'){
#     print(linha)
#   }
#   else if(linha=='Sum of the squares of the differences in scaled residuals for each base run pair by species (d)'){
#     print(linha)
#   }
#   else if(linha=='Sum of d across all species for each base run pair (D)'){
#     print(linha)
#   }
# }


#Scaled residuals beyond 3 standard deviations (dates by species):

#O PMF grava todas soluções para todos o Q. Mas a do menor Q é a primeira do arquivos. 
#Ler o arquivo de entrada do PMF para descobrirmos o número de linha.
contributions<-read.csv("../../inputs/pmf/RFsH_contributions.csv",skip=3,nrow=linhas)
profiles<-read.csv("../../inputs/pmf/RFsH_profiles.csv",skip=3)

residuals<-read.csv("../../inputs/pmf/RFsH_residuals.csv",skip=3) # resíduo normal e resíduo escalado.

# d: cálculo intra-residual compara os resíduos entre as rodadas.

# D: soma dos d. Procurar variações para D em cada elemento, pois se houver as duas soluções
# em questão são de fato diferentes e não uma rotação um da outra. 




