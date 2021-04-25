
SGP_flow_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Flow_Map_Data_FINAL.csv")

head(SGP_flow_data)
names(SGP_flow_data)[names(SGP_flow_data) == "X"] <- "Sr No"

SGP_flow_data$SGP_Production <- SGP_flow_data$SGP_Production/1000
SGP_flow_data$SGP_Consumption <- SGP_flow_data$SGP_Consumption/1000

SGP_flow_data$Imports.ASEAN. <- SGP_flow_data$Imports.ASEAN./1000000000
SGP_flow_data$SGP_Exports <- SGP_flow_data$SGP_Exports/1000000000

#For USA
plot_us <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Plot_US.csv")


#________________________________________________________________________


setwd("D:/CEEW/Data/SGP_WLD/TB/")
cl <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Country_Locations.csv")
gulflist <- c("BH", "KW", "OM", "QA", "SA", "AE")
otherList <- c("US",
             "PE",#PERU
             "CL",#CHILE
             "CR",#COSTA RICA
             "PA",#PANAMA
             "NZ",#NEW EALAND
             "AU",#AUSTRILA
             "JP",#JAPAN
             "KR",#KOREA
             "CN",#CHINA
             "IN",#INDIA
             "CH",#SWISS
             "AT",#AUSTRIA
             "NO",#NORWAY
             "IS",#ICELAND
             "JO")

sgp_location <- subset(cl, cl$country_code == "SG", 
                       select = c("country_code", "longitude", "latitude"))

Countries_location_gulf <- subset(cl, cl$country_code %in% gulflist, 
                         select = c("country_code", "longitude", "latitude"))


Countries_location <- subset(cl, cl$country_code %in% otherList, 
                         select = c("country_code", "longitude", "latitude"))
loc <- c()
lon <- c()
lat <- c()
for(i in 1:19){

  loc[i] <- toString(sgp_location$country_code[1])
  lon[i] <- sgp_location$longitude[1]
  lat[i] <- sgp_location$latitude[1]
}
sgp_location <- c()
sgp_location <- data.frame(c(loc), c(lon), c(lat))


Countries_location <- merge(Countries_location, sgp_location)
Countries_location <- Countries_location[-17:-256,]
Countries_location <- Countries_location[, c(4,1,5,6,2,3)]

Countries_location_gulf <- merge(Countries_location_gulf, sgp_location)
Countries_location_gulf <- Countries_location_gulf[-7:-36,]
Countries_location_gulf <- Countries_location_gulf[, c(4,1,5,6,2,3)]
#___________________________________________________________________________


library(geosphere)

plot_us$longitude.x <- as.numeric(plot_us$longitude.x)
plot_us$latitude.x <- as.numeric(plot_us$latitude.x)


plot_us$longitude.y <- as.numeric(plot_us$longitude.y)
plot_us$latitude.y <- as.numeric(plot_us$latitude.y)
View(plot_us[,4:5])
plot_us <- plot_us[,c(1,2,3,5,4,7,6)]

flows <- gcIntermediate(plot_us[,4:5], plot_us[,6:7], sp = TRUE, addStartEnd = TRUE)

flows$Exports <- plot_us$SGP_Exports

flows$origins <- plot_us$country_code.x

flows$destinations <- plot_us$country_code.y

w <- sum(plot_us$SGP_Exports)


library(leaflet)
library(RColorBrewer)

hover <- paste0(flows$origins, " to ", 
                flows$destinations, ': ', 
                as.character(flows$Exports))


pal <- colorFactor(brewer.pal(4, 'Set2'), flows$origins)

leaflet() %>%
  addProviderTiles('CartoDB.Positron') %>%
  addPolylines(data = flows, weight = 5, label = hover, opacity = 0.5,
               group = ~origins, color = ~pal(origins)) %>%
  addLayersControl(overlayGroups = unique(flows$origins), 
                   options = layersControlOptions(collapsed = FALSE))



write.csv(Countries_location, "D:/CEEW/Data/SGP_WLD/TB/Refinery_plot.csv")
