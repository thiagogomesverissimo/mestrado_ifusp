#rm(list=ls())
source("myfunctions/load.R")

# get csv files names
csvfolder = '/home/thiago/remota/arquivados/pesquisa/mestrado_ifusp/spectrum_analysis/winqxas/brancos/'
csvfiles = c()
for (i in list.files(csvfolder)){
  if(grepl('csv',i)) csvfiles=append(csvfiles,i)
}

intervalo = c(as.Date('2010-05-20'),as.Date('2010-11-16'))
#intervalo2 = c(as.Date('2010-11-16'),as.Date('2011-04-08'))
segundos = 0

for (csvfile in csvfiles) {
  print(csvfile)
  # Leitura do arquivo
  linhas = read.csv(paste(csvfolder,csvfile,sep=''),header = F)
  
  # get date
  dateline = unlist(strsplit(as.character(linhas[5,1]), split=" "))
  #print(as.Date(dateline[9]))
  
  # get time
  timeline = unlist(strsplit(as.character(linhas[13,1]), split=" "))
  #print(timeline[40])
  
  if ( (as.Date(dateline[9]) >= intervalo[1]) & (as.Date(dateline[9]) <= intervalo[2])) {
    segundos = as.numeric(timeline[40]) + segundos
  }
}





