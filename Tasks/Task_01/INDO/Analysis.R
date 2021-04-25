#Calculating CAGR for exports and imports for the year 2010, 2013 and 2017,
#Using the base year as 2005.

#Base Year
d2005 <- subset(ind_indo, year == "2005", select = c("year","export_value", "import_value", "hs_product_code"))

d2010 <- subset(ind_indo, year == "2010", select = c("year","export_value", "import_value", "hs_product_code"))
d2013 <- subset(ind_indo, year == "2013", select = c("year","export_value", "import_value", "hs_product_code"))
d2017 <- subset(ind_indo, year == "2017", select = c("year","export_value", "import_value", "hs_product_code"))

fdat <- merge(d2005, merge(d2010,d2013, by = "hs_product_code"), by = "hs_product_code")

#Renaming Columns
names(fdat)[names(fdat) == "year"] <- "year_2005"
names(fdat)[names(fdat) == "export_value"] <- "export_value_2005"
names(fdat)[names(fdat) == "import_value"] <- "import_value_2005"

names(fdat)[names(fdat) == "year.x"] <- "year_2010"
names(fdat)[names(fdat) == "export_value.x"] <- "export_value_2010"
names(fdat)[names(fdat) == "import_value.x"] <- "import_value_2010"


names(fdat)[names(fdat) == "year.y"] <- "year_2013"
names(fdat)[names(fdat) == "export_value.y"] <- "export_value_2013"
names(fdat)[names(fdat) == "import_value.y"] <- "import_value_2013"

fdat <- merge(fdat, d2017, by = "hs_product_code")

names(fdat)[names(fdat) == "year"] <- "year_2017"
names(fdat)[names(fdat) == "export_value"] <- "export_value_2017"
names(fdat)[names(fdat) == "import_value"] <- "import_value_2017"

#Now the files have been merged.

compExport <- c()
compImport <- c()

for( i in 1:NROW(fdat)){
  
  c1 <- (fdat$export_value_2010[i] / fdat$export_value_2005[i])
  compExport[i] <- ( c1 ^ (1/6)) - 1
  c2 <- (fdat$import_value_2010[i] / fdat$import_value_2005[i])
  compImport[i] <- ( c2 ^ (1/6)) - 1
}

fdat$Export_Growth_2010 <- compExport
fdat$Import_Growth_2010 <- compImport
#Calculating the percentage
fdat$Export_Growth_2010 <- fdat$Export_Growth_2010*100
fdat$Import_Growth_2010 <- fdat$Import_Growth_2010*100

for( i in 1:NROW(fdat)){
  
  c1 <- (fdat$export_value_2013[i] / fdat$export_value_2005[i])
  compExport[i] <- ( c1 ^ (1/9)) - 1
  c2 <- (fdat$import_value_2013[i] / fdat$import_value_2005[i])
  compImport[i] <- ( c2 ^ (1/9)) - 1
}

fdat$Export_Growth_2013 <- compExport
fdat$Import_Growth_2013 <- compImport
#Calculating the percentage
fdat$Export_Growth_2013 <- fdat$Export_Growth_2013*100
fdat$Import_Growth_2013 <- fdat$Import_Growth_2013*100

for( i in 1:NROW(fdat)){
  
  c1 <- (fdat$export_value_2017[i] / fdat$export_value_2005[i])
  compExport[i] <- ( c1 ^ (1/13)) - 1
  c2 <- (fdat$import_value_2017[i] / fdat$import_value_2005[i])
  compImport[i] <- ( c2 ^ (1/13)) - 1
}

fdat$Export_Growth_2017 <- compExport
fdat$Import_Growth_2017 <- compImport
#Calculating the percentage
fdat$Export_Growth_2017 <- fdat$Export_Growth_2017*100
fdat$Import_Growth_2017 <- fdat$Import_Growth_2017*100

#To reorder the columns in the beolow specfic columns 
#fdat<- fdat[,c(...2,3,1,5,7,4,6,8...)]

write.csv(fdat, "D:/CEEW/Data/Data_Summary/INDO/Exp_Imp_CAGR_10_13_17.csv", row.names = FALSE)


