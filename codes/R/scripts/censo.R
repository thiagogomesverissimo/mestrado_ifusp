#rm(list=ls())
source("myfunctions/load.R")

#### 2010
# Pirâmide Etária
people = read.csv('../../inputs/ghana/census2010-idade.csv')
pdf('../../outputs/piramide_etaria.pdf')
barplot(people[,2],
        names.arg=people[,1],
        horiz=T,
        col='#ebda8b',
        cex.names=0.8,
        las=2,
        xlim = c(0,14),
        xlab = '% da população total')
dev.off()

# Fontes de energia para cozimento
fuel = read.csv('../../inputs/ghana/census_cookfuel.csv')
fuel[,1] = c('não cozinha','biomassa','gás','eletricidade','querosene','carvão','resíduo de plantação',
  'pó de serra','esterco', 'outro')
print(xtable(fuel), 
      type="latex", 
      include.rownames = F, 
      floating = FALSE,
      sanitize.text.function = identity,
      file='../../outputs/census_cookfuel.tex')

# Eletrecidade
#eletro = read.csv('../../inputs/ghana/census2010_eletricidade.csv')
#print(xtable(eletro), 
#      type="latex", 
#      include.rownames = T, 
#      floating = FALSE,
#      sanitize.text.function = identity,
#      file='../../outputs/census2010_eletrecidade.tex')

