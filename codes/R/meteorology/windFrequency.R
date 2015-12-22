source("myfunctions/load.R")

noaa_harvard<-read.csv("../../outputs/noaa_from_harvard.csv")
noaa_harvard$YRMODAHRMN<-strptime(noaa_harvard$YRMODAHRMN,"%Y%m%d%H%M")


#Estações do ano desde agosto 2006 até agosto 2008
#Início e fim das datas para fazer os filtros.
completo2006_2008<-list(begin=strptime('21-09-2006','%d-%m-%Y'),
                        end=strptime('20-06-2008','%d-%m-%Y'),
                        titulo='Setembro/2006-Junho/2008',
                        filename='completo2006_2008')

autumn2006<-list(begin=strptime('21-09-2006','%d-%m-%Y'),
                 end=strptime('20-12-2006','%d-%m-%Y'),
                 titulo='Setembro/2006-Dezembro/2006 (Outono)',
                 filename='autumn2006')

winter2006_2007<-list(begin=strptime('21-12-2006','%d-%m-%Y'),
                      end=strptime('20-03-2007','%d-%m-%Y'),
                      titulo='Dezembro/2006-Março/2007 (Inverno)',
                      filename='winter2006_2007')

spring2007<-list(begin=strptime('21-03-2007','%d-%m-%Y'),
                 end=strptime('20-06-2007','%d-%m-%Y'),
                 titulo='Março/2007-Junho/2007 (Primavera)',
                 filename='spring2007')

summer2007<-list(begin=strptime('21-06-2007','%d-%m-%Y'),
                 end=strptime('20-09-2007','%d-%m-%Y'),
                 titulo='Junho/2007-Setembro/2007 (Verão)',
                 filename='summer2007')

autumn2007<-list(begin=strptime('21-09-2007','%d-%m-%Y'),
                 end=strptime('20-12-2007','%d-%m-%Y'),
                 titulo='Setembro/2007-Dezembro/2007 (Outono)',
                 filename='autumn2007')

winter2007_2008<-list(begin=strptime('21-12-2007','%d-%m-%Y'),
                      end=strptime('20-03-2008','%d-%m-%Y'),
                      titulo='Dezembro/2007-Março/2008 (Inverno)',
                      filename='winter2007_2008')

spring2008<-list(begin=strptime('21-03-2008','%d-%m-%Y'),
                 end=strptime('20-06-2008','%d-%m-%Y'),
                 titulo='Março/2008-Junho/2008 (Primavera)',
                 filename='spring2008')

harmattan2006_2007<-list(begin=strptime('25-12-2006','%d-%m-%Y'),
                         end=strptime('07-02-2007','%d-%m-%Y'),
                         titulo='Dezembro/2006-Fevereiro/2007 (Harmatão)',
                         filename='harmattan2006_2007')

harmattan2007_2008<-list(begin=strptime('25-12-2007','%d-%m-%Y'),
                         end=strptime('07-02-2008','%d-%m-%Y'),
                         titulo='Dezembro/2007-Fevereiro/2008 (Harmatão)',
                         filename='harmattan2007_2008')

periodos<-list(completo2006_2008,
               autumn2006,
               winter2006_2007,
               spring2007,
               summer2007,
               autumn2007,
               winter2007_2008,
               spring2008,
               harmattan2006_2007,
               harmattan2007_2008)


for (i in periodos){
  windFrequency(subset(noaa_harvard,noaa_harvard[,3] >= i$begin & noaa_harvard[,3] <= i$end),i$titulo,i$filename)
}