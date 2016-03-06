rm(list=ls())

source("myfunctions/load.R")
getwd()

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
y_legenda = expression(frac(ng,m^3))

plot(ACC957Kout$Z,
     ACC957Kout$limite,
     log="y",
     col=c("red"),
     pch=20,
    # main="Limite de Deteção K - Amostras Nima",
     xlab="Z - Número Atômico",
     ylab=y_legenda)

#ACC386 é branco
ACC386K<-read.csv("../../inputs/detectionLimit/ACC386K_BR.csv")
ACC386Kout<-DetectionLimit(ACC386K,"K",I,tempo,area,volume)

points(ACC386Kout$Z,ACC386Kout$limite,col=c("blue"),pch=20)

legend("topright",
       legend=c("Amostra carregada","Amostra branca"),
       col=c("red","blue"),
       pch=20)
dev.off()

#Linha L
#ACC957 é o mais carregado de Nima
ACC957L<-read.csv("../../inputs/detectionLimit/ACC957L_CARREGADO.csv")
ACC957Lout<-DetectionLimit(ACC957L,"L",I,tempo,area,volume)

pdf(file='../../outputs/limitDetectionL.pdf')

mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 3, 0, 0))
y_legenda = expression(frac(ng,m^3))

plot(ACC957Lout$Z,
     ACC957Lout$limite,
     log="y",
     col=c("red"),
     pch=20,
    # main="Limite de Deteção L - Amostras Nima",
     xlab="Z - Número Atômico",
     ylab=y_legenda
)

#ACC386 é branco
ACC386L<-read.csv("../../inputs/detectionLimit/ACC386L_BR.csv")
ACC386Lout<-DetectionLimit(ACC386L,"L",I,tempo,area,volume)

points(ACC386Lout$Z,ACC386Lout$limite,col=c("blue"),pch=20)

legend("topright",
       legend=c("Amostra carregada","Amostra branca"),
       col=c("red","blue"),
       pch=20)
dev.off()

#Escrevendo saídas - TODO
write.csv(ACC386Kout,"../../outputs/detectionLimitACC386K.csv",row.names=TRUE)
write.csv(ACC386Lout,"../../outputs/detectionLimitACC386L.csv",row.names=TRUE)
write.csv(ACC957Kout,"../../outputs/detectionLimitACC957K.csv",row.names=TRUE)
write.csv(ACC957Lout,"../../outputs/detectionLimitACC957L.csv",row.names=TRUE)

