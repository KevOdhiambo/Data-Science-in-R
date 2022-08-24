get_roads <- function(city){
  get_streets <- getbb(city)%>%
    opq()%>%
    add_osm_feature(key = "highway", 
                    value = c("primary", "secondary")) %>%
    osmdata_sf()
  
  View(get_streets[["osm_lines"]])
  ggplot() +
    geom_sf(data = get_streets$osm_lines,
            inherit.aes = FALSE,
            color = "black")
  return(city)
}

get_roads('Mombasa')
