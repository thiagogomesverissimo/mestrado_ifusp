na2LD<-function(z,coluna,erro=FALSE)
  #Função recebe 2 ou 3 argumentos: 
  #z: número atomico (integer)
  #coluna: A coluna com todos valores, os NA serão substituídos pelo LD.
  #Substitui pela metade do limite de detecção
  #Unidade do LD ug/m3
  {
    if(erro)
      razao = 5/6
    else
      razao = 1/2
  
    retorno <- c()
    limiteK<-read.csv(file="../../outputs/detectionLimitACC386K.csv",header=TRUE)
    limiteL<-read.csv(file="../../outputs/detectionLimitACC386L.csv",header=TRUE)
    #Linha K
    if(z < 41)
    {
      for (i in coluna)
      {
        if (is.na(i))
          retorno<-append(retorno,limiteK[limiteK$Z==z,4]*razao)
        else
          retorno<-append(retorno,i)
      }
    }
    #Linha L
    else
    {
      for (i in coluna)
      {
        if (is.na(i))
          retorno<-append(retorno,limiteL[limiteL$Z==z,4]*razao)
        else
          retorno<-append(retorno,i)
      }   
    }
    return(retorno)
  }
