rm(list=ls())
setwd("~/remota/repos/mestrado_ifusp/codes/R")
source("myfunctions/load.R")

#table of periodic table informations
periodicTable<-read.csv("../../inputs/constants/periodic_table.csv",header=TRUE)

#Informations about Nima samples provided by Kathie by email
infoNima<-read.csv("../../inputs/infoNima/infoNima.csv",header=TRUE)

#Informations about blanks samples (provided by Kathie by email)
infoBlank<-read.csv("../../inputs/infoNima/infoBlank.csv",header=TRUE)

#Extra information (not only about Nima) (provided by Zheng at 2013-october-29) 
SampleInfo<-read.csv("../../inputs/infoNima/SampleInfo29oct2013.csv",header=TRUE)

#Load concentrations EDfrom XRF analysis at IAG/USP
acc<-read.csv("../../inputs/edxAnalysis/acc.csv")
afr<-read.csv("../../inputs/edxAnalysis/afr.csv")
gpe<-read.csv("../../inputs/edxAnalysis/gpe.csv")
gha<-read.csv("../../inputs/edxAnalysis/gha.csv")

#Load Black Carbon 
BlackCarbon<-read.csv("../../outputs/BlackCarbon.csv")

#TODO: qual a timezone usada na medida de Ghana?
#TODO: fazer análise sazonal: dividir filtros por estações do ano?

#Converting date columns
infoNima$StartTime<-as.POSIXct(strptime(infoNima$StartTime,format="%m/%d/%y %H:%M",tz="GMT"))
infoNima$EndTime<-as.POSIXct(strptime(infoNima$EndTime,format="%m/%d/%y %H:%M",tz="GMT"))

#TODO: usar apply para criar coluna da data média
#Create a column with mean date: Date
time<-c()
for(row in 1:nrow(infoNima))
{
  media_da_linha = mean(c(infoNima[row,]$StartTime,infoNima[row,]$EndTime))
  time<-append(time,as.POSIXct(media_da_linha))
}
infoNima<-cbind(infoNima,Date=time)

# Adicionar uma coluna do erro da massa, vamos supor de 5%
infoNima<-cbind(infoNima,MassError=infoNima$MassConc*0.05)

#Agregando todas tabelas de concentração (data.frames)
pm<-acc 
pm<-merge(pm,afr,all=TRUE)
pm<-merge(pm,gpe,all=TRUE)
pm<-merge(pm,gha,all=TRUE)

#Remover danificas (e criar data.frame for latex)
danificadas<-nrow(subset(infoNima,infoNima$QCFlag==1)) #QCflag=1 problemas sérios.
danificadas<- danificadas + nrow(subset(infoNima,is.na(infoNima$MassConc))) #4 problemáticas
samples<-data.frame(matrix(NA,nrow=1,ncol=4))
colnames(samples)<-c('Coletadas no projeto',
                     'Somente de Nima',
                     'Danificadas',
                     'Válidas')
samples[1,1] <- nrow(pm)
samples[1,2] <- nrow(infoNima)
samples[1,3] <- danificadas
infoNima <- subset(infoNima,infoNima$QCFlag==0) #Remover danificadas
infoNima <- subset(infoNima,!is.na(infoNima$MassConc)) #Remover danificadas
samples[1,4]<-nrow(infoNima)
write.csv(samples,file="../../outputs/samples.csv",row.names=F)

#Uniformizando os identificadores das amostras (IDs)
pm<-TrataID(pm,1)
infoNima<-TrataID(infoNima,4)

#Troca zeros ou muito pequenos por NA
pm[pm<0.0000001]<-NA

#Criando Matriz só com as concentrações e renomeia as colunas com nomes dos elementos químicos
pmConc = pm[,c(1,seq(2,length(pm),2))]
names(pmConc)[-1] <- subElement(names(pmConc)[-1])

