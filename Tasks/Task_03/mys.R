

MYS_WLD <- read.csv("D:/CEEW/Data/MYS_WLD.csv")
mys_wld_2017 <- subset(MYS_WLD, year == 2017)
mw7 <- subset(MYS_WLD, year == 2017)
write.csv(mw7, "D:/CEEW/Data/Analysis/MYS_WLD_2017_.csv", row.names = TRUE)

ores_concentration <- c(2603)
copper_scrap <- c(7404)
copper_intermediate <- c(7401, 7402, 7403, 7405, 7406, 7407)
copper_products <- c(7408, 7809, 7410, 7411, 7412, 7413, 7415, 7418, 7419)

#mys_wld_2017$HScode <- as.numeric(mys_wld_2017$hs_product_code)/100
HScode <- c()
for(i in 1:NROW(mys_wld_2017)){
  HScode[i] <-  floor(as.numeric(toString(mys_wld_2017$hs_product_code[i]))/100)
}
mys_wld_2017$HScode <- HScode

cat = c()
for(i in 1:NROW(mys_wld_2017)){
  if(mys_wld_2017$HScode[i] %in% ores_concentration){
    cat[i] = "Copper Ores & concentration"
  }else if(mys_wld_2017$HScode[i] %in% copper_scrap){
    cat[i] = "Copper Scrap"
  }else if(mys_wld_2017$HScode[i] %in% copper_intermediate){
    cat[i] = "Copper Intermediate"
  }else if(mys_wld_2017$HScode[i] %in% copper_products){
    cat[i] = "Copper Products"
  }else{
    cat[i] = "Other"
  }
  print(i)
}

mys_wld_2017$Copper_Category <- cat 
write.csv(mys_wld_2017, "D:/CEEW/Data/Analysis/MYS_WLD_2017_copper.csv", row.names = TRUE)



SGP_WLD <- read.csv("D:/CEEW/Data/_WLD/SGP_WLD.csv")
SGP_WLD <- subset(SGP_WLD, year == 2017)

SGP_WLD$hs_product_code <- gsub(",","",SGP_WLD$hs_product_code)
HScode <- c()
for(i in 1:NROW(SGP_WLD)){
  HScode[i] <-  floor(as.numeric(toString(SGP_WLD$hs_product_code[i]))/100)
}


SGP_WLD$HSCode <- HScode
#Sgp_wld_72 <- subset(SGP_WLD, HSCode == 72)

irst_ores <- c(7201)
irst_scrap <- c(7204)
irst_intermediate <- c(7203, 7205, 7206, 7207, 7218, 7224)
irst_product <- c(7208, 7209, 7210, 7211, 7212, 7213, 7214, 7215, 7216, 7217, 7219, 7220, 7221, 7222, 
                  7223, 7225, 7226, 7227, 7228, 7229)

cat = c()
for(i in 1:NROW(SGP_WLD)){
  if(SGP_WLD$HSCode[i] %in% irst_ores){
    cat[i] = "IS Ores & concentration"
  }else if(SGP_WLD$HSCode[i] %in% irst_scrap){
    cat[i] = "IS Scrap"
  }else if(SGP_WLD$HSCode[i] %in% irst_intermediate){
    cat[i] = "IS Intermediate"
  }else if(SGP_WLD$HSCode[i] %in% irst_product){
    cat[i] = "IS Products"
  }else{
    cat[i] = "Other"
  }
  print(i)
}
SGP_WLD$Category <- cat


write.csv(SGP_WLD, "D:/CEEW/Data/Analysis/SGP_WLD_72_Cat.csv", row.names = TRUE)



ASEAN_WLD <- read.csv("D:/CEEW/Data/_WLD/ASEAN_WLD.csv")
ASEAN_WLD <- subset(ASEAN_WLD, year == 2017)
IDN_WLD <- subset(ASEAN_WLD, location_code == "IDN")
THA_WLD <- subset(ASEAN_WLD, location_code == "THA")

IDN_WLD$hs_product_code <- gsub(",","",IDN_WLD$hs_product_code)
HScode <- c()
for(i in 1:NROW(IDN_WLD)){
  HScode[i] <-  floor(as.numeric(toString(IDN_WLD$hs_product_code[i]))/100)
}
IDN_WLD$HSCode <- HScode

THA_WLD$hs_product_code <- gsub(",","",THA_WLD$hs_product_code)
HScode <- c()
for(i in 1:NROW(THA_WLD)){
  HScode[i] <-  floor(as.numeric(toString(THA_WLD$hs_product_code[i]))/100)
}
THA_WLD$HSCode <- HScode


cat = c()
for(i in 1:NROW(IDN_WLD)){
  if(IDN_WLD$HSCode[i] %in% irst_ores){
    cat[i] = "IS Ores & concentration"
  }else if(IDN_WLD$HSCode[i] %in% irst_scrap){
    cat[i] = "IS Scrap"
  }else if(IDN_WLD$HSCode[i] %in% irst_intermediate){
    cat[i] = "IS Intermediate"
  }else if(IDN_WLD$HSCode[i] %in% irst_product){
    cat[i] = "IS Products"
  }else{
    cat[i] = "Other"
  }
  print(i)
}

IDN_WLD$category <- cat

cat = c()
for(i in 1:NROW(THA_WLD)){
  if(THA_WLD$HSCode[i] %in% irst_ores){
    cat[i] = "IS Ores & concentration"
  }else if(THA_WLD$HSCode[i] %in% irst_scrap){
    cat[i] = "IS Scrap"
  }else if(THA_WLD$HSCode[i] %in% irst_intermediate){
    cat[i] = "IS Intermediate"
  }else if(THA_WLD$HSCode[i] %in% irst_product){
    cat[i] = "IS Products"
  }else{
    cat[i] = "Other"
  }
  print(i)
}

THA_WLD$category <- cat

write.csv(IDN_WLD, "D:/CEEW/Data/Analysis/IDN_WLD_72_Cat.csv", row.names = TRUE)
write.csv(THA_WLD, "D:/CEEW/Data/Analysis/THA_WLD_72_Cat.csv", row.names = TRUE)
