descriptive2latex <- function(path,sigla){
  
  #path = '../../outputs/pmf_fa/'
  #sigla = 'RFcH'
  pathfile = paste(path,sigla,'.csv',sep='')
  base = read.csv(pathfile)
  
  # Tabela describe
  tabela = describe(base[,-1])
  tabela = tabela[,c(2,3,13,5,8,9)]
  tabela[,c(2,3,4,5,6)] = format(tabela[,c(2,3,4,5,6)], scientific=T,digits=2,nsmall=2)
  tabela[,1] = as.integer(tabela[,1])

  latex_file = paste('../../outputs/descriptive_',sigla,'.tex',sep='')
  print(xtable(tabela),
      type="latex", 
      floating = FALSE,
      include.rownames = T, 
      sanitize.text.function = identity,
      file=latex_file)
}