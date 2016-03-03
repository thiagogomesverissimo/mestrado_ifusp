rm(list=ls())
source("myfunctions/load.R")

# Dados de PIB percapita: http://data.worldbank.org/indicator/NY.GDP.PCAP.CD
# Banco mundial 

PIB = read.csv('../../inputs/BancoMundial/PIBeditado.csv')

pdf('../../outputs/PIBGhanaBrazil.pdf')
mar.default <- c(5,4,4,2) 
par(mar = mar.default + c(0, 1, 0, 0))
plot(PIB[,1],PIB$Brazil,type='n',
     xlab = 'Ano',
     ylab = '$ USD')
lines(PIB[,1],PIB$Brazil,col='red')
lines(PIB[,1],PIB$Ghana,col='blue')

legend("topleft", legend = c('Brasil','Gana'), col=c('red','blue'),pch = 15, cex=0.8, bty = "n")
dev.off()