#Criando Matriz só com erros e renomeia as colunas com nomes dos elementos químicos
pmError = pm[,c(1,seq(3,length(pm),2))]
names(pmError)[-1] <- subElement(names(pmError)[-1])

#Lista de Elementos analisados pelo EDXRF
pmElementos<-names(pmConc)[2:length(names(pmConc))]

#Juntando informacoes de Nima, infoNima, com tabela de concentrações EDXRF, pm_conc.
pmConc<-merge(infoNima[,c('SampleID','SiteName','SampleType','Date','volumem3','Duplicate','MassConc')],
              pmConc,by="SampleID")
names(pmConc)[names(pmConc)=='MassConc'] <- 'mass'
write.csv(pmConc,file="../../outputs/pmConc.csv",row.names=F) #Para latex

#Juntando erro da massa em infoNima com tabela de erro EDXRF, pm_error.
pmError<-merge(infoNima[,c('SampleID','SiteName','SampleType','Date','volumem3','Duplicate','MassError')],
               pmError,by="SampleID")
names(pmError)[names(pmError)=='MassError'] <- 'mass'

#Converte as concentrações e erro de ng para ug/m3 (Harvard pediu que não dividisse pelo volume)
pmConc[,pmElementos]<-pmConc[,pmElementos]/(1000*pmConc$volumem3)
pmError[,pmElementos]<-pmError[,pmElementos]/(1000*pmError$volumem3)

#Verificando faltantes:
#describe(pmConc[,pmElementos])

#Remover elementos com muitos casos faltantes
#Elementos removidos, mas futuramente reanalisar espectros (PyMCA):
elementosRemovidos = c('Rh','Ce','Se','Y','Co','Nb','Lu','Th','Ga','Hf','Ba') #Talvez: Rb
pmConc <- pmConc[, !(names(pmConc) %in% elementosRemovidos)]
pmError <- pmError[, !(names(pmError) %in% elementosRemovidos)]

#Removendo elementos excluídos do vetor 'pmElementos'
pmElementos <- pmElementos[!(pmElementos %in% elementosRemovidos)]

#Substituir NAs pelo limite de detecção
for(i in pmElementos){
  Zi = periodicTable[periodicTable$code==i,1]
  pmConc[,i]<-na2LD(Zi,pmConc[,i])
  pmError[,i]<-na2LD(Zi,pmError[,i],erro=TRUE)
}

#TODO: Amostras que não foram analisadas pelo EDX, reportar!
if(debug) setdiff(infoNima$SampleID,pmConc$SampleID)

#Divisão entre Fino e Inalável
amostrasInalaveis <- subset(pmConc,pmConc$SampleType=="PM10")$SampleID
amostrasFinas <- subset(pmConc,pmConc$SampleType=="PM2.5")$SampleID

#Concentrações por tipo
pmInalavel <- pmConc[pmConc$SampleID %in% amostrasInalaveis,]
pmFino <- pmConc[pmConc$SampleID %in% amostrasFinas,]

#Tabela de Erros por tipo de MP
pmInalavelError <- pmError[pmError$SampleID %in% amostrasInalaveis,]
pmFinoError <- pmError[pmError$SampleID %in% amostrasFinas,]

#BlackCarbon de Nima
BlackCarbon <- BlackCarbon[BlackCarbon$SampleID %in% amostrasFinas, ]

#TODO: reportar Amostras de Nima que não há análise de BlackCarbon
setdiff(pmFino$SampleID,BlackCarbon$SampleID)

#Junta BC com fino
pmFino<-merge(pmFino,BlackCarbon[,c(1,2)],by="SampleID")
pmFinoError<-merge(pmFinoError,BlackCarbon[,c(1,3)],by="SampleID")
names(pmFinoError)[names(pmFinoError)=='BCerror']='BC'

#Unidade do Black Carbon: ug/cm2, vamos converter para ug/m3
area = 7.069
pmFino$BC<-(pmFino$BC*area)/pmFino$volumem3
pmFinoError$BC<-(pmFinoError$BC*area)/pmFinoError$volumem3

