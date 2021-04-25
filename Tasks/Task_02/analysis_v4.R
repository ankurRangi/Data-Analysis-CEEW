flow_map_data <- read.csv("D:/CEEW/Data/SGP_WLD/TB/Prod_Consum_Imports.csv")

SGP_WLD_2016 <- subset(SGP_WLD, SGP_WLD$year == 2016)
SGP_WLD_2016$export_value <- gsub(",","",SGP_WLD_2016$export_value)

SGP_WLD_2016$export_value[is.na(SGP_WLD_2016$export_value)] <- 0

for( i in 1:NROW(IndClass)){
  
  temp <- as.numeric(as.character(SGP_WLD_2016$export_value[SGP_WLD_2016$trade == IndClass[i] & 
                                                              SGP_WLD_2016$partner_code %in% exp_FTA_gulf]))
  
  gulf_exp[i] <- sum(temp, na.rm = TRUE)
  colnaam[i] <- "GCC (Gulf)"
}
View(flow_map_data)
flow_map_data$partner_name <- colnaam
flow_map_data$Export <- gulf_exp

names(flow_map_data)[names(flow_map_data) == "c.IndClass."] <- "Industry_Class"
names(flow_map_data)[names(flow_map_data) == "Export"] <- "SGP_Exports"
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
    temp <- as.numeric(as.character(SGP_WLD_2016$export_value[SGP_WLD_2016$trade_code == IndClass[j] &
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

