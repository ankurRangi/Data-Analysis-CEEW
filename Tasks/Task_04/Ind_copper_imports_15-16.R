library(readxl)

imp_ores <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Ore.xlsx", 1)
imp_scrap <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/scrap.xlsx", 1)

imp_primary1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Primary.xlsx", 1)
imp_primary2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Primary.xlsx", 2)
imp_primary3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Primary.xlsx", 3)
imp_primary4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Primary.xlsx", 4)
imp_primary5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Primary.xlsx", 5)

imp_product1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 1)
imp_product2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 2)
imp_product3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 3)
imp_product4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 4)
imp_product5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 5)
imp_product6 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 6)
imp_product7 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 7)
imp_product8 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 8)
imp_product9 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 9)
imp_product10 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/Product.xlsx", 10)

imp_ores[is.na(imp_ores)] <- 0
imp_scrap[is.na(imp_scrap)] <- 0

imp_primary1[is.na(imp_primary1)] <- 0
imp_primary2[is.na(imp_primary2)] <- 0
imp_primary3[is.na(imp_primary3)] <- 0
imp_primary4[is.na(imp_primary4)] <- 0
imp_primary5[is.na(imp_primary5)] <- 0

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


primary_country <- data.frame(unique(c(imp_primary1$Country,imp_primary2$Country,imp_primary3$Country,
                            imp_primary4$Country,imp_primary5$Country)))
primary_country[is.na(primary_country)] <- 0
names(primary_country)[names(primary_country) == "unique.c.imp_primary1.Country..imp_primary2.Country..imp_primary3.Country.."] <- "Country"

primary_country <- cbind(primary_country, val15 = 0, val16 = 0)


c16 <- c()
c17 <- c()
for(i in 1:NROW(primary_country)){
  counter16 = 0
  counter17 = 0
  for(j in 1:NROW(imp_primary5)){
    if(imp_primary5$Country[j] == primary_country$Country[i]){
      counter16 = counter16 + imp_primary5$`2015-2016`[j]
      counter17 = counter17 + imp_primary5$`2016-2017`[j]
    }
  }
  c16[i] <- counter16
  c17[i] <- counter17
}
primary_country$val15 <- primary_country$val15 + c16
primary_country$val16 <- primary_country$val16 + c17

write.csv(primary_country, "D:/CEEW/Data/Analysis/Copper/2015-16/Imports/CombinedPrimary.csv", row.names = TRUE)
#___________________________________________________


#temp <- read.csv("D:/CEEW/Data/Analysis/Copper/2015-16/Imports/CombinedProduct.csv")
product_country <- data.frame(unique(c(imp_product1$Country, imp_product2$Country, imp_product3$Country,
                                       imp_product4$Country, imp_product5$Country, imp_product6$Country, imp_product7$Country, imp_product8$Country,
                                       imp_product9$Country, imp_product10$Country)))
product_country[is.na(product_country)] <- 0
names(product_country)[names(product_country) == "unique.c.imp_product1.Country..imp_product2.Country..imp_product3.Country.."] <- "Country"

product_country <- cbind(product_country, val15 = 0, val16 = 0)


c16 <- c()
c17 <- c()
for(i in 1:NROW(product_country)){
  counter16 = 0
  counter17 = 0
  for(j in 1:NROW(imp_product1)){
    if(imp_product1$Country[j] == product_country$Country[i] ){
      counter16 = counter16 + imp_product1$`2015-2016`[j]
      counter17 = counter17 + imp_product1$`2016-2017`[j]
    }
  }
  c16[i] <- counter16
  c17[i] <- counter17
}
product_country$val15 <- product_country$val15 + c16
product_country$val16 <- product_country$val16 + c17

write.csv(product_country, "D:/CEEW/Data/Analysis/Copper/2015-16/Imports/CombinedProduct.csv", row.names = TRUE)
