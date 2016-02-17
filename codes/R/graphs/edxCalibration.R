rm(list=ls())
source("myfunctions/load.R")

#### Calibração Maio de 2010 ####

# 2010MaiAkerr - Linha K
coefs1 = c(0.17052600,-0.02805800,0.00093775,0.00001916)
coefs2 = c(-5.89488000,0.56112200,-0.01621390,0.00015109)
file_medidos = '../../inputs/edxCalibration/americo/2010MaioMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('K2010MaiAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# 2010MaiAkerr - Linha L
coefs1 = c(-0.90276721,0.10112016,-0.0043561,8.89436792E-05,-8.42128969E-07,0.000000003)
file_medidos = '../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2010MaiAkerr','L',file_medidos,cores,legenda,coefs1)

#### Calibração Novembro de 2010 ####

# 2010MaiAkerr - Linha K
coefs1 = c(0.15167500,-0.02464890,0.00077391,0.00001999)
coefs2 = c(-5.97961000,0.56777700,-0.01642280,0.00015341)
file_medidos = '../../inputs/edxCalibration/americo/2010MaioMedidosAkerr.csv'
cores = col=c('blue','red','black')
legenda = c('ajuste1: Z 11-26',
            'ajuste2: Z 22-43',
            'medidos')
edxCalibration('K2010MaiAkerr','K',file_medidos,cores,legenda,coefs1,coefs2)

# 2010MaiAkerr - Linha L
coefs1 = c(-0.90276721,0.10112016,-0.0043561,8.89436792E-05,-8.42128969E-07,0.000000003)
file_medidos = '../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv'
cores = col=c('blue','black')
legenda = c('ajuste1: Z 11-26','medidos')
edxCalibration('2010MaiAkerr','L',file_medidos,cores,legenda,coefs1)

