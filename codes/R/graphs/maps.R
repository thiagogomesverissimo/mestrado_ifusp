rm(list=ls())
source("myfunctions/load.R")

pontos = read.csv('../../inputs/geocode_nima.csv')
pontos = pontos[,-4]
location = c(-70.2954, 43.64278, -70.2350, 43.68093)

# site para pegar box http://nominatim.openstreetmap.org/
# viewbox: left/bottom e right/top em lat lon
# mouse position: lat lon

# traffic +5° 34' 54.00", -0° 11' 56.30"
# residential 5° 35' 2.00", -0° 11' 58.80"

# left/bottom e right/top em lon,lat
location = c(-0.40649,5.51074,0.07759,5.74991)

# Fetch the map
accra = get_map(location = location, source = "osm")

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


