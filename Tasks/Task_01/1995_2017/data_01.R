
setwd("D:/CEEW/Data")

library(readr)

data1995 <- read_csv("All_Country_Trade_HS6Digit_1995.csv")
#View(data1995)

China_trade1995 <- subset(data1995,  location_code == "IND" & partner_code == "CHN",
                select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                           "partner_code", "export_value", "import_value"))

ASEAN_list <- c("IDN", "MYS", "PHL", "THA", "BRN", "SGP", "LAO", "VNM", "KHM", "MMR" )

ASEAN_trade1995 <- subset(data1995,  location_code == "IND" & partner_code %in% ASEAN_list,
                      select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                 "partner_code", "export_value", "import_value"))


data1995_summary <- rbind(China_trade1995, ASEAN_trade1995)

write.csv(data1995_summary,"D:/CEEW/Data/Data_Summary/data1995_summary.csv", row.names = FALSE)

#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "IDN"] <- "INDONESIA"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "MYS"] <- "MALAYSIA"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "PHL"] <- "PHILIPPINES"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "THA"] <- "THAILAND"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "BRN"] <- "BRUNEI"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "SGP"] <- "SINGAPORE"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "LAO"] <- "LAOS"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "VNM"] <- "VIETNAM"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "KHM"] <- "CAMBODIA"
#ASEAN_trade1995$partner_code[ASEAN_trade1995$partner_code == "MMR"] <- "MYANMAR"




#export_China <- data1995[data1995$partner_code %in% c("CHN"), "export_value"]
#import_China <- data1995[data1995$partner_code %in% c("CHN"), "import_value"]
#net_China <- import_China - export_China

#China_trade$net_China <- net_China
#View(China_trade)







