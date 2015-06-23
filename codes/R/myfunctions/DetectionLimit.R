DetectionLimit<-function(amostra,linha,corrente,tempo,area,volume)
{ 
  if(linha=="K")
  {
    Resposta<-read.csv("../../inputs/FatorResposta/ftrespostaK2010.csv")
  } 
  else if(linha=="L")
  {
    Resposta<-read.csv("../../inputs/FatorResposta/ftrespostaL2010.csv")
  }
  
  #cria dataframe limite
  limite<-cbind(amostra$Z)
  limite<-cbind(limite,0)
  limite<-cbind(limite,0)
  colnames(limite)<-c('Z','N','limite')
  limite<-data.frame(limite)
  
  #Soma coluna1 e coluna2 (para K: ka1+ka2 e para L: L3M5+L3M4)
  for (Z in amostra$Z) 
  {
    limite[limite$Z==Z,2]<-sum(amostra[amostra$Z==Z,3],
                               amostra[amostra$Z==Z,4],
                               na.rm=T)
  }
  
  #Calcula limite em ng/m3
  for (Z in limite$Z) 
  {
    limite[limite$Z==Z,3] = area*3*sqrt(limite[limite$Z==Z,2])/
      (corrente*tempo*volume*Resposta[Resposta$Z==Z,2])
  }
  return(limite)
}
