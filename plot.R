


install.packages("ggmap")
install.packages("ggplot")
usa <- map_data("state")
census_arrests1$stateName <- tolower(census_arrests1$stateName)
 mapsimple <- ggplot(census_arrests1, aes(map_id = stateName))   
 mapsimple <- mapsimple + geom_map(map = usa, fill = "white", color = "black")  
 mapsimple <- mapsimple + expand_limits(x = usa$long, y = usa$lat)
 mapsimple

 maparea <- mapsimple + geom_map(map = usa,aes(fill=state.area))+ggtitle("Area map")
 maparea
