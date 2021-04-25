
setwd("D:/CEEW/Data")

library(readr)

data1996 <- read_csv("All_Country_Trade_HS6Digit_1996.csv")
#View(data1995)

China_trade1996 <- subset(data1996,  location_code == "IND" & partner_code == "CHN",
                      select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                 "partner_code", "export_value", "import_value"))

ASEAN_list <- c("IDN", "MYS", "PHL", "THA", "BRN", "SGP", "LAO", "VNM", "KHM", "MMR" )

ASEAN_trade1996 <- subset(data1996,  location_code == "IND" & partner_code %in% ASEAN_list,
                      select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                 "partner_code", "export_value", "import_value"))

china_ASEAN_trade1996 <- subset(data1996,  location_code == "CHN" & partner_code %in% ASEAN_list,
                                select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                           "partner_code", "export_value", "import_value"))

data1996_summary <- rbind(China_trade1996, ASEAN_trade1996)

write.csv(data1996_summary,"D:/CEEW/Data/Data_Summary/data1996_summary.csv", row.names = FALSE)

#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "IDN"] <- "INDONESIA"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "MYS"] <- "MALAYSIA"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "PHL"] <- "PHILIPPINES"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "THA"] <- "THAILAND"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "BRN"] <- "BRUNEI"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "SGP"] <- "SINGAPORE"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "LAO"] <- "LAOS"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "VNM"] <- "VIETNAM"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "KHM"] <- "CAMBODIA"
#ASEAN_trade1996$partner_code[ASEAN_trade1996$partner_code == "MMR"] <- "MYANMAR"

