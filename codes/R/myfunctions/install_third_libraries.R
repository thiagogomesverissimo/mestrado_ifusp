# https://gist.github.com/stevenworthington/3178163
#ipak <- function(pkg){
#  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
#  if (length(new.pkg)) 
#    install.packages(new.pkg, dependencies = TRUE)
#  sapply(pkg, require, character.only = TRUE)
#}

# usage
#packages <- c("ggplot2", "plyr")
#ipak(packages)


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
  suppressPackageStartupMessages(require('ggplot2'))
  suppressPackageStartupMessages(require('ggmap'))
  suppressPackageStartupMessages(require('Hmisc'))
  suppressPackageStartupMessages(require('polynom'))
  suppressPackageStartupMessages(require('lubridate'))
  
  # GPArotation
  if (!require("GPArotation")) {
    install.packages("GPArotation", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE)
  }
  
  # lubridate
  if (!require("lubridate")) {
    install.packages("lubridate", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE)
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
  
  # ggmap
  if (!require("ggmap")) {
    install.packages("ggmap", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
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
  
  # polynom
  if (!require("polynom",lib.loc='~/.R/libraries')) {
    install.packages("polynom", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }
  
  # Hmisc
  if (!require("Hmisc",lib.loc='~/.R/libraries')) {
    install.packages("Hmisc", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # dplyr 
  if (!require("dplyr",lib.loc='~/.R/libraries')) {
    install.packages("dplyr", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }

  # openair
  if (!require("openair") & require('devtools')) {
    install_github('davidcarslaw/openair')
  }
  
  #  OpenStreetMap, depende de: apt-get install libgdal-dev libproj-dev
  #if (!require("OpenStreetMap",lib.loc='~/.R/libraries')) {
  #  install.packages("OpenStreetMap", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  #}
  
  #  sp
  #if (!require("sp",lib.loc='~/.R/libraries')) {
  #  install.packages("sp", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  #}
  
  #  ggplot2
  if (!require("ggplot2",lib.loc='~/.R/libraries')) {
    install.packages("ggplot2", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  }
  
  #  tikzDevice
  #if (!require("tikzDevice",lib.loc='~/.R/libraries')) {
  #  install.packages("tikzDevice", repos="http://cran.rstudio.com/",lib="~/.R/libraries",dependencies=TRUE) 
  #}  
}

install_libraries()
