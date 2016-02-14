rm(list=ls())
source("myfunctions/load.R")

library(ggmap)

geo_nima = read.csv('../../inputs/geocode_nima.csv')

stores <- data.frame(name=c("Commercial","Union","Bedford"),
                     longitude=c(-70.25042295455933,-70.26050806045532,-70.27726650238037),
                     latitude=c(43.657471302616806,43.65663299041943,43.66091757424481))
#location = c(-70.2954, 43.64278, -70.2350, 43.68093)
location = c( 5.59948,-0.23316,5.61443,-0.20290)

# Fetch the map
portland = get_map(location = location, source = "osm")

# Draw the map
portlandMap = ggmap(portland)

# Add the points layer
portlandMap = portlandMap + geom_point(data = stores, aes(x = longitude, y = latitude), size = 5)

# Add the labels
portlandMap + geom_text(data = stores, aes(label = name, x = longitude+.001, y = latitude), hjust = 0)

