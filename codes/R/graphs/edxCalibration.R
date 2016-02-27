rm(list=ls())
source("myfunctions/load.R")

#### Calibração Maio de 2010 ####

# Linha K
coefs1 = c(0.17052600,-0.02805800,0.00093775,0.00001916)
coefs2 = c(-5.89488000,0.56112200,-0.01621390,0.00015109)
file_medidos = '../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('2010MaiAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.90276721,0.10112016,-0.0043561,0.0000889436792,-0.000000842128969,0.000000003)
file_medidos = '../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv'

# Ajuste
medido = read.csv(file_medidos)
model <- lm(medido$R ~ poly(medido$Z,5,raw=TRUE))
plot(medido$Z,medido$R)

coefs1 = model$coefficients
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2010MaiAkerr','L',file_medidos,cores,legenda,coefs1)

#### Calibração Novembro de 2010 ####

# Linha K
coefs1 = c(0.15167500,-0.02464890,0.00077391,0.00001999)
coefs2 = c(-5.97961000,0.56777700,-0.01642280,0.00015341)
file_medidos = '../../inputs/edxCalibration/americo/K2010NovMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('2010NovAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.852155,0.095432,-0.0041149,0.0000841603,-0.00000079806,0.0000000028404)
file_medidos = '../../inputs/edxCalibration/americo/L2010NovMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2010NovAkerr','L',file_medidos,cores,legenda,coefs1)

#### Calibração Abril de 2011 ####

# Linha K
coefs1 = c(0.15987616,-0.026726302,0.00095542146,0.000014469997)
coefs2 = c(-4.3221494, 0.4083262,-0.011499903, 0.00010389019)
file_medidos = '../../inputs/edxCalibration/americo/K2011AbrMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('2011AbrAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.71619926,0.07987028,-0.003424948,0.00006946821,-0.00000064936,0.0000000022665)
file_medidos = '../../inputs/edxCalibration/americo/L2011AbrMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2011AbrAkerr','L',file_medidos,cores,legenda,coefs1)
