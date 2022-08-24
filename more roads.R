

med_roads <- getbb("Nairobi")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("secondary", "primary")) %>%
  osmdata_sf()


small_roads <- getbb("Nairobi")%>%
  opq()%>%
  add_osm_feature(key = "highway", value = "residential") %>%
  osmdata_sf()

railway <- getbb("Nairobi")%>%
  opq()%>%
  add_osm_feature(key = "railway", value="rail") %>%
  osmdata_sf()

ggplot() +
  (geom_sf(data = med_roads$osm_lines,
          inherit.aes = FALSE,
          color = "black") +
  
  geom_sf(data = small_roads$osm_lines,
          inherit.aes = FALSE,
          color = "grey")+

  geom_sf(data = railway$osm_lines,
          inherit.aes = FALSE,
          color = "red"
          )+
    theme_void())

