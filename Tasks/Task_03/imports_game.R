
library(readxl)

sgp_ind_2011 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 1)
sgp_ind_2012 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 2)
sgp_ind_2013 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 3)
sgp_ind_2014 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 4)
sgp_ind_2015 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 5)
sgp_ind_2016 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 6)
sgp_ind_2017 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 7)
sgp_ind_2018 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 8)
sgp_ind_2019 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/SGP_IND.xlsx", 9)


sgp_ind_2011[is.na(sgp_ind_2011)] <- 0
sgp_ind_2012[is.na(sgp_ind_2012)] <- 0
sgp_ind_2013[is.na(sgp_ind_2013)] <- 0
sgp_ind_2014[is.na(sgp_ind_2014)] <- 0
sgp_ind_2015[is.na(sgp_ind_2015)] <- 0
sgp_ind_2016[is.na(sgp_ind_2016)] <- 0
sgp_ind_2017[is.na(sgp_ind_2017)] <- 0
sgp_ind_2018[is.na(sgp_ind_2018)] <- 0
sgp_ind_2019[is.na(sgp_ind_2019)] <- 0


sgp_ind_2011$HSCode_2 <- floor(sgp_ind_2011$HSCode/1000000)
sgp_ind_2012$HSCode_2 <- floor(sgp_ind_2012$HSCode/1000000)
sgp_ind_2013$HSCode_2 <- floor(sgp_ind_2013$HSCode/1000000)
sgp_ind_2014$HSCode_2 <- floor(sgp_ind_2014$HSCode/1000000)
sgp_ind_2015$HSCode_2 <- floor(sgp_ind_2015$HSCode/1000000)
sgp_ind_2016$HSCode_2 <- floor(sgp_ind_2016$HSCode/1000000)
sgp_ind_2017$HSCode_2 <- floor(sgp_ind_2017$HSCode/1000000)
sgp_ind_2018$HSCode_2 <- floor(sgp_ind_2018$HSCode/1000000)
sgp_ind_2019$HSCode_2 <- floor(sgp_ind_2019$HSCode/1000000)


sgp_ind_2011 <- subset(sgp_ind_2011, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2012 <- subset(sgp_ind_2012, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2013 <- subset(sgp_ind_2013, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2014 <- subset(sgp_ind_2014, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2015 <- subset(sgp_ind_2015, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2016 <- subset(sgp_ind_2016, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2017 <- subset(sgp_ind_2017, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2018 <- subset(sgp_ind_2018, HSCode_2 >= 72 & HSCode_2 <= 85)
sgp_ind_2019 <- subset(sgp_ind_2019, HSCode_2 >= 72 & HSCode_2 <= 85)



hslist <- unique(c(sgp_ind_2011$HSCode, sgp_ind_2012$HSCode, sgp_ind_2013$HSCode, sgp_ind_2014$HSCode, 
                   sgp_ind_2015$HSCode, sgp_ind_2016$HSCode, sgp_ind_2017$HSCode, sgp_ind_2018$HSCode, 
                   sgp_ind_2019$HSCode))

View(hslist)

SGP_IND <- data.frame(HSCode = c(hslist), twodigit = c(floor(hslist/1000000)))

import <- c()
for(i in 1:NROW(hslist)){
  if(length(sgp_ind_2019$`2019-2020(Apr-Feb(P))`[sgp_ind_2019$HSCode == hslist[i]]) != 0){
    import[i] <- sgp_ind_2019$`2019-2020(Apr-Feb(P))`[sgp_ind_2019$HSCode == hslist[i]]
  }else{
    import[i] <- 0
  }
}    
SGP_IND$import_2019 <- import

write.csv(SGP_IND, "D:/CEEW/Data/Analysis/ASEAN_IND/Import_SGP_IND.csv", row.names = TRUE)
#_____________________________________________________________________________________________
  

library(readxl)

idn_ind_2011 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 1)
idn_ind_2012 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 2)
idn_ind_2013 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 3)
idn_ind_2014 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 4)
idn_ind_2015 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 5)
idn_ind_2016 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 6)
idn_ind_2017 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 7)
idn_ind_2018 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 8)
idn_ind_2019 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/IDN_IND.xlsx", 9)


