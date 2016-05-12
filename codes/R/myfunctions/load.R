# General packages used in my project. 
# I lost some performance working in this way, however I am more organized.

set.seed(69)

# Eu quero que todos os retornos de funções sejam em English, pois eu uso isso na programação. 
# sessionInfo()
# Sys.getlocale() 
# dpkg-reconfigure locales
Sys.setlocale("LC_MESSAGES", 'en_US.UTF-8')
Sys.setenv(LANG = "en_US.UTF-8")
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Variáveis globais:
debug = FALSE

load<-function()
{  
  source('myfunctions/third_libraries.R')

  #Load the functions created for this project
  source("myfunctions/TrataID.R")
  source("myfunctions/na2media.R")
  source("myfunctions/na2LD.R")
  source("myfunctions/DetectionLimit.R")
  source("myfunctions/subElement.R")
  source("myfunctions/duplicates.R")
  source("myfunctions/windFrequency.R")
  source("myfunctions/pmf.R")
  source("myfunctions/FactorAnalysis.R")
  source("myfunctions/getSeason.R")
  source("myfunctions/edxCalibration.R")
  source("myfunctions/descriptive.R")
  source("myfunctions/general.R")
}

# Call the load function
load()
