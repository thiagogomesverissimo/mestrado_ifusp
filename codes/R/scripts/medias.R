rm(list=ls())
source("myfunctions/load.R")

#### médias de MP2.5 para comparação com outras cidades
tabela = cbind(c('área residencial','avenida','ambas'))
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

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('$ \\multicolumn{2}{c}{n} & \\multicolumn{2}{c}{Média Aritimética} & \\multicolumn{2}{c}{Média Geométrica} \\\\\n',
                      '& sem Harmatão & com Harmatão & sem Harmatão & com Harmatão & sem Harmatão & com Harmatão \\\\\n
                       & \\multicolumn{7}{c}{$\\mu g m^-3$} ')


print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
        type="latex", 
        floating = FALSE,
        include.rownames = F,
        add.to.row = addtorow,
        include.colnames = F,
        size="small",
        sanitize.text.function = identity,
        file='../../outputs/medias_fino.tex')

#### médias de MP10 para comparação com outras cidades
tabela = cbind(c('área residencial','avenida','ambas'))
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
  mean(RIsH2007$mass),
  mean(TIsH2007$mass),
  mean(Inalavel_sH2007$mass)))

tabela = cbind(tabela,c(
  mean(RIcH2007$mass),
  mean(TIcH2007$mass),
  mean(Inalavel_cH2007$mass)))

tabela = cbind(tabela,c(
  exp(mean(log(RIsH2007$mass))),
  exp(mean(log(TIsH2007$mass))),
  exp(mean(log(Inalavel_sH2007$mass)))))

tabela = cbind(tabela,c(
  exp(mean(log(RIcH2007$mass))),
  exp(mean(log(TIcH2007$mass))),
  exp(mean(log(Inalavel_cH2007$mass)))))

tabela = rbind(tabela,c('N',nrow(RIsH2007),nrow(RIcH2007),nrow(RIsH2007),nrow(RIcH2007)))

addtorow <- list()
addtorow$pos <- list(0, 0)
addtorow$command <- c('& \\multicolumn{2}{c}{Média Aritimética} & \\multicolumn{2}{c}{Média Geométrica} \\\\\n',
                      '& sem Harmatão & com Harmatão & sem Harmatão & com Harmatão \\\\\n
                       & \\multicolumn{2}{c}{$\\mu g m^-3$} ')


print(xtable(tabela,align = rep('c',ncol(tabela)+1)),
      type="latex", 
      floating = IALSE,
      include.rownames = I,
      add.to.row = addtorow,
      include.colnames = I,
      size="small",
      sanitize.text.function = identity,
      file='../../outputs/medias_fino.tex')
