duplicates<-function(x,erro=F) {
  amostras_duplicadas <- subset(x,x$Duplicate==1)
  amostras_nao_duplicadas <- subset(x,x$Duplicate==0)
   
  # Datas em que ocorrem duplicidade
  datas<-unique(as.vector(amostras_duplicadas$diamesano))

  amostras_duplicadas_medias = data.frame()

  for(i in datas){
    # Algumas amostras duplicadas estavam rasgadas, então só há uma amostra aqui.
    n = sum(amostras_duplicadas$diamesano==i)
    if(n==2){
      mesma_data = amostras_duplicadas[amostras_duplicadas$diamesano==i,]
    
      # Vou assumir que a partir da coluna da massa só há dados de poluentes
      inicio_poluentes = which(colnames(mesma_data)=='mass')
      fim_poluentes = length(mesma_data)
      
      if(erro){
        medias = sqrt(mesma_data[2,inicio_poluentes:fim_poluentes]**2 + 
                      mesma_data[1,inicio_poluentes:fim_poluentes]**2)
      }
      else {
        medias = colMeans(mesma_data[,inicio_poluentes:fim_poluentes])
        medias = t(as.data.frame(medias))
      }
      
      # Montando a linha completa
      colunas_info = mesma_data[1,1:(inicio_poluentes-1)]
      linha_final = cbind(colunas_info,medias)
      
      # Novo SampleID: composição das duas amostras
      SampleID = paste(as.character(mesma_data[1,1]),as.character(mesma_data[2,1]),sep="")
      linha_final[colnames(linha_final)=='SampleID'] = SampleID
    }
    else if(n==1){
      # Se não há duplicada, apenas mantem linha
      linha_final = amostras_duplicadas[amostras_duplicadas$diamesano==i,]
    }
    amostras_duplicadas_medias = rbind(amostras_duplicadas_medias,linha_final)
  }
  retorno = merge(amostras_duplicadas_medias,amostras_nao_duplicadas,all=TRUE)
  
  # Caso não haja duplicadas, retorna o data.frame recebido
  if(!sum(x$Duplicate)) retorno = x
  
  return(retorno)
}

# Testes:
#x = read.csv("../../outputs/concentrations/TFcH.csv")
#y = duplicates(x,T)


