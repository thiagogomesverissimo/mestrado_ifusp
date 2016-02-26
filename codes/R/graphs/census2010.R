rm(list=ls())
source("myfunctions/load.R")

people = read.csv('../../inputs/ghana/age_polulation.csv')
pdf('../../outputs/ghanaidade.pdf')
barplot(people[,2],
        names.arg=people[,1],
        horiz=T,
        col='#ebda8b',
        cex.names=0.8,
        las=2,
        xlab = '% da população total')
dev.off()

