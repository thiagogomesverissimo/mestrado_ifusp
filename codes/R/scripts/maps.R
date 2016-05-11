rm(list=ls())
source("myfunctions/load.R")

pontos = read.csv('../../inputs/geocode_nima.csv')
pontos = pontos[,1:3]
amostragem = pontos[nrow(pontos),]

# site para pegar box http://nominatim.openstreetmap.org/
# onde o viewbox: left/bottom e right/top em lat lon
# mouse position: lat lon

# na biblioteca ggmap: left/bottom e right/top em lon,lat
location_osm = c(-0.40649,5.51074,0.07759,5.74991)
location_google = c(-0.28,5.5,0.09,5.7)

# Fetch the map
#accra = get_map(location = location, source = "osm",filename = '/tmp/accra',zoom = 10)
accra = get_map(location = location_google, source = "google",filename = '/tmp/accra',language = 'pt')

pdf('../../outputs/accra_sources.pdf')
# Draw the map
accraMap = ggmap(accra)

# Add the points layer
accraMap = accraMap + geom_point(data = pontos, aes(x = longitude, y = latitude), size = 4, color = "black")
accraMap = accraMap + geom_point(data = amostragem, aes(x = longitude, y = latitude), size = 4, color = "red")

# Add the labels
accraMap + geom_text(data = pontos, aes(label = name, x = longitude+.001, y = latitude), hjust = -0.15)

dev.off()