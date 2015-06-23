#####acho que não está sendo usada essa função
#Substitue valores NA da coluna pela média da coluna
na2media <- function(coluna){
  retorno <- c()
  for (i in coluna){
    if (is.na(i))
      retorno<-append(retorno,mean(coluna,na.rm=T))
    else
      retorno<-append(retorno,i)
  }
  retorno
}
