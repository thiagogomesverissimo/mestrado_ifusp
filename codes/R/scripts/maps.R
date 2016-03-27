#rm(list=ls())
source("myfunctions/load.R")

pontos = read.csv('../../inputs/geocode_nima.csv')
pontos = pontos[,1:3]

# site para pegar box http://nominatim.openstreetmap.org/
# onde o viewbox: left/bottom e right/top em lat lon
# mouse position: lat lon

# na biblioteca ggmap: left/bottom e right/top em lon,lat
location = c(-0.40649,5.51074,0.07759,5.74991)
#location = c(-0.31345,5.51347,-0.07141,5.63307)
#location = c(-0.47035,5.42598,0.01373,5.66518)
#location = c(-0.82672,5.27968,0.14145,5.75811)
#location = c(-1.57104,4.99245,0.36530,5.94936)

# Fetch the map
accra = get_map(location = location, source = "osm",filename = '/tmp/accra')

pdf('../../outputs/accra_sources.pdf')
# Draw the map
accraMap = ggmap(accra)

# Add the points layer
accraMap = accraMap + geom_point(data = pontos, aes(x = longitude, y = latitude), size = 2)

# Add the labels
accraMap + geom_text(data = pontos, aes(label = name, x = longitude+.001, y = latitude), hjust = -0.15)

dev.off()
#map <- get_map(location = "accra",source='osm',  zoom = 6)
#ggmap(map)


