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
edxCalibration('K2010MaiAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.90276721,0.10112016,-0.0043561,8.89436792E-05,-8.42128969E-07,0.000000003)
file_medidos = '../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv'
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
edxCalibration('K2010NovAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.852155,0.095432,-0.0041149,8.41603E-05,-7.9806E-07,2.8404E-09)
file_medidos = '../../inputs/edxCalibration/americo/L2010NovMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2010NovAkerr','L',file_medidos,cores,legenda,coefs1)

#### Calibração Abril de 2011 ####

# Linha K
coefs1 = c(0.15987616,-0.026726302,9.55E-04,1.45E-05)
coefs2 = c(-4.3221494, 0.4083262,-0.011499903, 1.04E-04)
file_medidos = '../../inputs/edxCalibration/americo/K2011AbrMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('K2011AbrAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# Linha L
coefs1 = c(-0.71619926,0.07987028,-0.003424948,6.95E-05,-6.49E-07,2.27E-09)
file_medidos = '../../inputs/edxCalibration/americo/L2011AbrMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2011AbrAkerr','L',file_medidos,cores,legenda,coefs1)
