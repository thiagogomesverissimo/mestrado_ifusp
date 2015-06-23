duplicates<-function(x) {
  #output: A coluna duplicate é deletada.
  if(debug) print(c('Quantidade de amostras marcadas como duplicadas por Harvard',sum(x$Duplicate)))

  amostras_nao_duplicadas <- subset(x,x$Duplicate==0)
  amostras_duplicadas <- subset(x,x$Duplicate==1)
  
   
  #Datas em que ocorrem duplicidade
  datas<-unique(as.vector(amostras_duplicadas$Date))

  amostras_duplicadas_medias = data.frame()

  for(i in datas){
    if(debug)  print(c('Cálculo para média da datas: ',i))
    if(debug)  print(c('Quantidade de amostras duplicadas: ',sum(amostras_duplicadas$Date==i)))
  
    #Algumas amostras duplicadas estavam rasgadas, então mesmo com Duplicate marcado, só há uma amostra aqui.
    n = sum(amostras_duplicadas$Date==i)
    if(n==2){
      mesma_data = amostras_duplicadas[amostras_duplicadas$Date==i,]
    
      #Novo id: composição das duas amostras
      SampleID = paste(as.character(mesma_data[1,1]),as.character(mesma_data[2,1]),sep="")
    
      #Vou assumir que a partir da quarta coluna só há dados de concentração
      n = length(mesma_data)
      medias = colMeans(mesma_data[,4:n])
      medias = t(as.data.frame(medias))
    
      #Montando a linha com as médias
      linha_final = cbind(SampleID,Date=i)
      linha_final = merge(linha_final,medias)
    }
    else if(n==1){
      #Se não há duplicada, apenas remover coluna Duplicate
      linha_final = amostras_duplicadas[amostras_duplicadas$Date==i,]
      linha_final = linha_final[,!colnames(linha_final) %in% 'Duplicate']
    }
    amostras_nao_duplicadas = amostras_nao_duplicadas[,!colnames(amostras_nao_duplicadas) %in% 'Duplicate']
    amostras_duplicadas_medias = rbind(amostras_duplicadas_medias,linha_final)
  }
todas = merge(amostras_duplicadas_medias,amostras_nao_duplicadas,all=TRUE)
if(!sum(x$Duplicate)) todas<-x
return(todas)
}

#Testes:
#x = read.csv("../../outputs/concentrations/JFcH.csv")
#y = duplicates(x)


