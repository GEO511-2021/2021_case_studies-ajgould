
  #loadpackages 
library(spData)
library(sf)
library(tidyverse)

# library(units) #this one is optional, but can help with unit conversions.

#load 'world' data from spData package
data(world)  

# load 'states' boundaries from spData package
data(us_states)

#plot if desired
plot(world[1]) 


#plot if desired
plot(us_states[1])

#Canada object 
canada_buffer <- world %>%
  st_transform(crs ="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs") %>%
  filter(name_long == "Canada") %>%
  st_buffer(dist = 10000)

#NY Object 
NY <- us_states %>%
  st_transform(crs ="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs") %>%
  filter(NAME == "New York")

Border_Object <- st_intersection(canada_buffer, NY) 

#plot it
ggplot() +
  geom_sf(data = NY) +
  geom_sf(data = Border_Object, fill = "green")

#plot it
library(tmap)
tm_shape(NY) +
  tm_borders() +
  tm_shape(Border_Object) +
  tm_polygons(col = "green")

#find area 
  