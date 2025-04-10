# treasure_map.R - Chart a treasure map fer Cap’n Barbossa
# By Captain Jack Sparrow, April 12, 2025

# Load the rigging (libraries)
library(ggplot2)

# Set the sea (coords fer islands and ports)
locations <- data.frame(
  name = c("Tortuga", "Port Royal", "Isla de Muerta", "Treasure X"),
  x = c(-75.5, -76.8, -77.3, -76.0),  # Longitude (ish)
  y = c(20.0, 17.9, 19.5, 18.5),      # Latitude (ish)
  type = c("Port", "Port", "Island", "Treasure")
)

# Plot the course
map <- ggplot(locations, aes(x = x, y = y, color = type)) +
  geom_point(size = 4, shape = 19) +  # Ports and X as dots
  geom_text(aes(label = name), hjust = 0, vjust = 0, nudge_x = 0.1, nudge_y = 0.1) +  # Names
  geom_path(data = locations[1:3, ], aes(group = 1), color = "black", linetype = "dashed") +  # Route
  geom_point(data = locations[4, ], aes(x = x, y = y), shape = 4, size = 8, color = "red") +  # Big red X
  labs(title = "Cap’n Barbossa’s Treasure Map", x = "Longitude", y = "Latitude") +
  theme_minimal() +
  scale_color_manual(values = c("Port" = "blue", "Island" = "green", "Treasure" = "red"))

# Save the map to the log
ggsave("../docs/treasure_map.png", map, width = 8, height = 6)
print("Treasure map charted at SevenVoices/docs/treasure_map.png, Cap’n!")
