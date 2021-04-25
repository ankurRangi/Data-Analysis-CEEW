
library(readxl)

#imp_ores <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Ores.xlsx", 1)
#imp_scrap <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Scrap.xlsx", 1)

#imp_primary1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Primary.xlsx", 1)
#imp_primary2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Primary.xlsx", 2)
#imp_primary3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Primary.xlsx", 3)
#imp_primary4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Primary.xlsx", 4)
#imp_primary5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Primary.xlsx", 5)

imp_product1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 1)
imp_product2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 2)
imp_product3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 3)
imp_product4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 4)
imp_product5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 5)
imp_product6 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 6)
imp_product7 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 7)
imp_product8 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 8)
imp_product9 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 9)
imp_product10 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Exports/IND_Product.xlsx", 10)

#imp_ores[is.na(imp_ores)] <- 0
#imp_scrap[is.na(imp_scrap)] <- 0

#imp_primary1[is.na(imp_primary1)] <- 0
#imp_primary2[is.na(imp_primary2)] <- 0
#imp_primary3[is.na(imp_primary3)] <- 0
#imp_primary4[is.na(imp_primary4)] <- 0
#imp_primary5[is.na(imp_primary5)] <- 0

imp_product1[is.na(imp_product1)] <- 0
imp_product2[is.na(imp_product2)] <- 0
imp_product3[is.na(imp_product3)] <- 0
imp_product4[is.na(imp_product4)] <- 0
imp_product5[is.na(imp_product5)] <- 0
imp_product6[is.na(imp_product6)] <- 0
imp_product7[is.na(imp_product7)] <- 0
imp_product8[is.na(imp_product8)] <- 0
imp_product9[is.na(imp_product9)] <- 0
imp_product10[is.na(imp_product10)] <- 0


#primary_country <- data.frame(unique(c(imp_primary1$Country,imp_primary2$Country,imp_primary3$Country,
#                            imp_primary4$Country,imp_primary5$Country)))
#primary_country[is.na(primary_country)] <- 0
#names(primary_country)[names(primary_country) == "unique.c.imp_primary1.Country..imp_primary2.Country..imp_primary3.Country.."] <- "Country"

#primary_country <- cbind(primary_country, val16 = 0, val17 = 0)


#c16 <- c()
#c17 <- c()
#for(i in 1:NROW(primary_country)){
#  counter16 = 0
#  counter17 = 0
##  for(j in 1:NROW(imp_primary5)){
#    if(imp_primary5$Country[j] == primary_country$Country[i]){
#      counter16 = counter16 + imp_primary5$`2016-2017`[j]
#      counter17 = counter17 + imp_primary5$`2017-2018`[j]
#    }
#  }
#  c16[i] <- counter16
#  c17[i] <- counter17
#}
#primary_country$val16 <- primary_country$val16 + c16
#primary_country$val17 <- primary_country$val17 + c17

#write.csv(primary_country, "D:/CEEW/Data/Analysis/Copper/Exports/Primary.csv", row.names = TRUE)
#primary_country$Import_2016 <- c16
#primary_country$Import_2017 <- c17





product_country <- data.frame(unique(c(imp_product1$Country,imp_product2$Country,imp_product3$Country,
                            imp_product4$Country,imp_product5$Country,
                            imp_product6$Country,imp_product7$Country,imp_product8$Country,
                            imp_product9$Country,imp_product10$Country)))
product_country[is.na(product_country)] <- 0
names(product_country)[names(product_country) == "unique.c.imp_product1.Country..imp_product2.Country..imp_product3.Country.."] <- "Country"
product_country <- cbind(product_country, val16 = 0, val17 = 0)


c16 <- c()
c17 <- c()
for(i in 1:NROW(product_country)){
  counter16 = 0
  counter17 = 0
  for(j in 1:NROW(imp_product10)){
    if(imp_product10$Country[j] == product_country$Country[i]){
      counter16 = counter16 + imp_product10$`2016-2017`[j]
      counter17 = counter17 + imp_product10$`2017-2018`[j]
    }
  }
  c16[i] <- counter16
  c17[i] <- counter17
}
product_country$val16 <- product_country$val16 + c16
product_country$val17 <- product_country$val17 + c17

