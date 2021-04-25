library(readxl)

exp_primary1 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 1)
exp_primary2 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 2)
exp_primary3 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 3)
exp_primary4 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 4)
exp_primary5 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 5)
exp_primary6 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Intermediate.xlsx", 6)


exp_product1 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 1)
exp_product2 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 2)
exp_product3 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 3)
exp_product4 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 4)
exp_product5 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 5)
exp_product6 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 6)
exp_product7 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 7)
exp_product8 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 8)
exp_product9 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 9)
exp_product10 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 10)

exp_product11 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 11)
exp_product12 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 12)
exp_product13 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 13)
exp_product14 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 14)
exp_product15 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 15)
exp_product16 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 16)
exp_product17 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 17)
exp_product18 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 18)
exp_product19 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 19)
exp_product20 <- read_xlsx("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Product.xlsx", 20)



exp_primary1[is.na(exp_primary1)] <- 0
exp_primary2[is.na(exp_primary2)] <- 0
exp_primary3[is.na(exp_primary3)] <- 0
exp_primary4[is.na(exp_primary4)] <- 0
exp_primary5[is.na(exp_primary5)] <- 0
exp_primary6[is.na(exp_primary6)] <- 0

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

exp_product11[is.na(exp_product11)] <- 0
exp_product12[is.na(exp_product12)] <- 0
exp_product13[is.na(exp_product13)] <- 0
exp_product14[is.na(exp_product14)] <- 0
exp_product15[is.na(exp_product15)] <- 0
exp_product16[is.na(exp_product16)] <- 0
exp_product17[is.na(exp_product17)] <- 0
exp_product18[is.na(exp_product18)] <- 0
exp_product19[is.na(exp_product19)] <- 0
exp_product20[is.na(exp_product20)] <- 0


primary_country <- data.frame(unique(c(exp_primary1$Country,exp_primary2$Country, exp_primary3$Country,
                                       exp_primary4$Country,exp_primary5$Country, exp_primary6$Country)))

names(primary_country)[names(primary_country) == "unique.c.exp_primary1.Country..exp_primary2.Country..exp_primary3.Country.."] <- "Country"

primary_country <- cbind(primary_country, val15 = 0, val16 = 0)

c15 <- c()
c16 <- c()
for(i in 1:NROW(primary_country)){
  counter15 = 0
  counter16 = 0
  for(j in 1:NROW(exp_primary6)){
    if(exp_primary6$Country[j] == primary_country$Country[i]){
      counter15 = counter15 + exp_primary6$`2015-2016`[j]
      counter16 = counter16 + exp_primary6$`2016-2017`[j]
    }
  }
  c15[i] <- counter15
  c16[i] <- counter16
}
primary_country$val15 <- primary_country$val15 + c15
primary_country$val16 <- primary_country$val16 + c16

write.csv(primary_country, "D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/CombinedIntermediate.csv", row.names = TRUE)
#__________________


product_country <- data.frame(unique(c(exp_product1$Country, exp_product2$Country, exp_product3$Country,
                                       exp_product4$Country, exp_product5$Country, exp_product6$Country, exp_product7$Country, exp_product8$Country,
                                       exp_product9$Country, exp_product10$Country,
                                       exp_product11$Country, exp_product12$Country, exp_product13$Country,
                                       exp_product14$Country, exp_product15$Country, exp_product16$Country, exp_product17$Country, exp_product18$Country,
                                       exp_product19$Country, exp_product20$Country)))
names(product_country)[names(product_country) == "unique.c.exp_product1.Country..exp_product2.Country..exp_product3.Country.."] <- "Country"

product_country <- cbind(product_country, val15 = 0, val16 = 0)


c15 <- c()
c16 <- c()
for(i in 1:NROW(product_country)){
  counter15 = 0
  counter16 = 0
  for(j in 1:NROW(exp_product20)){
    if(exp_product20$Country[j] == product_country$Country[i] ){
      counter15 = counter15 + exp_product20$`2015-2016`[j]
      counter16 = counter16 + exp_product20$`2016-2017`[j]
    }
  }
  c15[i] <- counter15
  c16[i] <- counter16
}
product_country$val15 <- product_country$val15 + c15
product_country$val16 <- product_country$val16 + c16

write.csv(product_country, "D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/CombinedProduct.csv", row.names = TRUE)
#_________________________________-




library(readxl)
exp_product <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/CombinedProduct.xlsx",1)
exp_primary <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/CombinedIntermediate.xlsx",1)
exp_scrap <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/scrap.xlsx", 1)
exp_ores <- read_excel("D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Ore.xlsx", 1)

country <- data.frame( unique( c(
  exp_ores$Country, exp_scrap$Country, exp_primary$Country, exp_product$Country
)))
names(country)[names(country) == "unique.c.exp_ores.Country..exp_scrap.Country..exp_primary.Country.."] <- "country"


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
  if(length(exp_primary$val15[exp_primary$Country == country$country[i]]) != 0){
    primary_16[i] <- exp_primary$val15[exp_primary$Country == country$country[i]]
  }else{
    primary_16[i] <- 0
  }
  if(length(exp_primary$val16[exp_primary$Country == country$country[i]]) != 0){
    primary_17[i] <- exp_primary$val16[exp_primary$Country == country$country[i]]
  }else{
    primary_17[i] <- 0
  }
  
  
  
  if(length(exp_product$val15[exp_product$Country == country$country[i]]) != 0){
    product_16[i] <- exp_product$val15[exp_product$Country == country$country[i]]
  }else{
    product_16[i] <- 0
  }
  if(length(exp_product$val16[exp_product$Country == country$country[i]]) != 0){
    product_17[i] <- exp_product$val16[exp_product$Country == country$country[i]]
  }else{
    product_17[i] <- 0
  }
  
  
  
  if(length(exp_scrap$`2015-2016`[exp_scrap$Country == country$country[i]]) != 0){
    scrap_16[i] <- exp_scrap$`2015-2016`[exp_scrap$Country == country$country[i]]
  }else{
    scrap_16[i] <- 0
  }
  if(length(exp_scrap$`2016-2017`[exp_scrap$Country == country$country[i]]) != 0){
    scrap_17[i] <- exp_scrap$`2016-2017`[exp_scrap$Country == country$country[i]]
  }else{
    scrap_17[i] <- 0
  }
  
  
  
  if(length(exp_ores$`2015-2016`[exp_ores$Country == country$country[i]]) != 0){
    ores_16[i] <- exp_ores$`2015-2016`[exp_ores$Country == country$country[i]]
  }else{
    ores_16[i] <- 0
  }
  if(length(exp_ores$`2016-2017`[exp_ores$Country == country$country[i]]) != 0){
    ores_17[i] <- exp_ores$`2016-2017`[exp_ores$Country == country$country[i]]
  }else{
    ores_17[i] <- 0
  }
  
  print(i)
}


country$ores_15 <- ores_16
country$ores_16 <- ores_17
country$scrap_15 <- scrap_16
country$scrap_16 <- scrap_17
country$primary_15 <- primary_16
country$primary_16 <- primary_17
country$product_15 <- product_16
country$product_16 <- product_17

country[is.na(country)] <- 0

write.csv(country, "D:/CEEW/Data/Analysis/Iron_Steel_india/Imports/Final_Data.csv", row.names = TRUE)


