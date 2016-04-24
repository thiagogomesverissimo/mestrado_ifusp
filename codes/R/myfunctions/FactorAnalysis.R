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
  write.csv(as.data.frame(unclass(base.principal$loadings)),file=loading_csv_file_name) 
  
  # Salva comunalidade em csv
  comunalidade_csv_file_name = paste('../../outputs/comunalidade_',current_base,nfactors,".csv",sep="")
  write.csv(as.data.frame(unclass(base.principal$communality)),file=comunalidade_csv_file_name) 
  
  # Salva autovalores em csv
  autovalor_csv_file_name = paste('../../outputs/autovalor_',current_base,nfactors,".csv",sep="")
  write.csv(as.data.frame(unclass(base.principal$values)),file=autovalor_csv_file_name) 
  
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
  beautifulFAdisplay(current_base,nfactors)
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
    #print(elementos)
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


beautifulFAdisplay <- function(sigla,nfactors){
  
  # test:
  #source("myfunctions/load.R")
  #sigla = 'RFsH'; nfactors = 5
  
  # lê loadings
  path_file = paste('../../outputs/loadings_',sigla,nfactors,'.csv',sep='')
  loading <- read.csv(path_file)
  n = ncol(loading)-1
  colnames(loading) = c('especie',paste(rep('Fator'),seq(n),sep=""))
  
  # lê comunalidade
  path_file = paste('../../outputs/comunalidade_',sigla,nfactors,'.csv',sep='')
  comunalidade <- read.csv(path_file)
  colnames(comunalidade) = c('especie','Comunalidade')
  
  # lê autovalores. 
  path_file = paste('../../outputs/autovalor_',sigla,nfactors,'.csv',sep='')
  autovalor <- read.csv(path_file)
  
  # add communinality to loading table
  data = merge(loading,comunalidade,by='especie')
  
  # ordena 
  data = data[order(data$Fator1,data$Fator2,data$Fator3,data$Fator4,decreasing = T),]
  
  # add SSloaging
  # Não sei se o cálculo da variância explicada é feito 
  # com os SS loading ou com autovalor, por hora vou usar o ssloading
  ssloading = function(x){sum(x^2)}
  linha_ssloading = apply(data[,seq(2,n+1)],2,ssloading)
  explicada = 100*(linha_ssloading/(nrow(data)))
  total_explicada =  sum(explicada) 
  
  linha_ssloading = rbind(c('ssloading',linha_ssloading,''))
  linha_explicada = rbind(c('explicada',explicada,total_explicada))
  colnames(linha_ssloading) = colnames(data)
  colnames(linha_explicada) = colnames(data)
  #data = rbind(data,linha_ssloading)
  data = rbind(data,linha_explicada)
  
  # add autovalor
  linha_autovalor = rbind(c('autovalor',autovalor[seq(n),2],''))
  colnames(linha_autovalor) = colnames(data)
  #data = rbind(data,linha_autovalor)
  
  # duas casas decimais
  data[,-1] = apply(data[,-1],2,as.numeric)
  data[,-1] = round(data[,-1],2)
  #data[,-1] = format(data[,-1],digits=1,nsmall=2)
  
  # coloca em vermelho, com erro
  #x = data[,seq(2,n+1)]
  #x[x>0.7] = paste('\\textcolor{red}{\\textbf{',x[x>=0.7],'}}',sep='')
  #data[,seq(2,n+1)] = x

  data[nrow(data),ncol(data)] = paste('total =',data[nrow(data),ncol(data)],'\\%')
  
  path_output = paste('../../outputs/beautifulFAdisplay_',sigla,nfactors,'.tex',sep='')
  print(xtable(data,align = rep('c',ncol(data)+1)),
        type="latex", 
        floating = FALSE,
        include.rownames = F, 
        sanitize.text.function = identity,
        file=path_output)
}