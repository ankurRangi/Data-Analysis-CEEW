setwd("D:/CEEW/Data")

library(readr)

data2016 <- read_csv("All_Country_Trade_HS6Digit_2016.csv")
#View(data1995)

China_trade2016 <- subset(data2016,  location_code == "IND" & partner_code == "CHN",
                          select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                     "partner_code", "export_value", "import_value"))

ASEAN_list <- c("IDN", "MYS", "PHL", "THA", "BRN", "SGP", "LAO", "VNM", "KHM", "MMR" )

ASEAN_trade2016 <- subset(data2016,  location_code == "IND" & partner_code %in% ASEAN_list,
                          select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                     "partner_code", "export_value", "import_value"))

china_ASEAN_trade2016 <- subset(data2016,  location_code == "CHN" & partner_code %in% ASEAN_list,
                                select = c("year", "hs_product_code" ,"location_id", "location_code","partner_id",
                                           "partner_code", "export_value", "import_value"))

write.csv(rbind(China_trade2016, ASEAN_trade2016),
          "D:/CEEW/Data/Data_Summary/data2016_summary.csv", row.names = FALSE)
