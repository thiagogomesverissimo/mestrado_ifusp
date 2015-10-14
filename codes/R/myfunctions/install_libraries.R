install_libraries = function()
{
  dir.create('~/.R/libraries', showWarnings = FALSE)
  
  # GPArotation
  if (!require("GPArotation",lib='~/.R/libraries')) {
    install.packages("GPArotation", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # psych
  if (!require("psych",lib='~/.R/libraries')) {
    install.packages("psych", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # MASS
  if (!require("MASS",lib='~/.R/libraries')) {
    install.packages("MASS", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # xtable
  if (!require("xtable",lib='~/.R/libraries')) {
    install.packages("xtable", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # lattice
  if (!require("lattice",lib='~/.R/libraries')) {
    install.packages("lattice", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # nFactors
  if (!require("nFactors",lib='~/.R/libraries')) {
    install.packages("nFactors", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # corrplot
  if (!require("corrplot",lib='~/.R/libraries')) {
    install.packages("corrplot", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # plotrix
  if (!require("plotrix",lib='~/.R/libraries')) {
    install.packages("plotrix", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }

  # fBasics
  if (!require("fBasics",lib='~/.R/libraries')) {
    install.packages("fBasics", repos="http://cran.rstudio.com/",lib="~/.R/libraries") 
  }
}

install_libraries()
