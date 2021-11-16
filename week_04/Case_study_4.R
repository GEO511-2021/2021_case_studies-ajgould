#load packages
library(tidyverse)
library(dplyr)
library(nycflights13)

#explore data
nycflights13::flights
?flights
View(flights)
view(airports)
view(planes)
view(airlines)

#arrange
flights %>%
  arrange(desc(distance)) %>%
  slice(1) %>% 
  # slice_max(distance, n=1) %>%
  left_join(airports,c("dest" = "faa")) %>%
  select(name) %>% 
  pull(name)


t1 <-flights %>% 
  select(flight, tailnum, origin, dest, distance) %>% 
  unique() %>% 
  arrange(desc(distance)) %>% 
  slice(1) %>% 
  left_join(., airports, c("dest" = "faa")) %>% 
  pull(name)

#Answer
#"Honolulu Intl"

#convert data frame to single character value and rename
farthest_airport <- as.character(t1)


#what is the full name (not just the letter code) of the destination airport furthest from any nyc airtports?
#arrange(flights, name, distance, dest)

