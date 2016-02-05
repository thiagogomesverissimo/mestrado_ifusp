## A functions collection to extract data from PMF-EPA csv outputs.

pmf_diagnostics <- function(path,sigla){
  
  ### Leitura do arquivo diagnostics.csv ###
  
  # tests:
  #sigla= 'RFsH'
  pathfile = paste(path,sigla,'/',sigla,'_diagnostics.csv',sep='')
  
  diagnostics=readLines(pathfile)
  linhas_em_branco = which(diagnostics=="")

  # **** Input Data Statistics ****
  inicio = which(diagnostics=='**** Input Data Statistics ****')
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim - 1 
  data_stat=diagnostics[inicio:fim]
  write(data_stat,file="/tmp/data_stat.csv")
  data_stat = read.csv("/tmp/data_stat.csv",skip=2)

  # Base run summary table:
  inicio = which(diagnostics=='Base run summary table:')
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim - 1
  Q=diagnostics[inicio:fim]
  write(Q,file="/tmp/Q.csv")
  Q = read.csv("/tmp/Q.csv",skip=1)

  # Sum of the squares of the differences in scaled residuals for each base run pair by species (d)
  inicio = which(diagnostics=='Sum of the squares of the differences in scaled residuals for each base run pair by species (d)')
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[1]
  fim = fim - 1 
  d=diagnostics[inicio:fim]
  write(d,file="/tmp/d.csv")
  d = read.csv("/tmp/d.csv",skip=1)

  # Sum of d across all species for each base run pair (D)
  inicio = which(diagnostics=='Sum of d across all species for each base run pair (D)')
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[1]
  fim = fim - 1 
  D=diagnostics[inicio:fim]
  write(D,file="/tmp/D.csv")
  D = read.csv("/tmp/D.csv",skip=1)

  # Regression diagnostics:
  inicio = which(diagnostics=='Regression diagnostics:')
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[1]
  fim = fim - 1 
  regression=diagnostics[inicio:fim]
  write(regression,file="/tmp/regression.csv")
  regression = read.csv("/tmp/regression.csv",skip=2)
  
  return(list(data_stat = data_stat,
              Q = Q,
              d = d,
              D = D,
              regression = regression))
}

pmf_contributions <- function(path,sigla){

  # tests:
  
  #sigla= 'RFsH'
  pathfile = paste(path,sigla,'/',sigla,'_contributions.csv',sep='')
    
  ### contributions.csv ###

  contributions=readLines(pathfile)
  linhas_em_branco = which(contributions=="")
  
  # Pega fatores
  fatores = strsplit(contributions[4],',')
  fatores = unlist(fatores)
  fatores = fatores[fatores != ""]
  
  # Factor Contributions (avg = 1) from Base Run
  inicio = grep('Factor Contributions',contributions)[1]
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim -1
  factor_contribution = contributions[inicio:fim]
  write(factor_contribution,file='/tmp/factor_contribution.csv')
  factor_contribution = read.csv('/tmp/factor_contribution.csv',skip=2)
  
  # Factor Contributions (conc. units) from Base Run
  inicio = grep('Factor Contributions',contributions)[2]
  fim = length(contributions)
  factor_contribution_conc_units = contributions[inicio:fim]
  write(factor_contribution_conc_units,file='/tmp/factor_contribution_conc_units.csv')
  factor_contribution_conc_units = read.csv('/tmp/factor_contribution_conc_units.csv',skip=3)
  
  # Remove duas colunas ques estão sobrando
  col_extras = ncol(factor_contribution_conc_units)-2
  factor_contribution_conc_units = factor_contribution_conc_units[1:col_extras]
  
  # Nomeia data.frames
  titulos_colunas = c('RunId','Date',fatores)
  colnames(factor_contribution_conc_units) = titulos_colunas
  colnames(factor_contribution) = titulos_colunas
  
  return(list(factor_contribution            = factor_contribution,
              factor_contribution_conc_units = factor_contribution_conc_units))
}

pmf_profiles <- function(path,sigla){
  
  ### profiles.csv ###
  
  # tests:
  pathfile = paste(path,sigla,'/',sigla,'_profiles.csv',sep='')
  
  profiles = readLines(pathfile)
  linhas_em_branco = which(profiles=="")

  # Factor Profiles (conc. of species) from Base Run
  inicio = grep('Factor Profiles',profiles)[1]
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim -1
  fp_conc_species = profiles[inicio:fim]
  write(fp_conc_species,file='/tmp/fp_conc_species.csv')
  fp_conc_species = read.csv('/tmp/fp_conc_species.csv',skip=2)
  row.names(fp_conc_species) = fp_conc_species[,2]
  fp_conc_species = fp_conc_species[,c(-1,-2)]
  
  # Factor Profiles (% of species sum) from Base Run
  inicio = grep('Factor Profiles',profiles)[2]
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim -1
  fp_percent_species = profiles[inicio:fim]
  write(fp_percent_species,file='/tmp/fp_percent_species.csv')
  fp_percent_species = read.csv('/tmp/fp_percent_species.csv',skip=2)
  row.names(fp_percent_species) = fp_percent_species[,2]
  fp_percent_species = fp_percent_species[,c(-1,-2)]
  
  # Factor Profiles (% of total variable) from Base Run
  inicio = grep('Factor Profiles',profiles)[3]
  fim = length(profiles)
  fp_percent_total = profiles[inicio:fim]
  write(fp_percent_total,file='/tmp/fp_percent_total.csv')
  fp_percent_total = read.csv('/tmp/fp_percent_total.csv',skip=2)
  row.names(fp_percent_total) = fp_percent_total[,2]
  fp_percent_total = fp_percent_total[,c(-1,-2)]
  
  return(list(fp_conc_species    =fp_conc_species,
              fp_percent_species =fp_percent_species,
              fp_percent_total   =fp_percent_total))
}

