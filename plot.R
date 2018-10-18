
library('ggmap')
usa <- map_data("state")
census_arrests1$stateName <- tolower(census_arrests1$stateName)

# Step B 
# Step 3 Creating a color coded map based on the area of the state 
 mapsimple <- ggplot(census_arrests1, aes(map_id = stateName))   
 mapsimple <- mapsimple + geom_map(map = usa, fill = "white", color = "black")  
 mapsimple <- mapsimple + expand_limits(x = usa$long, y = usa$lat)
 mapsimple

 mapsimple + geom_map(map = usa,aes(fill=state.area))+ggtitle("Area map")

 mapcolorpop <- ggplot(census_arrests1,aes(map_id = stateName))
 mapcolorpop <- mapcolorpop+  geom_map(map = usa,aes(fill=population))
 mapcolorpop <- mapcolorpop + expand_limits(x = usa$long, y = usa$lat) 
 mapcolorpop <- mapcolorpop+ coord_map() +
        ggtitle("State population")
 mapcolorpop 
 
 # Step C
 # Step 4 Color map based on the murder rate in each state 
 mapcolorpop <- ggplot(census_arrests1,aes(map_id = stateName))
 mapcolorpop <- mapcolorpop+  geom_map(map = usa,aes(fill=Murder))
 mapcolorpop <- mapcolorpop + expand_limits(x = usa$long, y = usa$lat) 
 mapcolorpop <- mapcolorpop+ coord_map() +
   ggtitle("Murder Rate")
 mapcolorpop 
 
 
 # Step 5 Color map based on the murder rate with population size in each state
 mapmurder <- mapcolorpop+ geom_point(x = census_arrests1$x, y = census_arrests1$y,aes(size = census_arrests1$population))+ggtitle("Murder rate with population size map")
 mapmurder
 
 
  library("ggmap")

   nrow(census_arrests1)
 # Step D    
 # Step 6 Color coded map for  north eastern states with murder rate and population size
   latlongg <- geocode(source= "dsk", "nyc,new york, ny")
   latlongg
   
   mapsimple <- mapcolorpop  + xlim(-84,-64)+ ylim(30,50)
   mapcombine  <- mapmurder  + xlim(-84,-64)+ ylim(30,50)
   
   mapsimple 
   mapcombine
   
 
