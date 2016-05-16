rm(list=ls())
source("myfunctions/load.R")

#### médias de MP2.5 para comparação com outras cidades
tabela = cbind(c('residencial','avenida','ambas'))
RFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
TFsH = read.csv('../../outputs/pmf_fa/TFsH.csv')
RFcH = read.csv('../../outputs/pmf_fa/RFcH.csv')
TFcH = read.csv('../../outputs/pmf_fa/TFcH.csv')
Fino_sH = merge(RFsH,TFsH,all=T)
Fino_cH = merge(RFcH,TFcH,all=T)

RFsH2007 = RFsH[grepl('2007',RFsH$Date),]
TFsH2007 = TFsH[grepl('2007',TFsH$Date),]
RFcH2007 = RFcH[grepl('2007',RFcH$Date),]
TFcH2007 = TFcH[grepl('2007',TFcH$Date),]
Fino_sH2007 = Fino_sH[grepl('2007',Fino_sH$Date),]
Fino_cH2007 = Fino_cH[grepl('2007',Fino_cH$Date),]

tabela = cbind(tabela,c(
  nrow(RFsH2007),
  nrow(TFsH2007),
  nrow(Fino_sH2007)))

tabela = cbind(tabela,c(
  mean(RFsH2007$mass),
  mean(TFsH2007$mass),
  mean(Fino_sH2007$mass)))

tabela = cbind(tabela,c(
  exp(mean(log(RFsH2007$mass))),
  exp(mean(log(TFsH2007$mass))),
  exp(mean(log(Fino_sH2007$mass)))))

tabela = cbind(tabela,c(
  sd(RFsH2007$mass),
  sd(TFsH2007$mass),
  sd(Fino_sH2007$mass)))

tabela = cbind(tabela,c(
  sd(RFsH2007$mass)/sqrt(nrow(RFsH)),
  sd(TFsH2007$mass)/sqrt(nrow(TFsH)),
  sd(Fino_sH2007$mass)/sqrt(nrow(Fino_sH))))

tabela = cbind(tabela,c(
  nrow(RFcH2007),
  nrow(TFcH2007),
  nrow(Fino_cH2007)))

tabela = cbind(tabela,c(
  mean(RFcH2007$mass),
  mean(TFcH2007$mass),
  mean(Fino_cH2007$mass)))

tabela = cbind(tabela,c(
  exp(mean(log(RFcH2007$mass))),
  exp(mean(log(TFcH2007$mass))),
  exp(mean(log(Fino_cH2007$mass)))))

tabela = cbind(tabela,c(
  sd(RFcH2007$mass),
  sd(TFcH2007$mass),
  sd(Fino_cH2007$mass)))

tabela = cbind(tabela,c(
  sd(RFcH2007$mass)/sqrt(nrow(RFcH)),
  sd(TFcH2007$mass)/sqrt(nrow(TFcH)),
  sd(Fino_cH2007$mass)/sqrt(nrow(Fino_cH))))

tabela = as.data.frame(tabela)
colunas = c(3,4,5,6,8,9,10,11)
tabela[,colunas] = apply(tabela[,colunas],2,corrige_coluna)


