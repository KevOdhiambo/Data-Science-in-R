
library(tidyverse)
library(osmdata) # package for working with streets
library(showtext) # for custom fonts
library(ggmap)
library(rvest)


  get_streets <- getbb("Nairobi")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                    value = c("primary", "secondary")) %>%
  osmdata_sf()
  
get_streets

View(get_streets[["osm_lines"]])
  
font_add_google(name = "Lato", family = "lato") # add custom fonts
showtext_auto()

ggplot() +
  geom_sf(data = get_streets$osm_lines,
            inherit.aes = FALSE,
            color = "black")


