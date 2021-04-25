
library(readxl)

#exp_ores <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Ores.xlsx", 1)
#exp_scrap <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Scrap.xlsx", 1)

#exp_primary1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Primary.xlsx", 1)
#exp_primary2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Primary.xlsx", 2)
#exp_primary3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Primary.xlsx", 3)
#exp_primary4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Primary.xlsx", 4)
#exp_primary5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Primary.xlsx", 5)

exp_product1 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 1)
exp_product2 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 2)
exp_product3 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 3)
exp_product4 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 4)
exp_product5 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 5)
exp_product6 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 6)
exp_product7 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 7)
exp_product8 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 8)
exp_product9 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 9)
exp_product10 <- read_xlsx("D:/CEEW/Data/Analysis/Copper/Imports/IND_Product.xlsx", 10)

#exp_ores[is.na(exp_ores)] <- 0
#exp_scrap[is.na(exp_scrap)] <- 0

#exp_primary1[is.na(exp_primary1)] <- 0
#exp_primary2[is.na(exp_primary2)] <- 0
#exp_primary3[is.na(exp_primary3)] <- 0
#exp_primary4[is.na(exp_primary4)] <- 0
#exp_primary5[is.na(exp_primary5)] <- 0
exp_product1[is.na(exp_product1)] <- 0
exp_product2[is.na(exp_product2)] <- 0
exp_product3[is.na(exp_product3)] <- 0
exp_product4[is.na(exp_product4)] <- 0
exp_product5[is.na(exp_product5)] <- 0
exp_product6[is.na(exp_product6)] <- 0
exp_product7[is.na(exp_product7)] <- 0
exp_product8[is.na(exp_product8)] <- 0
exp_product9[is.na(exp_product9)] <- 0
exp_product10[is.na(exp_product10)] <- 0


#primary_country <- data.frame(unique(c(exp_primary1$Country,exp_primary2$Country,exp_primary3$Country,
#                            exp_primary4$Country,exp_primary5$Country)))
#primary_country[is.na(primary_country)] <- 0
#names(primary_country)[names(primary_country) == "unique.c.exp_primary1.Country..exp_primary2.Country..exp_primary3.Country.."] <- "Country"

#primary_country <- cbind(primary_country, val16 = 0, val17 = 0)
#
#c16 <- c()
#c17 <- c()
#for(i in 1:NROW(primary_country)){
  #counter16 = 0
  #counter17 = 0
 # for(j in 1:NROW(exp_primary5)){
#    if(exp_primary5$Country[j] == primary_country$Country[i]){
#      counter16 = counter16 + exp_primary5$`2016-2017`[j]
#      counter17 = counter17 + exp_primary5$`2017-2018`[j]
#    }
#  }
#  c16[i] <- counter16
#  c17[i] <- counter17
#}
#primary_country$val16 <- primary_country$val16 + c16
#primary_country$val17 <- primary_country$val17 + c17

#write.csv(primary_country, "D:/CEEW/Data/Analysis/Copper/Imports/Primary.csv", row.names = TRUE)


product_country <- data.frame(unique(c(exp_product1$Country, exp_product2$Country, exp_product3$Country,
                                       exp_product4$Country, exp_product5$Country,
                                       exp_product6$Country, exp_product7$Country, exp_product8$Country,
                                       exp_product9$Country, exp_product10$Country)))
product_country[is.na(product_country)] <- 0
names(product_country)[names(product_country) == "unique.c.exp_product1.Country..exp_product2.Country..exp_product3.Country.."] <- "Country"
product_country <- cbind(product_country, val16 = 0, val17 = 0)


c16 <- c()
c17 <- c()
for(i in 1:NROW(product_country)){
  counter16 = 0
  counter17 = 0
  for(j in 1:NROW(exp_product10)){
    if(exp_product10$Country[j] == product_country$Country[i]){
      counter16 = counter16 + exp_product10$`2016-2017`[j]
      counter17 = counter17 + exp_product10$`2017-2018`[j]
    }
  }
  c16[i] <- counter16
  c17[i] <- counter17
}
product_country$val16 <- product_country$val16 + c16
product_country$val17 <- product_country$val17 + c17

write.csv(product_country, "D:/CEEW/Data/Analysis/Copper/Imports/CombinedProduct.csv", row.names = TRUE)
