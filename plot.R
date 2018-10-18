
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

