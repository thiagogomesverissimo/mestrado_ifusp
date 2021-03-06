rm(list=ls())
source("myfunctions/load.R")
TFsH = read.csv('../../outputs/pmf_fa/RFsH.csv')
mydata = TFsH[,-1]
# Ward Hierarchical Clustering
d <- dist(t(mydata), method = "euclidean") # distance matrix
fit <- hclust(d, method="average")
plot(fit) # display dendogram
groups <- cutree(fit, k=3) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(fit, k=3, border="red") 