write.csv(product_country, "D:/CEEW/Data/Analysis/Copper/Exports/CombinedProduct.csv", row.names = TRUE)


#_____
library(readxl)
exp_product <- read_excel("D:/CEEW/Data/Analysis/Copper/Exports/CombinedProduct.xlsx", 1)
exp_primary <- read_excel("D:/CEEW/Data/Analysis/Copper/Exports/Primary(Excel)_exports.xlsx", 1)
exp_scrap <- read_excel("D:/CEEW/Data/Analysis/Copper/Exports/IND_Scrap_Exports.xlsx", 1)
exp_ores <- read_excel("D:/CEEW/Data/Analysis/Copper/Exports/IND_Ores_Export.xlsx", 1)

country <- data.frame(unique(c(exp_product$Country, exp_primary$Country, exp_ores$Country, exp_scrap$Country)))
names(country)[names(country) == "unique.c.exp_product.Country..exp_primary.Country..exp_ores.Country.."] <- "country"
exp_product[is.na(exp_product)] <- 0
exp_primary[is.na(exp_primary)] <- 0
exp_scrap[is.na(exp_scrap)] <- 0
exp_ores[is.na(exp_ores)] <- 0


primary_16 <- c()
primary_17 <- c()
product_16 <- c()
product_17 <- c()
scrap_16 <- c()
scrap_17 <- c()
ores_16 <- c()
ores_17 <- c()

for(i in 1:NROW(country)){
  if(length(exp_primary$val16[exp_primary$Country == country$country[i]]) != 0){
    primary_16[i] <- exp_primary$val16[exp_primary$Country == country$country[i]]
  }else{
    primary_16[i] <- 0
  }
  if(length(exp_primary$val17[exp_primary$Country == country$country[i]]) != 0){
    primary_17[i] <- exp_primary$val17[exp_primary$Country == country$country[i]]
  }else{
    primary_17[i] <- 0
  }
  
  
  
  if(length(exp_product$val16[exp_product$Country == country$country[i]]) != 0){
    product_16[i] <- exp_product$val16[exp_product$Country == country$country[i]]
  }else{
    product_16[i] <- 0
  }
  if(length(exp_product$val17[exp_product$Country == country$country[i]]) != 0){
    product_17[i] <- exp_product$val17[exp_product$Country == country$country[i]]
  }else{
    product_17[i] <- 0
  }
  
  
  
  if(length(exp_scrap$`2016-2017`[exp_scrap$Country == country$country[i]]) != 0){
    scrap_16[i] <- exp_scrap$`2016-2017`[exp_scrap$Country == country$country[i]]
  }else{
    scrap_16[i] <- 0
  }
  if(length(exp_scrap$`2017-2018`[exp_scrap$Country == country$country[i]]) != 0){
    scrap_17[i] <- exp_scrap$`2017-2018`[exp_scrap$Country == country$country[i]]
  }else{
    scrap_17[i] <- 0
  }
  
  
  
  if(length(exp_ores$`2016-2017`[exp_ores$Country == country$country[i]]) != 0){
    ores_16[i] <- exp_ores$`2016-2017`[exp_ores$Country == country$country[i]]
  }else{
    ores_16[i] <- 0
  }
  if(length(exp_ores$`2017-2018`[exp_ores$Country == country$country[i]]) != 0){
    ores_17[i] <- exp_ores$`2017-2018`[exp_ores$Country == country$country[i]]
  }else{
    ores_17[i] <- 0
  }
  
  print(i)
}


country$ores_16 <- ores_16
country$ores_17 <- ores_17
country$scrap_16 <- scrap_16
country$scrap_17 <- scrap_17
country$primary_16 <- primary_16
country$primary_17 <- primary_17
country$product_16 <- product_16
country$product_17 <- product_17


write.csv(country, "D:/CEEW/Data/Analysis/Copper/Exports/Final_data2.csv", row.names = TRUE)

