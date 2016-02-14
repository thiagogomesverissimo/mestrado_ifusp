rm(list=ls())
source("myfunctions/load.R")

# análise da EPA
epa = read.csv('../../inputs/infoNima/SummaryOfEPA_ng.csv',dec=',')
epa<-TrataID(epa,1)

# Corrige nomes das colunas
epa = epa[,c(1,grep('CONC', names(epa)))]
names(epa) = sub('.CONC','',names(epa))

# rownames
rownames(epa) = epa[,1]

#### iag 
pm = read.csv('../../outputs/pm.csv')
pm<-TrataID(pm,1)

# Troca zeros ou muito pequenos por NA
pm[pm<0.0000001] <- NA
epa[epa<0.0000001] <- NA

# Separa tabela de concentrações e erros
pmConc = pm[,c(1,seq(2,length(pm),2))]

# Renomeia as colunas com nomes dos elementos químicos
names(pmConc)[-1] <- subElement(names(pmConc)[-1])
names(pmConc)[names(pmConc)=='MassConc'] <- 'MASS'
iag = pmConc

# duplicada
iag = subset(iag, iag$SampleID!='AFR665')

# amostras 
rownames(iag) = iag$SampleID
amostras = rownames(epa)
iag = iag[amostras,]

# "Na","Mg","Al","Si","P","S","Cl","K","Ca","Ti","V","Cr","Mn","Fe","Ni","Cu","Zn","Br","Rb","Sr","Zr","Pb","Rh","Ba","Ce","Se","Y","Co","Nb","Lu","Th","Ga","Hf"

# Al
reg1 <- lm(epa$Al ~ iag$Al)
coefficients(reg1)
par(cex=.8)
plot(iag$Al,epa$Al)
abline(reg1)
abline(0, 1)

# Br
reg1 <- lm(epa$Br ~ iag$Br)
coefficients(reg1)
par(cex=.8)
plot(iag$Br,epa$Br)
abline(reg1)
abline(0, 1)

# Ca
reg1 <- lm(epa$Ca ~ iag$Ca)
coefficients(reg1)
par(cex=.8)
plot(iag$Ca,epa$Ca)
abline(reg1)
abline(0, 1)

# Fe
reg1 <- lm(epa$Fe ~ iag$Fe)
coefficients(reg1)
par(cex=.8)
plot(iag$Fe,epa$Fe)
abline(reg1)
abline(0, 1)

# Cl
reg1 <- lm(epa$Cl ~ iag$Cl)
coefficients(reg1)
par(cex=.8)
plot(iag$Cl,epa$Cl)
abline(reg1)
abline(0, 1)

# Pb
reg1 <- lm(epa$Pb ~ iag$Pb)
coefficients(reg1)
par(cex=.8)
plot(iag$Pb,epa$Pb)
abline(reg1)
abline(0, 1)

# V
reg1 <- lm(epa$V ~ iag$V)
coefficients(reg1)
par(cex=.8)
plot(iag$V,epa$V)
abline(reg1)
abline(0, 1)
