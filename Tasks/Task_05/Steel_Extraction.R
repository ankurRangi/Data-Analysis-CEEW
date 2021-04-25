

library(readxl)

scrap <- c(7204)
crude_steel <- c(7218, 7224)
flat <- c(7208, 7209,  7210, 7211, 7212, 7219, 7220, 7225, 7226)
long <- c(7213, 7214, 7215, 7221, 7222,  7227, 7228)
other <- c(7216, 7217, 7223, 7229)


steel_export <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Steel_Export.xlsx", 1)
steel_export[is.na(steel_export)] <- 0
steel_export <- steel_export[, -5]
steel_export <- steel_export[, -6]
steel_export <- steel_export[, -1]

HScode <- floor(as.numeric(as.character(steel_export$HSCode))/10000)
steel_export$Hscode2 <- HScode

steel_export <- subset(steel_export, Hscode2 == 72)

HScode <- floor(as.numeric(as.character(steel_export$HSCode))/100)
steel_export$Hscode2 <- HScode

temp <- c()

for( i in 1:NROW(steel_export)){
  if(steel_export$Hscode2[i] %in% flat){
    temp[i] <- "Flat Products"
  }
  else if(steel_export$Hscode2[i] %in% long){
    temp[i] <- "Long Products"
  }
  else if(steel_export$Hscode2[i] %in% other){
    temp[i] <- "Other Products"
  }
  else if(steel_export$Hscode2[i] %in% scrap){
    temp[i] <- "Scrap"
  }
  else if(steel_export$Hscode2[i] %in% crude_steel){
    temp[i] <- "Crude Steel"
  }
  else{
    temp[i] <- "Otherwise"
  }
}
steel_export$Category <- temp
#_________
exp_quantity <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Steel_Export.xlsx", 2)
exp_quantity[is.na(exp_quantity)] <- 0
exp_quantity <- exp_quantity[, -4]
exp_quantity <- exp_quantity[, -6]
exp_quantity <- exp_quantity[, -1]

HScode_quant <- floor(as.numeric(as.character(exp_quantity$HSCode))/10000)
exp_quantity$Hscode2 <- HScode_quant

exp_quantity <- subset(exp_quantity, Hscode2 == 72)

HScode_quant <- floor(as.numeric(as.character(exp_quantity$HSCode))/100)
exp_quantity$Hscode2 <- HScode_quant

temp <- c()

for( i in 1:NROW(exp_quantity)){
  if(exp_quantity$Hscode2[i] %in% flat){
    temp[i] <- "Flat Products"
  }
  else if(exp_quantity$Hscode2[i] %in% long){
    temp[i] <- "Long Products"
  }
  else if(exp_quantity$Hscode2[i] %in% other){
    temp[i] <- "Other Products"
  }
  else if(exp_quantity$Hscode2[i] %in% scrap){
    temp[i] <- "Scrap"
  }
  else if(exp_quantity$Hscode2[i] %in% crude_steel){
    temp[i] <- "Crude Steel"
  }
  else{
    temp[i] <- "Otherwise"
  }
}
exp_quantity$Category <- temp

#steel_export <- steel_export[, -5]
#exp_quantity <- exp_quantity[, -5]

write.csv(steel_export, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Exports_Value.csv", row.names = TRUE)
write.csv(exp_quantity, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Exports_Quantity.csv", row.names = TRUE)


steel <- merge(steel_export, exp_quantity, by = "HSCode")
write.csv(steel, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Exports_Value & Quantity.csv", row.names = TRUE)
#_________________________________________________________________________________________________________


steel_import <-  read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Steel_Import.xlsx", 1)
steel_import[is.na(steel_import)] <- 0
steel_import <- steel_import[, -5]
steel_import <- steel_import[, -6]
steel_import <- steel_import[, -1]

HScode <- floor(as.numeric(as.character(steel_import$HSCode))/10000)
steel_import$Hscode2 <- HScode

steel_import <- subset(steel_import, Hscode2 == 72)

HScode <- floor(as.numeric(as.character(steel_import$HSCode))/100)
steel_import$Hscode2 <- HScode

temp <- c()

for( i in 1:NROW(steel_import)){
  if(steel_import$Hscode2[i] %in% flat){
    temp[i] <- "Flat Products"
  }
  else if(steel_import$Hscode2[i] %in% long){
    temp[i] <- "Long Products"
  }
  else if(steel_import$Hscode2[i] %in% other){
    temp[i] <- "Other Products"
  }
  else if(steel_import$Hscode2[i] %in% scrap){
    temp[i] <- "Scrap"
  }
  else if(steel_import$Hscode2[i] %in% crude_steel){
    temp[i] <- "Crude Steel"
  }
  else{
    temp[i] <- "Otherwise"
  }
}
steel_import$Category <- temp
#_________
imp_quantity <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Steel_Import.xlsx", 2)
imp_quantity[is.na(imp_quantity)] <- 0
imp_quantity <- imp_quantity[, -6]
imp_quantity <- imp_quantity[, -1]

HScode_quant <- floor(as.numeric(as.character(imp_quantity$HSCode))/10000)
imp_quantity$Hscode2 <- HScode_quant

imp_quantity <- subset(imp_quantity, Hscode2 == 72)

HScode_quant <- floor(as.numeric(as.character(imp_quantity$HSCode))/100)
imp_quantity$Hscode2 <- HScode_quant

temp <- c()

for( i in 1:NROW(imp_quantity)){
  if(imp_quantity$Hscode2[i] %in% flat){
    temp[i] <- "Flat Products"
  }
  else if(imp_quantity$Hscode2[i] %in% long){
    temp[i] <- "Long Products"
  }
  else if(imp_quantity$Hscode2[i] %in% other){
    temp[i] <- "Other Products"
  }
  else if(imp_quantity$Hscode2[i] %in% scrap){
    temp[i] <- "Scrap"
  }
  else if(imp_quantity$Hscode2[i] %in% crude_steel){
    temp[i] <- "Crude Steel"
  }
  else{
    temp[i] <- "Otherwise"
  }
}
imp_quantity$Category <- temp



write.csv(steel_export, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Exports_Value.csv", row.names = TRUE)
write.csv(exp_quantity, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Exports_Quantity.csv", row.names = TRUE)


steel_imp <- merge(steel_import, imp_quantity, by = "HSCode")
write.csv(steel_imp, "D:/CEEW/Data/Analysis/Iron_Steel_india/Total_Imports_Value & Quantity.csv", row.names = TRUE)
