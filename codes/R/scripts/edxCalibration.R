#rm(list=ls())
source("myfunctions/load.R")

#### Calibração Maio de 2010
# Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/K2010MaioAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'maio2010K') 
# Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2010MaioMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/L2010MaioAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'maio2010L') 

#### Calibração Nov de 2010
# Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2010NovMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/K2010NovAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'nov2010K') 
# Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2010NovMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/L2010NovAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'nov2010L') 

#### Calibração Abr de 2011
# Linha K
medidos = read.csv('../../inputs/edxCalibration/americo/K2011AbrMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/K2011AbrAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'abr2011K') 
# Linha L
medidos = read.csv('../../inputs/edxCalibration/americo/L2011AbrMedidosAkerr.csv')
ajustados = read.csv('../../inputs/edxCalibration/americo/L2011AbrAjustadosAkerr.csv')
edxCalibrationTable(medidos,ajustados,'maio2011L') 

