

subElement<-function(Zs)
  {
    #table of periodic table informations
    periodicTable<-read.csv("../../inputs/constants/periodic_table.csv",header=TRUE)
    elements<-c()
    for(i in Zs)
      {
      Zclean <- substr(i,2,3)
      element = periodicTable[periodicTable$Z==Zclean,2]
      elements<-append(elements,as.character(element))
    }
    return(elements)
  }