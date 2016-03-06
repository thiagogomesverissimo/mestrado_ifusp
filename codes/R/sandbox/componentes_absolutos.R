#Luis e Thiago 
#Cálculo dos fatores absolutos a partir da análise de fatores

#i: elementos; j: fatores; F: loading do fator 

#Ler o arquivo de concentraçõese atribui para rio.
rio = read.csv("../../inputs/thirds/RioLuis.csv",dec=".")

#Carregar a biblioteca psych no sistema
library("psych")

#Excluindo a coluna da data, Na e Hf
rio = rio[,c(-1,-4,-20)]

#Tabela de estatistica descritiva
descritiva = as.data.frame(describe(rio))

#rodando analise de fatores
rio.fatores = principal(rio,nfactors=5,rotate="varimax")

#Jeito bunitinho de ver:
print.psych(rio.fatores,cut=0.1,sort=TRUE,digits=3)

#Colocando os loadings em um data.frame
loadings.rio = unclass(rio.fatores$loadings)

###############
#Componentes Absolutos

#Pegando nomes das colunas
elementos = rownames(loadings.rio)

#retirar a massa da lista dos elementos
elementos = elementos[-1]

#Pegando nomes dos fatores
fatores = colnames(loadings.rio)

#Encurtando nome
L = loadings.rio
D = descritiva

#Criando um data.frame vazio para as componentes absolutas
componentes.absolutos = matrix(0,length(elementos),length(fatores))

#Transformar essa matrix em data.frame
componentes.absolutos = as.data.frame(componentes.absolutos)
colnames(componentes.absolutos) = fatores
rownames(componentes.absolutos) = elementos

#varredura no nomes dos fatores
for(fator in fatores){
  for(elemento in elementos){
    #Se o loading for negativo, pular
    if(L[elemento,fator] > 0) {
      componentes.absolutos[elemento,fator] = 
      (L[elemento,fator] * D[elemento,4])/(D["massa",4]*L["massa",fator])
    }
  }
}


write.csv(componentes.absolutos,"../../outputs/componetes_absolutos_rio.csv")