pmf_residuals <- function(path,sigla){
  
  ### residuals.csv ###
  
  # tests:
  pathfile = paste(path,sigla,'/',sigla,'_residuals.csv',sep='')
  
  residuals = readLines(pathfile)
  linhas_em_branco = which(residuals=="")
  
  # Residuals 
  inicio = grep('Base_Run',residuals)[1]
  fim = subset(linhas_em_branco,linhas_em_branco > inicio)[2]
  fim = fim - 2
  residuals_normal = residuals[inicio:fim]
  write(residuals_normal,file='/tmp/residuals_normal.csv')
  residuals_normal = read.csv('/tmp/residuals_normal.csv')
  
  # Scaled Residuals
  inicio = grep('Base_Run',residuals)[2]
  fim = length(residuals)
  scaled_residuals = residuals[inicio:fim]
  write(scaled_residuals,file='/tmp/scaled_residuals.csv')
  scaled_residuals = read.csv('/tmp/scaled_residuals.csv')
  
  return(list(residuals        = residuals_normal,
              scaled_residuals = scaled_residuals))
}

## Exports para latex

pmf_profiles_latex <- function(path,sigla) {
  
  #sigla = 'RFsH'
  profiles = pmf_profiles(path,sigla)
  x = profiles$fp_percent_species
  x = round(x,1)
  x = x[order(x$Factor.1,x$Factor.2,x$Factor.3,decreasing = T),]
  x[x>=30.0] = paste('\\textcolor{red}{\\textbf{',x[x>=30.0],'}}',sep='')

  latex_percent_species = paste('../../outputs/',sigla,'_profiles_percent_species.tex',sep='')
  print(xtable(x), 
      type="latex", 
      include.rownames = T, 
      floating = FALSE,
      sanitize.text.function = identity,
      file=latex_percent_species)
}

pmf_contributions_latex <- function(path,sigla,colors) {
  
  #sigla = 'RGsH'
  contributions <- pmf_contributions(path,sigla)

  x = contributions$factor_contribution_conc_units
  x = x[,seq(3,ncol(x))]
  medias = colMeans(x)/sum(colMeans(x))*100
  erros = (colStdevs(x)/sqrt(nrow(x)))/sum(colMeans(x))*100
  contribution2latex = cbind(Contribuição=medias,Incerteza=erros)
  contribution2latex = round(contribution2latex,2)
  
  latex_contribution = paste('../../outputs/',sigla,'_contribution.tex',sep='')
  print(xtable(contribution2latex), 
        type="latex", 
        include.rownames = T, 
        floating = FALSE,
        sanitize.text.function = identity,
        file=latex_contribution)

  # Plotar contributions
  # factor_contribution = contributions$factor_contribution
  # plot(factor_contribution$`Factor 1`)
  # Incluir gráficos com elementos no fator
 
  # Plota gráfico de pizza, assim como na ide do pmf:  
  pizza_name = paste('../../outputs/',sigla,'_pmf_contribution_pizza','.pdf',sep="")
  #pdf(file=pizza_name,onefile=T, paper='A4r') 
  pdf(file=pizza_name) 
  #tikz( pizza_name )
    pieval<-contribution2latex[,1]
    legenda<-paste(rownames(contribution2latex),' = ',contribution2latex[,1],'(', contribution2latex[,2],') %', sep='')
    porcentagens <- paste(pieval,'%')
    lp<-pie3D(pieval,radius=0.7,labels=porcentagens,explode=0.15,labelrad=1.4,col=colors,labelcex=1)
    par(mar=c(0, 0, 0, 0))
    legend('bottom',  legenda, cex=1.3,fill=colors, horiz=F)  
   
    #pie(pieval, col=colors, labels=porcentagens, cex=0.7)
    #legend('bottom',  legenda, cex=0.5,fill=colors, horiz=F) 
    
  dev.off()
}

### Testes ###
#rm(list=ls())
#setwd("~/remota/repos/mestrado_ifusp/codes/R")
#source("myfunctions/load.R")

#test1 = pmf_diagnostics("../../outputs/pmf/5factors/RFsH_diagnostics.csv")
#test1$Q

#test2 = pmf_contributions("../../outputs/pmf/5factors/RFsH_contributions.csv")
#test2$factor_contribution

#test3 = pmf_profiles("../../outputs/pmf/5factors/RFsH_profiles.csv")
#test3$fp_conc_species

#test4 = pmf_residuals("../../outputs/pmf/5factors/RFsH_residuals.csv")
#test4$residuals

#test5 
# pmf_contributions_latex('RFsH')



