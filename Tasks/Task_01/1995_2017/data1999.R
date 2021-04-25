setwd("D:/CEEW/Data")

library(readr)

data1999 <- read_csv("All_Country_Trade_HS6Digit_1999.csv")
#View(data1995)

China_trade1999 <- subset(data1999,  location_code == "IND" & partner_code == "CHN",
                          select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                     "partner_code", "export_value", "import_value"))

ASEAN_list <- c("IDN", "MYS", "PHL", "THA", "BRN", "SGP", "LAO", "VNM", "KHM", "MMR" )

ASEAN_trade1999 <- subset(data1999,  location_code == "IND" & partner_code %in% ASEAN_list,
                          select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                     "partner_code", "export_value", "import_value"))

china_ASEAN_trade1999 <- subset(data1999,  location_code == "CHN" & partner_code %in% ASEAN_list,
                                select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                           "partner_code", "export_value", "import_value"))


data1999_summary <- rbind(China_trade1999, ASEAN_trade1999)

write.csv(data1999_summary,"D:/CEEW/Data/Data_Summary/data1999_summary.csv", row.names = FALSE)