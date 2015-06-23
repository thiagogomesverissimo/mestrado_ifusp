setwd('~/repos/mymaster_physi../../inputs/pmf/exemplos/anexos/')
d<-read.csv('d.csv',header=F)
plot(d[,1])
require(rgl)
#  open renderer
open3d()
#  plot surface
rgl.surface( 1:19 , 1:19 , d)
#  Export to png
rgl.snapshot( "sample.png" , fmt="png", top=TRUE )

require(rgl)
#  open renderer
open3d()
#  plot surface
rgl.surface( d[,])
#  Export to png
rgl.snapshot( "sample.png" , fmt="png", top=TRUE )