fix_significativos = function(data){
  # A coluna 1 deve ser o valor e a 2 a incerteza
  #test 
  #raw_data = read.csv('../../inputs/edxCalibration/americo/K2010MaioMedidosAkerr.csv', row.names = 1)
  #data = raw_data*1000

  # ajusta as incertezas para dois significativos
  data[,2] = signif(data[,2],digits = 2)
  
  # remove zero da direita
  data[,2] = prettyNum(data[,2])
  
  # acresenta o zero em números menores que 10 para manter sempre dois siginificativos
  for (i in 1:nrow(data)) {
    #print(data[i,2])
    if(as.numeric(data[i,2]) < 1){
      s = as.character(data[i,2])
      s = str_replace_all(s,'0','')
      s = str_replace_all(s,'\\.','')
      if(nchar(s)==1){
        data[i,2] = paste(data[i,2],'0',sep='') 
      }
    }
    if( (as.numeric(data[i,2]) >=1) & (as.numeric(data[i,2]) <10) ){
      s = as.character(data[i,2])
      if(nchar(s)==1){
        data[i,2] = paste(data[i,2],'.0',sep='') 
      }
    }
  }
  
  # ajusta as medidas de acordo com as incertezas
  for (i in 1:nrow(data)) {
    #i=1
    decimais =  unlist(str_split(data[i,2],'\\.'))
    if(length(decimais) == 2){
      code=paste('data[i,1] = sprintf("%.',nchar(decimais[2]),'f",',as.numeric(data[i,1]),')',sep="")
      eval(parse(text=code))

    }
    else {
      data[i,1] = round(as.numeric(data[i,1]),0)
    }
  }
  return(data)
}

# function from http://stackoverflow.com/questions/5587676/pull-out-p-values-and-r-squared-from-a-linear-regression
pvalue <- function (modelobject) {
  if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
  f <- summary(modelobject)$fstatistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) <- NULL
  return(p)
}

corrige_coluna = function(coluna){
  #coluna = apply(coluna, 2, as.character)
  coluna = as.character(coluna)
  coluna = sprintf("%.2f",as.numeric(coluna))
  str_replace_all(coluna,'\\.',',')
}