########################
#TODO: O Grosso considerado aqui eh na verdade inalável. Encontrar o grosso subtraindo o fino do inalável.

#Convert colunm for string again, to use in graphs, PRECISA?
#infoNima$DiaMesAno <- strftime(infoNima$Date,format="%d/%m/%Y")

#TODO: fazer análises por estação do ano: primavera, verão, outono e inverno. 

#TODO: Reportar período da amostragem
min(pmFino$Date)
max(pmFino$Date)

########################
#  NMA: área residencial, ruas não pavimentadas (R) 
#  NMT: avenida principal, com tráfego intenso de veículos (T)
#  Nomeclatura: 
#  - Local (R-residiencial, T-traffic ou J-joint) 
#  - Fino, Grosso ou Inalável (F, G, I) 
#  - Com/Sem/Exclusivamente Harmathan (cH / sH / eH)

#Harmathan: dez, Jan, Fev, Março
harmathan<-c('December','January','February','March')

#Divisões do MP Fino
JFcH <- pmFino
RFcH <- subset(pmFino,pmFino$SiteName=="NMA")
TFcH <- subset(pmFino,pmFino$SiteName=="NMT")
JFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan),]
RFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan) & pmFino$SiteName=="NMA",]
TFsH <- pmFino[ !(months(pmFino$Date) %in% harmathan) & pmFino$SiteName=="NMT",]
JFeH <- pmFino[months(pmFino$Date) %in% harmathan,]

#Data.frame das incertezas MP Fino
JFcHunc <- pmFinoError
RFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMA")
TFcHunc <- subset(pmFinoError,pmFinoError$SiteName=="NMT")
JFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan),]
RFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan) & pmFinoError$SiteName=="NMA",]
TFsHunc <- pmFinoError[ !(months(pmFinoError$Date) %in% harmathan) & pmFinoError$SiteName=="NMT",]
JFeHunc <- pmFinoError[months(pmFinoError$Date) %in% harmathan,]

#Divisões do MP Inalável
JIcH <- pmInalavel
RIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMA")
TIcH <- subset(pmInalavel,pmInalavel$SiteName=="NMT")
JIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan),]
RIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan) & pmInalavel$SiteName=="NMA",]
TIsH <- pmInalavel[ !(months(pmInalavel$Date) %in% harmathan) & pmInalavel$SiteName=="NMT",]
JIeH <- pmInalavel[months(pmInalavel$Date) %in% harmathan,]

#Data.frame das incertezas MP Inalável
JIcHunc <- pmInalavelError
RIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMA")
TIcHunc <- subset(pmInalavelError,pmInalavelError$SiteName=="NMT")
JIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan),]
RIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan) & pmInalavelError$SiteName=="NMA",]
TIsHunc <- pmInalavelError[ !(months(pmInalavelError$Date) %in% harmathan) & pmInalavelError$SiteName=="NMT",]
JIeHunc <- pmInalavelError[months(pmInalavelError$Date) %in% harmathan,]

conditions<-c('JFcH','RFcH','TFcH','JFsH','RFsH','TFsH','JFeH',
              'JIcH','RIcH','TIcH','JIsH','RIsH','TIsH','JIeH')

#Verifica se existe diretório 'concentrations', se não, criar uma. 
if(!('concentrations' %in% list.files("../../outputs/"))) dir.create("../../outputs/concentrations")

#Salvando csv's
for (i in conditions){
  code=paste("write.csv(",i,",'../../outputs/concentrations/",i,".csv',","row.names=FALSE)",sep="")
  code_unc=paste("write.csv(",i,"unc",",'../../outputs/concentrations/",i,"unc.csv',","row.names=FALSE)",sep="")
  if(debug) print(code)
  if(debug) print(code_unc)
  eval(parse(text=code))
  eval(parse(text=code_unc))
}


