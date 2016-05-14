rm(list=ls())
source("myfunctions/load.R")

#################################################################
#A corrente e tempo para ACC386(Branco) e ACC957(carregado) são iguais
I = 1000
tempo = 960
    
#Dados para concentração média
area = 7.32
volume = 13.9

#Análise linha K
#ACC957 é o mais carregado de Nima
ACC957K<-read.csv("../../inputs/detectionLimit/ACC957K_CARREGADO.csv")
ACC957Kout<-DetectionLimit(ACC957K,"K",I,tempo,area,volume)

pdf(file='../../outputs/limitDetectionK.pdf')

mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))
y_legenda = expression(n~g~m^-3)

plot(ACC957Kout$Z,
     ACC957Kout$limite*1000,
     log="y",
     col=c("red"),
     pch=1,
    # main="Limite de Deteção K - Amostras Nima",
     xlab="Z - Número Atômico",
     ylab=y_legenda)

#ACC386 é branco
ACC386K<-read.csv("../../inputs/detectionLimit/ACC386K_BR.csv")
ACC386Kout<-DetectionLimit(ACC386K,"K",I,tempo,area,volume)

points(ACC386Kout$Z,ACC386Kout$limite*1000,col=c("blue"),pch=1)

legend("topright",
       legend=c("Amostra carregada","Amostra branca"),
       col=c("red","blue"),
       pch=1)
dev.off()

#Linha L
#ACC957 é o mais carregado de Nima
ACC957L<-read.csv("../../inputs/detectionLimit/ACC957L_CARREGADO.csv")
ACC957Lout<-DetectionLimit(ACC957L,"L",I,tempo,area,volume)

pdf(file='../../outputs/limitDetectionL.pdf')

mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))
y_legenda = expression(n~g~m^-3)

plot(ACC957Lout$Z,
     ACC957Lout$limite*1000,
     log="y",
     col=c("red"),
     pch=1,
    # main="Limite de Deteção L - Amostras Nima",
     xlab="Z - Número Atômico",
     ylab=y_legenda
)

#ACC386 é branco
ACC386L<-read.csv("../../inputs/detectionLimit/ACC386L_BR.csv")
ACC386Lout<-DetectionLimit(ACC386L,"L",I,tempo,area,volume)

points(ACC386Lout$Z,ACC386Lout$limite*1000,col=c("blue"),pch=1)

legend("topright",
       legend=c("Amostra carregada","Amostra branca"),
       col=c("red","blue"),
       pch=1)
dev.off()

# Escrevendo saídas em csv
write.csv(ACC386Kout,"../../outputs/detectionLimitACC386K.csv",row.names=TRUE)
write.csv(ACC386Lout,"../../outputs/detectionLimitACC386L.csv",row.names=TRUE)
write.csv(ACC957Kout,"../../outputs/detectionLimitACC957K.csv",row.names=TRUE)
write.csv(ACC957Lout,"../../outputs/detectionLimitACC957L.csv",row.names=TRUE)

# tabela periódica
pt = read.csv('../../inputs/constants/periodic_table.csv')

# exporta latex ACC386(Branco)  ACC957(carregado)
branco = rbind(ACC386Kout,ACC386Lout[ACC386Lout$Z>42,])
row.names(branco) = as.character(pt[match(branco$Z, pt$Z),2])
branco$limite = sprintf("%.2f",branco$limite*1000)
branco$limite = str_replace_all(branco$limite,'\\.',',')

carregado = rbind(ACC957Kout,ACC957Lout[ACC957Lout$Z>42,])
row.names(carregado) = as.character(pt[match(carregado$Z, pt$Z),2])
carregado$limite = sprintf("%.2f",carregado$limite*1000)
carregado$limite = str_replace_all(carregado$limite,'\\.',',')

tabela = cbind(row.names(carregado),branco$limite,carregado$limite)
# DR: diferença relativa
addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('Elemento & Amostra branca & Amostra carregada \\\\\n',
                      ' & \\multicolumn{2}{c}{$n g / m^3$}        \\\\\n')

print(xtable(tabela, align = rep('c',4)),
        type="latex", 
        floating = FALSE,
        include.rownames = F,
        add.to.row = addtorow,
        include.colnames = F,
 #       size="small",
        sanitize.text.function = identity,
        file='../../outputs/LD.tex')
