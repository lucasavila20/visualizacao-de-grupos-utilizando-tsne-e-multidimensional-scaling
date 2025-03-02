library(ggmap)
library(maps)
library(png)
data(eurodist)
base <- eurodist %>% as.matrix()

dist_matrix <- as.matrix(eurodist)
set.seed(1)





cities <- c("Athens", "Barcelona", "Brussels", "Calais", "Cherbourg", 
            "Cologne", "Copenhagen", "Geneva", "Gibraltar", "Hamburg",
            "Lisbon", "Lyons", "Madrid", "Marseilles", "Milan",
            "Munich", "Paris", "Rome", "Stockholm", "Vienna")

latitudes <- c(37.9838, 41.3851, 50.8503, 50.9513, 49.6394,
               50.9375, 55.6761, 46.2044, 36.1408, 53.5511,
               38.7167, 45.7640, 40.4168, 43.2965, 45.4642,
               48.1351, 48.8566, 41.9028, 59.3293, 48.2082)

longitudes <- c(23.7275, 2.1734, 4.3517, 1.8587, -1.6216,
                6.9603, 12.5683, 6.1432, -5.3536, 9.9937,
                -9.1393, 4.8357, -3.7038, 5.3698, 9.1900,
                11.5820, 2.3522, 12.4964, 18.0686, 16.3738)

# Criar um data frame das coordenadas
city_coords <- data.frame(City = cities, Latitude = latitudes, Longitude = longitudes)


europe_map <- map_data("world", region = c("Greece", "Spain", "Belgium", "France", 
                                           "Germany", "Denmark", "Switzerland", "Gibraltar", 
                                           "Portugal", "Italy", "Sweden", "Austria"))

# Plotar o mapa e os pontos t-SNE
mapa_cidades <- ggplot() +
  geom_map(data = europe_map, map = europe_map,
           aes(map_id = region, x = long, y = lat), 
           fill = "white", color = "black", size = 0.2) +
  geom_point(data = city_coords, aes(x = Longitude, y = Latitude), color = "red", size = 3) +
  geom_text(data = city_coords, aes(x = Longitude, y = Latitude, label = City), 
            vjust = -0.5, hjust = 0.5, size = 3) +
  labs(title = "t-SNE Points Overlaid on Actual Map", x = "Longitude", y = "Latitude") +
  theme_minimal() + labs(title = NULL, x = NULL, y = NULL)+
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank()
  )



mapa_cidades

ggsave("mapareal.png")
