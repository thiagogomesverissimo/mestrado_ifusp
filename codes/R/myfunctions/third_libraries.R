install_libraries = function()
{
  dir.create('~/.R', showWarnings = FALSE)
  dir.create('~/.R/libraries', showWarnings = FALSE)
  .libPaths(c('~/.R/libraries',.libPaths()))
  
  suppressPackageStartupMessages(require('GPArotation'))
  suppressPackageStartupMessages(require('psych'))
  suppressPackageStartupMessages(require('MASS'))
  suppressPackageStartupMessages(require('xtable'))
  suppressPackageStartupMessages(require('lattice'))
  suppressPackageStartupMessages(require('nFactors'))
  suppressPackageStartupMessages(require('corrplot'))
  suppressPackageStartupMessages(require('plotrix'))
  suppressPackageStartupMessages(require('fBasics'))
  suppressPackageStartupMessages(require('stringr'))
  suppressPackageStartupMessages(require('devtools'))
  suppressPackageStartupMessages(require('openair'))
  suppressPackageStartupMessages(require('OpenStreetMap'))
  
  # GPArotation
  if (!require("GPArotation")) {
    install.packages("GPArotation", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE)
  }

  # psych
  if (!require("psych")) {
    install.packages("psych", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # MASS
  if (!require("MASS")) {
    install.packages("MASS", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # xtable
  if (!require("xtable")) {
    install.packages("xtable", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # lattice
  if (!require("lattice")) {
    install.packages("lattice", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # nFactors
  if (!require("nFactors")) {
    install.packages("nFactors", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # corrplot
  if (!require("corrplot")) {
    install.packages("corrplot", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # plotrix
  if (!require("plotrix")) {
    install.packages("plotrix", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # fBasics
  if (!require("fBasics")) {
    install.packages("fBasics", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # stringr
  if (!require("stringr")) {
    install.packages("stringr", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }  
  
  # devtools
  if (!require("devtools")) {
    install.packages("devtools", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }
  
  # Rcpp 
  if (!require("Rcpp",lib.loc='~/.R/libraries')) {
    install.packages("Rcpp", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # dplyr 
  if (!require("dplyr",lib.loc='~/.R/libraries')) {
    install.packages("dplyr", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # openair
  if (!require("openair") & require('devtools')) {
    install_github('davidcarslaw/openair')
  }
  
  #  tikzDevice
  #if (!require("tikzDevice",lib.loc='~/.R/libraries')) {
  #  install.packages("tikzDevice", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  #}

  # OpenStreetMap
  if (!require("OpenStreetMap",lib.loc='~/.R/libraries')) {
    install.packages("OpenStreetMap", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }
    
}

install_libraries()
