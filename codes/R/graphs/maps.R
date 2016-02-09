rm(list=ls())
source("myfunctions/load.R")
map <- openmap(c(5.613026,-0.302148),
               c(5.538320,-0.083314))

type.map=c("osm", "osm-bw", "maptoolkit-topo", "waze", "mapquest",
           "mapquest-aerial", "bing", "stamen-toner", "stamen-terrain",
           "stamen-watercolor", "osm-german", "osm-wanderreitkarte", "mapbox", "esri",
           "esri-topo", "nps", "apple-iphoto", "skobbler", "cloudmade-", "hillshade",
           "opencyclemap", "osm-transport", "osm-public-transport", "osm-bbike",
           "osm-bbike-german")

#plot(map,raster=F,type=osm)
plot(map)

plot(xyb[ind,],add=TRUE,col="blue",lwd=2,pch=19)


require("OpenStreetMap")
library(sp)

## Select the bounding box of the map from the upper left corner to the lower
# right corner
## Then select the type of map, from one of those:

type.map=c("osm", "osm-bw", "maptoolkit-topo", "waze", "mapquest",
           "mapquest-aerial", "bing", "stamen-toner", "stamen-terrain",
           "stamen-watercolor", "osm-german", "osm-wanderreitkarte", "mapbox", "esri",
           "esri-topo", "nps", "apple-iphoto", "skobbler", "cloudmade-", "hillshade",
           "opencyclemap", "osm-transport", "osm-public-transport", "osm-bbike",
           "osm-bbike-german")

map=openmap(c(43.611522,1.428533), c(43.598903,1.461059),type=type.map[1])

## Locate the main places of the conference
xy.1=c(1.431892,43.609747)
xy.2=c(1.443877,43.604436)
xy.3=c(1.455493,43.610231)
xy.4=c(1.442447,43.600927)
xy.5=c(1.440507,43.610111)
xy.6=c(1.444758,43.604443)
xy.7=c(1.449647,43.606678)
# Create a spatial object and define the coordinate reference system
xy=rbind(xy.1,xy.2,xy.3,xy.4,xy.5,xy.6,xy.7)
xya=SpatialPoints(xy)
proj4string(xya)=CRS("+proj=longlat +ellps=WGS84")
xyb=spTransform(xya,CRS("+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0
                        +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs"))

## Plot the map and the points
plot(map,raster=TRUE)
plot(xyb[1,],add=TRUE,col="darkred",lwd=4)
plot(xyb[2:7],add=TRUE,col="darkred",lwd=2)

## Add text
xy=coordinates(xyb)
names.xy=c("ESC Toulouse \n (lieu de la conférence)",
           "Mairie de Toulouse \n Salle des illustres, \n entrée par la cour Henri IV
           (réception le lundi)",
"Médiathèque José-Cabanis \n Espaces Vanel \n (repas de gala le mercredi)",
"Librairie Mona Lisait \n Rencontre avec Guy Limone \n (jeudi 30 mai)",
"Café chez ta mère \n Rencontre des jeunes statisticiens
(café de la statistique le jeudi)",
"Donjon du Capitole \n Départ de la visite de Toulouse \n(mercredi 28 mai)",
"Place d'Arménie \n(retour des visites \n du mercredi)")
text(xy[1,1],xy[1,2],names.xy[1],adj=1,pos=3,lwd=1.5)
text(xy[2,1],xy[2,2],names.xy[2],adj=1,pos=2,lwd=1.5)
text(xy[3,1],xy[3,2],names.xy[3],adj=1,pos=1,lwd=1.5)
text(xy[4:5,1],xy[4:5,2],names.xy[4:5],adj=1,pos=1,lwd=1.5)
text(xy[6,1]+160,xy[6,2],names.xy[6],adj=1,pos=3,lwd=1.5)
text(xy[7,1],xy[7,2],names.xy[7],adj=1,pos=3,lwd=1.5)


## Not run:
#
#    The following examples
#    plot using native mercator coordinates,
#    transforming the data where needed
#
library(sp)
m <- c(25.7738889,-80.1938889)
j <- c(58.3019444,-134.4197222)
miami <- projectMercator(25.7738889,-80.1938889)
jun <- projectMercator(58.3019444,-134.4197222)
data(states)
map <- openmap(j,m,4,type="stamen-terrain")
plot(map,removeMargin=FALSE)
plot(states,add=TRUE)

data(LA_places)
longBeachHarbor <- openmap(c(33.760525217369974,-118.22052955627441),
                           c(33.73290566922855,-118.17521095275879),14,'bing')
coords <- coordinates(LA_places)
x <- coords[,1]
y <- coords[,2]
txt <- slot(LA_places,"data")[,'NAME']
plot(longBeachHarbor)
points(x,y,col="red")
text(x,y,txt,col="white",adj=0)

if(require(UScensus2010)){
  #install with: install.tract("linux")
  if(require(UScensus2010tract)){
    lat <- c(43.834526782236814,30.334953881988564)
    lon <- c(-131.0888671875  ,-107.8857421875)
    southwest <- openmap(c(lat[1],lon[1]),c(lat[2],lon[2]),5,'osm')
    data(california.tract10)
    cali <- spTransform(california.tract10,osm())
    
    plot(southwest)
    plot(cali,add=TRUE)
  }
}

#
#    The same plot using apple's maps and long-lat coordinates,
#   transforming the raster map.
#
if(require(UScensus2010)){
  #install with: install.tract("linux")
  if(require(UScensus2010tract)){
    lat <- c(43.834526782236814,30.334953881988564)
    lon <- c(-131.0888671875  ,-107.8857421875)
    southwest <- openmap(c(lat[1],lon[1]),
                         c(lat[2],lon[2]),5,"apple-iphoto")
    southwest_longlat <- openproj(southwest)
    data(california.tract10)
    plot(southwest_longlat)
    plot(california.tract10,add=TRUE)
  }
}
## End(Not run)

