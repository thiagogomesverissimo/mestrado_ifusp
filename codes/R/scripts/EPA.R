#rm(list=ls())
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

# Incluir: Al, Si

## P
x = epa$P
y = iag$P
reg <- lm(y ~ x)
coefficients(reg)
par(cex=.8)

pdf('../../outputs/EPA_P.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 2, 0, 0))
plot(x,y,
     main = 'Fósforo (P)',
     xlim = c(0,2000),
     ylim = c(0,2000),
     pch=20,
     xlab = expression(frac(n*g,cm^2)),
     ylab = expression(frac(n*g,cm^2)))
abline(0, 1)
dev.off()

## Fe
x = epa$Fe
y = iag$Fe
reg <- lm(y ~ x)
coefficients(reg)
par(cex=.8)

pdf('../../outputs/EPA_Fe.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 2, 0, 0))
plot(x,y,
     main = 'Ferro (F)',
     xlim = c(0,35000),
     ylim = c(0,35000),
     pch=20,
     xlab = expression(frac(n*g,cm^2)),
     ylab = expression(frac(n*g,cm^2)))
abline(0, 1)
dev.off()

## Si
x = epa$Si
y = iag$Si
reg <- lm(y ~ x)
coefficients(reg)
par(cex=.8)

pdf('../../outputs/EPA_Si.pdf')
mar.default <- c(5,4,4,2) + 0.5
par(mar = mar.default + c(0, 2, 0, 0))
plot(x,y,
     main = 'Fósforo (P)',
     xlim = c(0,70000),
     ylim = c(0,70000),
     pch=20,
     xlab = expression(frac(n*g,cm^2)),
     ylab = expression(frac(n*g,cm^2)))
abline(0, 1)
dev.off()