
temp <- c()
consumption_2016 <- read.csv("D:/CEEW/Data/SGP_WLD/TB/TB - Domestic Consumption of Singapore 4Jun20.csv")
SGP_WLD <- read.csv("D:/CEEW/Data/SGP_WLD.csv")

asean <- c("THA", "MYS", "IDN", "PHL", "VNM", "LAO", "KHM", "BRN", "MMR")
SGP_ASEAN <- subset(SGP_WLD, partner_code %in% asean)

IndClass <- c("Animal products",
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

SGP_ASEAN_2016 <- subset(SGP_ASEAN, year == 2016)

for(i in 1:NROW(IndClass)){

  temp <- as.numeric(as.character(SGP_ASEAN_2016$import_value[SGP_ASEAN_2016$trade_code == IndClass[i]]))
  asean_imports[i] <- sum(temp, na.rm = TRUE)    
  print(temp)
}

df_imports <- data.frame(c(IndClass), c(asean_imports))
View(df_imports)
#_______________________________________________________________________

production_value <- read.csv("D:/CEEW/Data/SGP_WLD/Analysis_SGP_WLD.csv")
#production_value<- production_value[,-3:-8]

prod_USD <- c()

production_value$Manufacturing_Output_2016 <- gsub(",","",production_value$Manufacturing_Output_2016)

for(i in 1:NROW(production_value)) {
  temp <- as.numeric(as.character(production_value$Manufacturing_Output_2016[i]))/1.45
  prod_USD[i] <- temp
  
  
}
View(prod_USD)
production_value$Manufacturing_Output_2016_USD <- prod_USD


arrang <- c()
for(i in 1:NROW(IndClass)){
  arrang[i] <- production_value$Manufacturing_Output_2016_USD[production_value$Industry_Class == IndClass[i]]
}

prd <- data.frame(c(IndClass), c(arrang))
#__________________________________________________________


consum_USD <- c()

for(i in 1:NROW(IndClass)){
  temp <- as.numeric(as.character(consumption_2016$Apparent.Consumption.USD.[consumption_2016$Industry_class == IndClass[i]]))
  
  consum_USD[i] <- sum(temp)
}

View(consum_USD)


flow_map_data <- data.frame(c(IndClass), c(prd$c.arrang.), c(consum_USD), c(df_imports$c.asean_imports.))
View(flow_map_data)
names(flow_map_data)[names(flow_map_data) == "c.IndClass."] <- "Industry_Class"
names(flow_map_data)[names(flow_map_data) == "c.prd.c.arrang.."] <- "SGP_Production"
names(flow_map_data)[names(flow_map_data) == "c.consum_USD."] <- "SGP_Consumption"
names(flow_map_data)[names(flow_map_data) == "c.df_imports.c.asean_imports.."] <- "Imports(ASEAN)"


#LKA
#TUR
#HKG
#ARE

exp_FTA_gulf <- c("BHR", "KWT", "OMN", "QAT", "SAU", "ARE")
exp_FTA <- c("USA",
             "PER",#PERU
             "CHL",#CHILE
             "CRI",#COSTA RICA
             "PAN",#PANAMA
             "NZL",#NEW EALAND
             "AUS",#AUSTRILA
             "JPN",#JAPAN
             "KOR",#KOREA
             "CHN",#CHINA
             "IND",#INDIA
             "CHE",#SWISS
             "AUT",#AUSTRIA
             "NOR",#NORWAY
             "ISL",#ICELAND
             "JOR" )#JORDAN

write.csv(flow_map_data, "D:/CEEW/Data/SGP_WLD/TB/Prod_Consum_Imports.csv", row.names = TRUE)
View(temp)
View(IndClass)
gulf_exp <- c()
colnaam <- c()

flow_map_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Prod_Consum_Imports.csv")

SGP_WLD_2016 <- subset(SGP_WLD, SGP_WLD$year == 2016)
SGP_WLD_2016$export_value <- gsub(",","",SGP_WLD_2016$export_value)

SGP_WLD_2016$export_value[is.na(SGP_WLD_2016$export_value)] <- 0

for( i in 1:NROW(IndClass)){
  
  temp <- as.numeric(as.character(SGP_WLD_2016$export_value[SGP_WLD_2016$trade_code == IndClass[5] & 
                                                         SGP_WLD$partner_code %in% exp_FTA_gulf]))
  View(temp)
  gulf_exp[i] <- sum(temp, na.rm = TRUE)
  colnaam[i] <- "GCC (Gulf)"
}
View(flow_map_data)
flow_map_data$partner_name <- colnaam
flow_map_data$Export <- gulf_exp

names(flow_map_data)[names(flow_map_data) == "c.IndClass."] <- "Industry_Class"
names(flow_map_data)[names(flow_map_data) == "Exports"] <- "SGP_Exports"
write.csv(flow_map_data, "D:/CEEW/Data/SGP_WLD/TB/Flow_Map_Data_GCC (GULF).csv", row.names = TRUE)
flow_map_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Flow_Map_Data_GCC (GULF).csv")

fta_exp <- c()
print(length(exp_FTA))
flow_map_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Prod_Consum_Imports.csv")
Final <- c()
for(i in 1:length(exp_FTA)){
  loop_flow_map_data <- flow_map_data 
  colnaam <- c()
  for( j in 1:NROW(IndClass)){
    temp <- as.numeric(as.character(SGP_WLD_2016$export_value[SGP_WLD_2016$Industry_Class == IndClass[j] &
                                                           SGP_WLD_2016$partner_code == exp_FTA[i]]))
    fta_exp[j] <- sum(temp, na.rm = TRUE)
    colnaam[j] <- exp_FTA[i] 
    
  }
  #View(fta_exp)
  loop_flow_map_data$partner_name <- colnaam
  loop_flow_map_data$Export <- fta_exp
  #View(loop_flow_map_data)
  naam <- toString(exp_FTA[i])
  write.csv(loop_flow_map_data, file = 
              paste0("D:/CEEW/Data/SGP_WLD/TB/","Flow_Map_Data_",naam, 
                     ".csv"), row.names = TRUE)
  
  
  Final <- rbind(Final, loop_flow_map_data)
  
}
View(Final)
write.csv(Final, "D:/CEEW/Data/SGP_WLD/TB/Flow_Map_Data_FINAL.csv", row.names = TRUE)

Final <- rbind(Final, flow_map_data)
names(Final)[names(Final) == "Imports.ASEAN."] <- "Imports(ASEAN)"
names(Final)[names(Final) == "Export"] <- "SGP_Exports"