idn_ind_2011[is.na(idn_ind_2011)] <- 0
idn_ind_2012[is.na(idn_ind_2012)] <- 0
idn_ind_2013[is.na(idn_ind_2013)] <- 0
idn_ind_2014[is.na(idn_ind_2014)] <- 0
idn_ind_2015[is.na(idn_ind_2015)] <- 0
idn_ind_2016[is.na(idn_ind_2016)] <- 0
idn_ind_2017[is.na(idn_ind_2017)] <- 0
idn_ind_2018[is.na(idn_ind_2018)] <- 0
idn_ind_2019[is.na(idn_ind_2019)] <- 0


idn_ind_2011$HSCode_2 <- floor(idn_ind_2011$HSCode/1000000)
idn_ind_2012$HSCode_2 <- floor(idn_ind_2012$HSCode/1000000)
idn_ind_2013$HSCode_2 <- floor(idn_ind_2013$HSCode/1000000)
idn_ind_2014$HSCode_2 <- floor(idn_ind_2014$HSCode/1000000)
idn_ind_2015$HSCode_2 <- floor(idn_ind_2015$HSCode/1000000)
idn_ind_2016$HSCode_2 <- floor(idn_ind_2016$HSCode/1000000)
idn_ind_2017$HSCode_2 <- floor(idn_ind_2017$HSCode/1000000)
idn_ind_2018$HSCode_2 <- floor(idn_ind_2018$HSCode/1000000)
idn_ind_2019$HSCode_2 <- floor(idn_ind_2019$HSCode/1000000)


idn_ind_2011 <- subset(idn_ind_2011, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2012 <- subset(idn_ind_2012, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2013 <- subset(idn_ind_2013, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2014 <- subset(idn_ind_2014, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2015 <- subset(idn_ind_2015, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2016 <- subset(idn_ind_2016, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2017 <- subset(idn_ind_2017, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2018 <- subset(idn_ind_2018, HSCode_2 >= 72 & HSCode_2 <= 85)
idn_ind_2019 <- subset(idn_ind_2019, HSCode_2 >= 72 & HSCode_2 <= 85)



hslist <- unique(c(idn_ind_2011$HSCode, idn_ind_2012$HSCode, idn_ind_2013$HSCode, idn_ind_2014$HSCode, 
                   idn_ind_2015$HSCode, idn_ind_2016$HSCode, idn_ind_2017$HSCode, idn_ind_2018$HSCode, 
                   idn_ind_2019$HSCode))

View(hslist)

IDN_IND <- data.frame(HSCode = c(hslist), twodigit = c(floor(hslist/1000000)))

import <- c()
for(i in 1:NROW(hslist)){
  if(length(idn_ind_2019$`2019-2020(Apr-Feb(P))`[idn_ind_2019$HSCode == hslist[i]]) != 0){
    import[i] <- idn_ind_2019$`2019-2020(Apr-Feb(P))`[idn_ind_2019$HSCode == hslist[i]]
  }else{
    import[i] <- 0
  }
}    
IDN_IND$import_2019 <- import

write.csv(IDN_IND, "D:/CEEW/Data/Analysis/ASEAN_IND/Import_IDN_IND.csv", row.names = TRUE)  
#_________________________________________________________________________________________


library(readxl)

mys_ind_2011 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 1)
mys_ind_2012 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 2)
mys_ind_2013 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 3)
mys_ind_2014 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 4)
mys_ind_2015 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 5)
mys_ind_2016 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 6)
mys_ind_2017 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 7)
mys_ind_2018 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 8)
mys_ind_2019 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/MYS_IND.xlsx", 9)


