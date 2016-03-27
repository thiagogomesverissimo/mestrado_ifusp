#rm(list=ls())
source("myfunctions/load.R")

# Tabela periódica
periodicTable<-read.csv("../../inputs/constants/periodic_table.csv",header=TRUE)

# Informations about Nima samples provided by Kathie by email
infoNima<-read.csv("../../inputs/infoNima/infoNima.csv",header=TRUE)

# Informations about blanks samples (provided by Kathie by email)
infoBlank<-read.csv("../../inputs/infoNima/infoBlank.csv",header=TRUE)

# Extra information (not only about Nima) (provided by Zheng at 2013-october-29) 
SampleInfo<-read.csv("../../inputs/infoNima/SampleInfo29oct2013.csv",header=TRUE)

# Load concentrations EDfrom XRF analysis at IAG/USP
acc<-read.csv("../../inputs/edxAnalysis/acc.csv")
afr<-read.csv("../../inputs/edxAnalysis/afr.csv")
gpe<-read.csv("../../inputs/edxAnalysis/gpe.csv")
gha<-read.csv("../../inputs/edxAnalysis/gha.csv")

# Load Black Carbon 
BlackCarbon<-read.csv("../../outputs/BlackCarbon.csv")

# Converting date columns
infoNima$StartTime<-as.POSIXct(strptime(infoNima$StartTime,format="%m/%d/%y %H:%M",tz="GMT"))
infoNima$EndTime<-as.POSIXct(strptime(infoNima$EndTime,format="%m/%d/%y %H:%M",tz="GMT"))

# Cria coluna com a data média
time<-c()
for(row in 1:nrow(infoNima))
{
  media_da_linha = mean(c(infoNima[row,]$StartTime,infoNima[row,]$EndTime))
  time<-append(time,as.POSIXct(media_da_linha))
}
infoNima<-cbind(infoNima,Date=time)

# Adiciona coluna 'diamesano'
infoNima = cbind(infoNima,diamesano=strftime(infoNima$Date,format="%d/%m/%Y"))

# Adicionar uma coluna do erro da massa, vamos supor de 5%
infoNima<-cbind(infoNima,MassError=infoNima$MassConc*0.05)

# Agregando todas tabelas de concentração das análises EDX
pm<-acc 
pm<-merge(pm,afr,all=TRUE)
pm<-merge(pm,gpe,all=TRUE)
pm<-merge(pm,gha,all=TRUE)
write.csv(pm,'../../outputs/pm.csv',row.names = F)

# Uniformizando os identificadores das amostras (IDs)
pm<-TrataID(pm,1)
infoNima<-TrataID(infoNima,4)

# Remover danificas
danificadas = cbind(SampleID=subset(infoNima,infoNima$QCFlag==1)$SampleID,
                    motivo="Danificada na manipulação")
write.csv(danificadas,file="../../outputs/amostras_removidas_da_analise.csv",row.names=F)
infoNima <- subset(infoNima,infoNima$QCFlag==0)

# Remove as que não tem massa.
amostras_sem_massa = cbind(subset(infoNima,is.na(infoNima$MassConc))$SampleID,
                    motivo="Não tem medição da massa gravimétrica")
write.table(amostras_sem_massa,file="../../outputs/amostras_removidas_da_analise.csv",
            row.names=F,sep=",",dec=".",append=T,col.names = F)
infoNima <- subset(infoNima,!is.na(infoNima$MassConc)) 

# Troca zeros ou muito pequenos por NA
pm[pm<0.0000001]<-NA

# Separa tabela de concentrações e erros
pmConc = pm[,c(1,seq(2,length(pm),2))]
pmError = pm[,c(1,seq(3,length(pm),2))]

# Renomeia as colunas com nomes dos elementos químicos
names(pmConc)[-1] <- subElement(names(pmConc)[-1])
names(pmError)[-1] <- subElement(names(pmError)[-1])

# Lista de Elementos analisados pelo EDXRF
pmElementos<-names(pmConc)[2:length(names(pmConc))]

# Juntando informações de Nima e infoNima com tabela de concentrações pmConc.
pmConc<-merge(infoNima[,c('SampleID','SiteName','SampleType','Date','diamesano',
                          'volumem3','Duplicate','MassConc')],
              pmConc,by="SampleID")
names(pmConc)[names(pmConc)=='MassConc'] <- 'mass'

# Ordena tabela pmConc pela data e salva csv
pmConc = pmConc[order(pmConc$Date),]
write.csv(pmConc,file="../../outputs/pmConc.csv",row.names=F)

