Indclass <- c("Animal products",
"Vegetable products",
"Animal or vegetable oils",
"Food and beverages",
"Refinery",
"Chemicals and petrochemicals",
"Plastic and rubber",
"Leather products",
"Wood products",
"Pulp and paper",
"Textiles",
"Footwear",
"Non-metallic minerals",
"Precious stones",
"Metal products",
"Electrical Machinery",
"Transport Machinery",
"Other Machinery",
"Misc")


Class_plot <- read.csv("D:/CEEW/Data/SGP_WLD/TB/electrical_plot.csv")
ana <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Flow_Map_Data_FINAL.csv")
View(SGP_WLD)
  
  
  
library(geosphere)

flows <- gcIntermediate(Class_plot[,4:5], Class_plot[,6:7], sp = TRUE, addStartEnd = TRUE)

flows$Exports <- Class_plot$Exports

flows$origins <- Class_plot$c.loc.

flows$destinations <- Class_plot$country_code



library(leaflet)
library(RColorBrewer)

hover <- paste0(flows$origins, " to ", 
                flows$destinations, ': ', 
                as.character(flows$Exports))
weight <- c()
for(i in 1:NROW(Class_plot)){
  if(Class_plot$Exports[i] < 1 ){
    weight[i] <- 2.0
  }else {
    weight[i] <- Class_plot$Exports[i]
  }
  
}


pal <- colorFactor(brewer.pal(4, 'Set2'), flows$origins)
col=rep(rainbow(3,alpha=NULL),times=c(20,40,40))
col2 <- c("darkaquamarine", "bisque2", "darkbrown", "cyan2", "cornsilk3", "cornsilk4", "darkolivegreen3", "dodgerblue1",
          "darkorchid1", "greenyellow","darksalmon", "goldenrod1","deeppink1", "gray","lawngreen", "darkorange", 
          "lightsalmon2")
leaflet() %>%
  addProviderTiles('CartoDB.Positron') %>%
  addPolylines(data = flows, weight = ~weight, label = hover, opacity = 0.3,
               group = ~destinations, color = ~col) %>%
  addLayersControl(overlayGroups = unique(flows$destinations), 
                   options = layersControlOptions(collapsed = FALSE))



write.csv(Countries_location, "D:/CEEW/Data/SGP_WLD/TB/Electrical_plot.csv")
