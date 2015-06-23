# Função que trata SampleID: remover as siglas GHA, AFR etc, transformar em inteiro e juntar novamente
TrataID<-function(dados,coluna) {
  dados[,coluna]<-paste(toupper(substr(dados[,coluna],1,3)),as.integer(gsub('\\D','',dados[,coluna])),sep="")
  return(dados)
}