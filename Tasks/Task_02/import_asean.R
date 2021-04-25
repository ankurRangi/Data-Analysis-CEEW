#SGP_ASEAN_2016 <- subset(SGP_ASEAN, SGP_ASEAN$year == 2016)

#write.csv(SGP_ASEAN_2016, "D:/CEEW/Data/SGP_WLD/TB/SGP_ASEAN_2016.csv")


impo <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Imports_plot.csv")

library(geosphere)

flows <- gcIntermediate(impo[,4:5], impo[,6:7], sp = TRUE, addStartEnd = TRUE)

flows$Imports <- impo$Imports

flows$origins <- impo$c.loc.

flows$destinations <- impo$country_code



library(leaflet)
library(RColorBrewer)

hover <- paste0(flows$origins, " to ", 
                flows$destinations, ': ', 
                as.character(flows$Imports))
weight <- c()
for(i in 1:NROW(impo)){
  if(impo$Imports[i] < 1 ){
    weight[i] <- 2.0
  }else {
    weight[i] <- impo$Imports[i]
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
               group = ~origins, color = ~col) %>%
  addLayersControl(overlayGroups = unique(flows$origins), 
                   options = layersControlOptions(collapsed = FALSE))