#_________

library(readxl)
imp_product <- read_excel("D:/CEEW/Data/Analysis/Copper/Imports/CombinedProduct.xlsx", 1)
imp_primary <- read_excel("D:/CEEW/Data/Analysis/Copper/Imports/Primary(Excel)_Imports.xlsx", 1)
imp_scrap <- read_excel("D:/CEEW/Data/Analysis/Copper/Imports/IND_Scrap_Imports.xlsx", 1)
imp_ores <- read_excel("D:/CEEW/Data/Analysis/Copper/Imports/IND_Ores_Imports.xlsx", 1)

names(imp_scrap)[names(imp_scrap) == "Row Labels"] <- "Country"
country <- data.frame(unique(c(imp_product$Country, imp_primary$Country, imp_ores$Country, imp_scrap$Country)))
names(country)[names(country) == "unique.c.imp_product.Country..imp_primary.Country..imp_ores.Country.."] <- "Country"
names(country)[names(country) == "Country"] <- "country"

imp_product[is.na(imp_product)] <- 0
imp_primary[is.na(imp_primary)] <- 0
imp_scrap[is.na(imp_scrap)] <- 0
imp_ores[is.na(imp_ores)] <- 0


primary_16 <- c()
primary_17 <- c()
product_16 <- c()
product_17 <- c()
scrap_16 <- c()
scrap_17 <- c()
ores_16 <- c()
ores_17 <- c()

for(i in 1:NROW(country)){
  if(length(imp_primary$val16[imp_primary$Country == country$country[i]]) != 0){
    primary_16[i] <- imp_primary$val16[imp_primary$Country == country$country[i]]
  }else{
    primary_16[i] <- 0
  }
  if(length(imp_primary$val17[imp_primary$Country == country$country[i]]) != 0){
    primary_17[i] <- imp_primary$val17[imp_primary$Country == country$country[i]]
  }else{
    primary_17[i] <- 0
  }
  
  
  
  if(length(imp_product$val16[imp_product$Country == country$country[i]]) != 0){
    product_16[i] <- imp_product$val16[imp_product$Country == country$country[i]]
  }else{
    product_16[i] <- 0
  }
  if(length(imp_product$val17[imp_product$Country == country$country[i]]) != 0){
    product_17[i] <- imp_product$val17[imp_product$Country == country$country[i]]
  }else{
    product_17[i] <- 0
  }
  
  
  
  if(length(imp_scrap$`Sum of 2016-2017`[imp_scrap$Country == country$country[i]]) != 0){
    scrap_16[i] <- imp_scrap$`Sum of 2016-2017`[imp_scrap$Country == country$country[i]]
  }else{
    scrap_16[i] <- 0
  }
  if(length(imp_scrap$`Sum of 2017-2018`[imp_scrap$Country == country$country[i]]) != 0){
    scrap_17[i] <- imp_scrap$`Sum of 2017-2018`[imp_scrap$Country == country$country[i]]
  }else{
    scrap_17[i] <- 0
  }
  
  
  
  if(length(imp_ores$`2016-2017`[imp_ores$Country == country$country[i]]) != 0){
    ores_16[i] <- imp_ores$`2016-2017`[imp_ores$Country == country$country[i]]
  }else{
    ores_16[i] <- 0
  }
  if(length(imp_ores$`2017-2018`[imp_ores$Country == country$country[i]]) != 0){
    ores_17[i] <- imp_ores$`2017-2018`[imp_ores$Country == country$country[i]]
  }else{
    ores_17[i] <- 0
  }
  
  print(i)
}


country$ores_16 <- ores_16
country$ores_17 <- ores_17
country$scrap_16 <- scrap_16
country$scrap_17 <- scrap_17
country$primary_16 <- primary_16
country$primary_17 <- primary_17
country$product_16 <- product_16
country$product_17 <- product_17


write.csv(country, "D:/CEEW/Data/Analysis/Copper/Imports/Final_data2.csv", row.names = TRUE)
