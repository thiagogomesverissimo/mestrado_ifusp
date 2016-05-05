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

# plots
plot_epa(epa$Al,iag$Al,'Al')
plot_epa(epa$Si,iag$Si,'Si')
plot_epa(epa$P,iag$P,'P') #
plot_epa(epa$S,iag$S,'S')
plot_epa(epa$Cl,iag$Cl,'Cl')
plot_epa(epa$K,iag$K,'K')
plot_epa(epa$Ca,iag$Ca,'Ca')
plot_epa(epa$Ti,iag$Ti,'Ti')
plot_epa(epa$V,iag$V,'V')
plot_epa(epa$Mn,iag$Mn,'Mn')
plot_epa(epa$Fe,iag$Fe,'Fe')
plot_epa(epa$Zn,iag$Zn,'Zn')
plot_epa(epa$Br,iag$Br,'Br')
plot_epa(epa$Pb,iag$Pb,'Pb')

# Não sei se vou usar
plot_epa(epa$Cr,iag$Cr,'Cr')
plot_epa(epa$Ni,iag$Ni,'Ni')
plot_epa(epa$Cu,iag$Cu,'Cu')
plot_epa(epa$Rb,iag$Rb,'Rb')
plot_epa(epa$Sr,iag$Sr,'Sr')
plot_epa(epa$Zr,iag$Zr,'Zr')