# Juntando erro da massa em infoNima com tabela de erro EDXRF, pmError.
pmError<-merge(infoNima[,c('SampleID','SiteName','SampleType','Date','diamesano',
                           'volumem3','Duplicate','MassError')],
               pmError,by="SampleID")
names(pmError)[names(pmError)=='MassError'] <- 'mass'

# Ordena tabela pmError pela data e salva csv
pmError = pmError[order(pmError$Date),]
write.csv(pmError,file="../../outputs/pmError.csv",row.names=F)

# Converte as concentrações e erro de ng para ug/m3
pmConc[,pmElementos]<-pmConc[,pmElementos]/(1000*pmConc$volumem3)
pmError[,pmElementos]<-pmError[,pmElementos]/(1000*pmError$volumem3)

# Elementos removidos, mas futuramente reanalisar espectros (PyMCA):
elementosRemovidos = c('Rh','Ce','Y','Co','Nb','Lu','Th','Ga','Hf','Ba','Se') #Talvez: Rb
#elementosRemovidos = c('Rh')
pmConc <- pmConc[, !(names(pmConc) %in% elementosRemovidos)]
pmError <- pmError[, !(names(pmError) %in% elementosRemovidos)]

# Removendo elementos excluídos do vetor 'pmElementos'
pmElementos <- pmElementos[!(pmElementos %in% elementosRemovidos)]
#describe(pmConc[,pmElementos])
# A função describe está no pacote Hmisc e psych
detach("package:Hmisc", unload=TRUE) 
write.csv(describe(pmConc[,pmElementos]),'../../outputs/edxStatistics.csv',row.names = F)

# Substituir NAs pelo limite de detecção
for(i in pmElementos){
  Zi = periodicTable[periodicTable$code==i,1]
  pmConc[,i]<-na2LD(Zi,pmConc[,i])
  pmError[,i]<-na2LD(Zi,pmError[,i],erro=TRUE)
}

# Amostras que não foram analisadas pelo EDX
amostras_sem_edx = cbind(setdiff(infoNima$SampleID,pmConc$SampleID),motivo="Não tem análise EDX")
write.table(amostras_sem_edx,file="../../outputs/amostras_removidas_da_analise.csv",
            row.names=F,sep=",",dec=".",append=T,col.names = F)

# Divisão entre Fino e Inalável
amostrasInalaveis <- subset(pmConc,pmConc$SampleType=="PM10")$SampleID
amostrasFinas <- subset(pmConc,pmConc$SampleType=="PM2.5")$SampleID

# Concentrações por moda
pmInalavel <- pmConc[pmConc$SampleID %in% amostrasInalaveis,]
pmFino <- pmConc[pmConc$SampleID %in% amostrasFinas,]

# Erros por moda
pmInalavelError <- pmError[pmError$SampleID %in% amostrasInalaveis,]
pmFinoError <- pmError[pmError$SampleID %in% amostrasFinas,]

# BlackCarbon de Nima
BlackCarbon <- BlackCarbon[BlackCarbon$SampleID %in% amostrasFinas, ]

# Amostras de Nima que não há análise de BlackCarbon
amostras_sem_BC = cbind(setdiff(pmFino$SampleID,BlackCarbon$SampleID),motivo="Não tem análise de Black Carbon")
write.table(amostras_sem_BC,file="../../outputs/amostras_removidas_da_analise.csv",
            row.names=F,sep=",",dec=".",append=T,col.names = F)

# Junta BC com fino
pmFino<-merge(pmFino,BlackCarbon[,c(1,2)],by="SampleID")
pmFinoError<-merge(pmFinoError,BlackCarbon[,c(1,3)],by="SampleID")
names(pmFinoError)[names(pmFinoError)=='BCerror']='BC'

# Unidade do Black Carbon: ug/cm2, vamos converter para ug/m3
area = 7.069
pmFino$BC<-(pmFino$BC*area)/pmFino$volumem3
pmFinoError$BC<-(pmFinoError$BC*area)/pmFinoError$volumem3

# Salva pmFino
write.csv(pmFino,'../../outputs/pmFino.csv',row.names=FALSE)
write.csv(pmFinoError,'../../outputs/pmFinoError.csv',row.names=FALSE)

# Salva pmInalavel
write.csv(pmInalavel,'../../outputs/pmInalavel.csv',row.names=FALSE)
write.csv(pmInalavelError,'../../outputs/pmInalavelError.csv',row.names=FALSE)