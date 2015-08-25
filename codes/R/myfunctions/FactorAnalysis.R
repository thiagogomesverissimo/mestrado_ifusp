FactorAnalysis <- function(current_base,nfactors){
  
  path_file = paste('../../outputs/pmf_fa/',current_base,'.csv',sep='')
  base<-read.csv(path_file,header=TRUE,row.names=1)
  datas = as.POSIXct(strptime(rownames(base), format = '%d/%m/%Y %H:%M'))

  # PCA igual a do SPSS
  base.principal<-principal(base,nfactors=nfactors,rotate="varimax")

  # Loadings, h2 comunalidade e u2 a unicidade (ou singularidade)
  base.principal = fa.sort(base.principal)
  loadings_caption_name = paste("Análise de Fatores: ",current_base,sep="")
  #print(loadings(base.principal),cutoff=2e-1)
  loading_latex = fa2latex(base.principal,
                         font.size = 'tiny',
                         heading = current_base,
                         cumvar=T,
                         caption=loadings_caption_name)
  loading_file_name = paste('../../outputs/loadings_',current_base,".tex",sep="")
  write(loading_latex,file=loading_file_name)

  # Scree plot
  scree_file_name = paste('../../outputs/scree_',current_base,'.pdf',sep="")
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

  # Scores 
  comunalidade_file_name = paste('../../outputs/comunalidade_',current_base,'.tex',sep='')
  pdf(file=comunalidade_file_name)
  
  scores_file_name = paste('../../outputs/scores_',current_base,'.pdf',sep="")
  pdf(file=scores_file_name)
  par(mfrow=c(3,2)) 
  for(i in seq(1:nfactors)){
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
}


