FactorAnalysis <- function(current_base,nfactors){
  
  # test:
  #source("myfunctions/load.R")
  #current_base = 'TIcH'; nfactors = 5
  path_file = paste('../../outputs/pmf_fa/',current_base,'.csv',sep='')
  base<-read.csv(path_file,row.names=1)
  datas = as.POSIXct(strptime(rownames(base), format = '%d/%m/%Y %H:%M'))

  # PCA igual a do SPSS
  base.principal<-principal(base,nfactors=nfactors,rotate="varimax")

  # Loadings, h2 comunalidade e u2 a unicidade (ou singularidade)
  base.principal = fa.sort(base.principal)
  
  # Salva em texto puro
  fa_file_name = paste('../../outputs/factor_analysis_',current_base,nfactors,".txt",sep="")
  capture.output( print(base.principal), file=fa_file_name)
  
  # Salva loading em csv
  loading_csv_file_name = paste('../../outputs/loadings_',current_base,nfactors,".csv",sep="")
  capture.output( print(base.principal), file=loading_csv_file_name)
  write.csv(as.data.frame(unclass(base.principal$loadings)),file=loading_csv_file_name) 
  
  #print(loadings(base.principal),cutoff=2e-1)
  loading_latex = fa2latex(base.principal,
                         font.size = 'normalsize', # normalsize,small, scriptsize, tiny
                         heading = current_base,
                         cumvar=T,
                         apa=T,
                         caption='')

  
  loading_file_name = paste('../../outputs/loadings_',current_base,nfactors,".tex",sep="")
  fa2latex(base.principal,
           font.size = 'normalsize',
           heading = '',#loadings_caption_name,
           cumvar=T,
           apa=T,
           caption='',
           file=loading_file_name)

  # Scree plot
  scree_file_name = paste('../../outputs/scree_',current_base,nfactors,'.pdf',sep="")
  pdf(file=scree_file_name)
  plot(base.principal$values,
    ylab='Autovalor',
    xlab='Componentes',
    type = 'p',
    col = 'blue', 
    cex=.7,
    main = 'Scree Plot RFsH')
  dev.off()

  # Falta fazer os gráficos dos resíduos:
  # base.principal$residual

  # Será que esses são os factor scores?
  # base.principal$weights
  # base.principal$r.scores

  # Monta um gráfico que agrega todos fatores
  scores_file_name = paste('../../outputs/scores_',current_base,nfactors,'.pdf',sep="")
  pdf(file=scores_file_name)
  par(mfrow=c(3,2)) 
  for(i in seq(1:nfactors)){
    #i=2 # for debug
    factor_graph_name = paste(current_base,': Fator ',i,sep='')
    plot(base.principal$scores[,i] ~ datas,
         xaxt = "n", 
         type = 'p',
         xlab = '',
         col = 'blue', 
         cex=.7,
         ylab = 'Score', 
         main = factor_graph_name)
    axis(1, datas, format(datas, "%b-%Y"))
  }
  dev.off()
  
  # Monta um gráfico para cada fator
  for(i in seq(1:nfactors)){
    fator_file_name = paste('../../outputs/score_',current_base,nfactors,'-F',i,'.pdf',sep="")
    pdf(file=fator_file_name)
    plot(base.principal$scores[,i] ~ datas,
         xaxt = "n", 
         type = 'p',
         xlab = '',
         col = 'blue', 
         cex=.7,
         ylab = 'Score')
    axis(1, datas, format(datas, "%b-%Y"))
    dev.off()
  }
  briefFA(current_base,nfactors)
  return(base.principal)
}

####

briefFA <-function(sigla,nfactors){
  #sigla = 'RFcH'
  path_file = paste('../../outputs/loadings_',sigla,nfactors,'.csv',sep='')
  loading<-read.csv(path_file)
  arquivo = paste('../../outputs/factor_analysis_',sigla,nfactors,'.txt',sep='')
  
  linha = readLines(arquivo,warn = F)
  linha_variancia_acumulada = linha[grepl('Cumulative Var',linha)]
  vetor_variancia_acumulada = unlist(strsplit(linha_variancia_acumulada, split=" "))
  variancia_acumulada = vetor_variancia_acumulada[length(vetor_variancia_acumulada)]

  num_fatores = ncol(loading) - 1
  saida = data.frame(c('Variância Acumulada',variancia_acumulada))

  for (i in seq(1, num_fatores)){
    elementos=as.character(subset(loading,loading[,i+1]>0.4)[,1])
    print(elementos)
    linha= c(paste('F',i,sep=''),paste(elementos,collapse=', '))
    saida = cbind(saida,linha)
  }
  saida = as.data.frame(t(saida))
  saida = rbind(saida,saida[1,])
  saida = saida[-1,]

  path_output = paste('../../outputs/briefFA_',sigla,nfactors,'.tex',sep='')
  print(xtable(saida),
    type="latex", 
    floating = FALSE,
    include.rownames = F, 
    sanitize.text.function = identity,
    file=path_output)
}