tabela[,c(3)]
addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('&  \\multicolumn{5}{c|}{com Harmatão} & \\multicolumn{5}{c}{sem Harmatão} \\\\\n',
                      '& n & $\\overline{x}$ & $\\sqrt{x_1x_2...x_3}^n$ & $\\sigma$ & $\\overline{\\sigma} $
                       & n & $\\overline{x}$ & $\\sqrt{x_1x_2...x_3}^n$ & $\\sigma$ & $\\overline{\\sigma} $ \\\\
                       \\hline & \\multicolumn{10}{c}{$\\mu g \\cdot m^{-3}$} \\\\ ')

print(xtable(tabela,align = c("c","c","c","c","c","c","c|","c","c","c","c","c")),
        type="latex", 
        floating = FALSE,
        include.rownames = F,
        add.to.row = addtorow,
        include.colnames = F,
        sanitize.text.function = identity,
        file='../../outputs/medias_fino.tex')

#### médias de MP10 para comparação com outras cidades
tabela = cbind(c('residencial','avenida','ambas'))
RIsH = read.csv('../../outputs/pmf_fa/RIsH.csv')
TIsH = read.csv('../../outputs/pmf_fa/TIsH.csv')
RIcH = read.csv('../../outputs/pmf_fa/RIcH.csv')
TIcH = read.csv('../../outputs/pmf_fa/TIcH.csv')
Inalavel_sH = merge(RIsH,TIsH,all=T)
Inalavel_cH = merge(RIcH,TIcH,all=T)

RIsH2007 = RIsH[grepl('2007',RIsH$Date),]
TIsH2007 = TIsH[grepl('2007',TIsH$Date),]
RIcH2007 = RIcH[grepl('2007',RIcH$Date),]
TIcH2007 = TIcH[grepl('2007',TIcH$Date),]
Inalavel_sH2007 = Inalavel_sH[grepl('2007',Inalavel_sH$Date),]
Inalavel_cH2007 = Inalavel_cH[grepl('2007',Inalavel_cH$Date),]

tabela = cbind(tabela,c(
  nrow(RIsH2007),
  nrow(TIsH2007),
  nrow(Inalavel_sH2007)))

tabela = cbind(tabela,c(
  mean(RIsH2007$mass),
  mean(TIsH2007$mass),
  mean(Inalavel_sH2007$mass)))

tabela = cbind(tabela,c(
  exp(mean(log(RIsH2007$mass))),
  exp(mean(log(TIsH2007$mass))),
  exp(mean(log(Inalavel_sH2007$mass)))))

tabela = cbind(tabela,c(
  sd(RIsH2007$mass),
  sd(TIsH2007$mass),
  sd(Inalavel_sH2007$mass)))

tabela = cbind(tabela,c(
  sd(RIsH2007$mass)/sqrt(nrow(RIsH)),
  sd(TIsH2007$mass)/sqrt(nrow(TIsH)),
  sd(Inalavel_sH2007$mass)/sqrt(nrow(Inalavel_sH))))

tabela = cbind(tabela,c(
  nrow(RIcH2007),
  nrow(TIcH2007),
  nrow(Inalavel_cH2007)))

tabela = cbind(tabela,c(
  mean(RIcH2007$mass),
  mean(TIcH2007$mass),
  mean(Inalavel_cH2007$mass)))

tabela = cbind(tabela,c(
  exp(mean(log(RIcH2007$mass))),
  exp(mean(log(TIcH2007$mass))),
  exp(mean(log(Inalavel_cH2007$mass)))))

tabela = cbind(tabela,c(
  sd(RIcH2007$mass),
  sd(TIcH2007$mass),
  sd(Inalavel_cH2007$mass)))

tabela = cbind(tabela,c(
  sd(RIcH2007$mass)/sqrt(nrow(RIcH)),
  sd(TIcH2007$mass)/sqrt(nrow(TIcH)),
  sd(Inalavel_cH2007$mass)/sqrt(nrow(Inalavel_cH))))

tabela = as.data.frame(tabela)
colunas = c(3,4,5,6,8,9,10,11)
tabela[,colunas] = apply(tabela[,colunas],2,corrige_coluna)


tabela[,c(3)]
addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('&  \\multicolumn{5}{c|}{com Harmatão} & \\multicolumn{5}{c}{sem Harmatão} \\\\\n',
                      '& n & $\\overline{x}$ & $\\sqrt{x_1x_2...x_3}^n$ & $\\sigma$ & $\\overline{\\sigma} $
                       & n & $\\overline{x}$ & $\\sqrt{x_1x_2...x_3}^n$ & $\\sigma$ & $\\overline{\\sigma} $ \\\\
                       \\hline & \\multicolumn{10}{c}{$\\mu g \\cdot m^{-3}$} \\\\ ')

print(xtable(tabela,align = c("c","c","c","c","c","c","c|","c","c","c","c","c")),
      type="latex", 
      floating = FALSE,
      include.rownames = F,
      add.to.row = addtorow,
      include.colnames = F,
      sanitize.text.function = identity,
      file='../../outputs/medias_Inalavel.tex')
