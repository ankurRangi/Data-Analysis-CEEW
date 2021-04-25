

ind_asean <- read.csv("D:/CEEW/Data/Data_Summary/IND_ASEAN.csv")
chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

ind_sgp_table <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/IND_SGP_table.csv")
chn_sgp_table <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/CHN_SGP_table.csv")


d2005 <- subset(ind_sgp, year == "2005", 
                   select = c("year", "import_value", "hs_product_code"))
d2017 <- subset(ind_sgp, year == "2017" & hs_product_code %in% d2005$hs_product_code, 
                   select = c("year", "import_value", "hs_product_code"))

fdat <- merge(d2005, d2017, by = "hs_product_code")


for (i in 1:NROW(fdat)){
  cagr[i] <- ((fdat$import_value.y[i]/ fdat$import_value.x[i])^(1/13))-1
  
}
View(cagr)
fdat$CAGR <- cagr
View(fdat)

