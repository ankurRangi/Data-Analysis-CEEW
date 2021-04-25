

refinery_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Refinery_plot.csv")
flows <- gcIntermediate(refinery_data[,4:5], refinery_data[,6:7], sp = TRUE, addStartEnd = TRUE)

flows$Exports <- refinery_data$Exports

flows$origins <- refinery_data$c.loc.

flows$destinations <- refinery_data$country_code



library(leaflet)
library(RColorBrewer)

hover <- paste0(flows$origins, " to ", 
                flows$destinations, ': ', 
                as.character(flows$Exports))


pal <- colorFactor(brewer.pal(4, 'Set2'), flows$origins)

leaflet() %>%
  addProviderTiles('CartoDB.Positron') %>%
  addPolylines(data = flows, weight = ~3, label = hover, opacity = 0.5,
               group = ~origins, color = ~pal(origins)) %>%
  addLayersControl(overlayGroups = unique(flows$origins), 
                   options = layersControlOptions(collapsed = FALSE))
