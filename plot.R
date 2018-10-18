
library(ggmap)
usa <- map_data("state")
census_arrests1$stateName <- tolower(census_arrests1$stateName)
 mapsimple <- ggplot(census_arrests1, aes(map_id = stateName))   
 mapsimple <- mapsimple + geom_map(map = usa, fill = "white", color = "black")  
 mapsimple <- mapsimple + expand_limits(x = usa$long, y = usa$lat)
 mapsimple

 maparea <- mapsimple + geom_map(map = usa,aes(fill=state.area))+ggtitle("Area map")
 maparea
 
 
  mapcolorpop <- ggplot(census_arrests1,aes(map_id = stateName))
 mapcolorpop <- mapcolorpop+  geom_map(map = usa,aes(fill=Murder))
 mapcolorpop <- mapcolorpop + expand_limits(x = usa$long, y = usa$lat) 
 mapcolorpop <- mapcolorpop+ coord_map() +
   ggtitle("Murder Rate")
 mapcolorpop 

mapmurder <- mapcolorpop+ geom_point(x = census_arrests1$x, y = census_arrests1$y,aes(size = census_arrests1$population))+ggtitle("Murder rate with population size map")
 mapmurder

 latlongg <- geocode(source= "dsk", "nyc,new york, ny")
   latlongg
   
   mapsimplenoreas <- mapcolorpop  + xlim(-84,-64)+ ylim(30,50)
   mapcombine  <- mapmurder  + xlim(-84,-64)+ ylim(30,50)
   
   mapsimplenoreas 
   mapcombine
  