mys_ind_2011[is.na(mys_ind_2011)] <- 0
mys_ind_2012[is.na(mys_ind_2012)] <- 0
mys_ind_2013[is.na(mys_ind_2013)] <- 0
mys_ind_2014[is.na(mys_ind_2014)] <- 0
mys_ind_2015[is.na(mys_ind_2015)] <- 0
mys_ind_2016[is.na(mys_ind_2016)] <- 0
mys_ind_2017[is.na(mys_ind_2017)] <- 0
mys_ind_2018[is.na(mys_ind_2018)] <- 0
mys_ind_2019[is.na(mys_ind_2019)] <- 0


mys_ind_2011$HSCode_2 <- floor(mys_ind_2011$HSCode/1000000)
mys_ind_2012$HSCode_2 <- floor(mys_ind_2012$HSCode/1000000)
mys_ind_2013$HSCode_2 <- floor(mys_ind_2013$HSCode/1000000)
mys_ind_2014$HSCode_2 <- floor(mys_ind_2014$HSCode/1000000)
mys_ind_2015$HSCode_2 <- floor(mys_ind_2015$HSCode/1000000)
mys_ind_2016$HSCode_2 <- floor(mys_ind_2016$HSCode/1000000)
mys_ind_2017$HSCode_2 <- floor(mys_ind_2017$HSCode/1000000)
mys_ind_2018$HSCode_2 <- floor(mys_ind_2018$HSCode/1000000)
mys_ind_2019$HSCode_2 <- floor(mys_ind_2019$HSCode/1000000)


mys_ind_2011 <- subset(mys_ind_2011, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2012 <- subset(mys_ind_2012, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2013 <- subset(mys_ind_2013, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2014 <- subset(mys_ind_2014, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2015 <- subset(mys_ind_2015, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2016 <- subset(mys_ind_2016, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2017 <- subset(mys_ind_2017, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2018 <- subset(mys_ind_2018, HSCode_2 >= 72 & HSCode_2 <= 85)
mys_ind_2019 <- subset(mys_ind_2019, HSCode_2 >= 72 & HSCode_2 <= 85)



hslist <- unique(c(mys_ind_2011$HSCode, mys_ind_2012$HSCode, mys_ind_2013$HSCode, mys_ind_2014$HSCode, 
                   mys_ind_2015$HSCode, mys_ind_2016$HSCode, mys_ind_2017$HSCode, mys_ind_2018$HSCode, 
                   mys_ind_2019$HSCode))

View(hslist)

MYS_IND <- data.frame(HSCode = c(hslist), twodigit = c(floor(hslist/1000000)))

import <- c()
for(i in 1:NROW(hslist)){
  if(length(mys_ind_2019$`2019-2020(Apr-Feb(P))`[mys_ind_2019$HSCode == hslist[i]]) != 0){
    import[i] <- mys_ind_2019$`2019-2020(Apr-Feb(P))`[mys_ind_2019$HSCode == hslist[i]]
  }else{
    import[i] <- 0
  }
}    
MYS_IND$import_2019 <- import

write.csv(MYS_IND, "D:/CEEW/Data/Analysis/ASEAN_IND/Import_MYS_IND.csv", row.names = TRUE)   
#_________________________________________________________________________________________  
  
  
library(readxl)

tha_ind_2011 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 1)
tha_ind_2012 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 2)
tha_ind_2013 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 3)
tha_ind_2014 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 4)
tha_ind_2015 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 5)
tha_ind_2016 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 6)
tha_ind_2017 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 7)
tha_ind_2018 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 8)
tha_ind_2019 <- read_xlsx("D:/CEEW/Data/Analysis/ASEAN_IND/THA_IND.xlsx", 9)


tha_ind_2011[is.na(tha_ind_2011)] <- 0
tha_ind_2012[is.na(tha_ind_2012)] <- 0
tha_ind_2013[is.na(tha_ind_2013)] <- 0
tha_ind_2014[is.na(tha_ind_2014)] <- 0
tha_ind_2015[is.na(tha_ind_2015)] <- 0
tha_ind_2016[is.na(tha_ind_2016)] <- 0
tha_ind_2017[is.na(tha_ind_2017)] <- 0
tha_ind_2018[is.na(tha_ind_2018)] <- 0
tha_ind_2019[is.na(tha_ind_2019)] <- 0


tha_ind_2011$HSCode_2 <- floor(tha_ind_2011$HSCode/1000000)
tha_ind_2012$HSCode_2 <- floor(tha_ind_2012$HSCode/1000000)
tha_ind_2013$HSCode_2 <- floor(tha_ind_2013$HSCode/1000000)
tha_ind_2014$HSCode_2 <- floor(tha_ind_2014$HSCode/1000000)
tha_ind_2015$HSCode_2 <- floor(tha_ind_2015$HSCode/1000000)
tha_ind_2016$HSCode_2 <- floor(tha_ind_2016$HSCode/1000000)
tha_ind_2017$HSCode_2 <- floor(tha_ind_2017$HSCode/1000000)
tha_ind_2018$HSCode_2 <- floor(tha_ind_2018$HSCode/1000000)
tha_ind_2019$HSCode_2 <- floor(tha_ind_2019$HSCode/1000000)


tha_ind_2011 <- subset(tha_ind_2011, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2012 <- subset(tha_ind_2012, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2013 <- subset(tha_ind_2013, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2014 <- subset(tha_ind_2014, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2015 <- subset(tha_ind_2015, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2016 <- subset(tha_ind_2016, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2017 <- subset(tha_ind_2017, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2018 <- subset(tha_ind_2018, HSCode_2 >= 72 & HSCode_2 <= 85)
tha_ind_2019 <- subset(tha_ind_2019, HSCode_2 >= 72 & HSCode_2 <= 85)



hslist <- unique(c(tha_ind_2011$HSCode, tha_ind_2012$HSCode, tha_ind_2013$HSCode, tha_ind_2014$HSCode, 
                   tha_ind_2015$HSCode, tha_ind_2016$HSCode, tha_ind_2017$HSCode, tha_ind_2018$HSCode, 
                   tha_ind_2019$HSCode))

View(hslist)

THA_IND <- data.frame(HSCode = c(hslist), twodigit = c(floor(hslist/1000000)))

import <- c()
for(i in 1:NROW(hslist)){
  if(length(tha_ind_2019$`2019-2020(Apr-Feb(P))`[tha_ind_2019$HSCode == hslist[i]]) != 0){
    import[i] <- tha_ind_2019$`2019-2020(Apr-Feb(P))`[tha_ind_2019$HSCode == hslist[i]]
  }else{
    import[i] <- 0
  }
}    
THA_IND$import_2019 <- import

write.csv(THA_IND, "D:/CEEW/Data/Analysis/ASEAN_IND/Import_THA_IND.csv", row.names = TRUE)   
#___________________________________________________________________________________________


chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

pat <- c("IDN", "SGP", "MYS", "THA")
chn_asean <- subset(chn_asean, partner_code %in% pat & year %in% c(2011:2017))

chn_asean$HSCode_2 <- floor(chn_asean$hs_product_code/10000)
chn_asean <- subset(chn_asean, HSCode_2 >= 72 & HSCode_2 <= 85)

chn_idn <- subset(chn_asean, partner_code == "IDN", select = c("year", "hs_product_code", "export_value"))
chn_sgp <- subset(chn_asean, partner_code == "SGP", select = c("year", "hs_product_code", "export_value"))
chn_mys<- subset(chn_asean, partner_code == "MYS", select = c("year", "hs_product_code", "export_value"))
chn_tha <- subset(chn_asean, partner_code == "THA", select = c("year", "hs_product_code", "export_value"))

write.csv(chn_idn, "D:/CEEW/Data/Analysis/China_ASEAN/Export_CHN_IDN.csv", row.names = TRUE)   
write.csv(chn_sgp, "D:/CEEW/Data/Analysis/China_ASEAN/Export_CHN_SGP.csv", row.names = TRUE)   
write.csv(chn_mys, "D:/CEEW/Data/Analysis/China_ASEAN/Export_CHN_MYS.csv", row.names = TRUE)   
write.csv(chn_tha, "D:/CEEW/Data/Analysis/China_ASEAN/Export_CHN_THA.csv", row.names = TRUE)   








