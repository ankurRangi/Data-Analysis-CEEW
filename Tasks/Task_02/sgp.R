
library(readxl)
library("xlsx")
setwd("D:/CEEW/Data")

#library(plyr)
#revalue(SGP_WLD$Industry_Class, c("Minerals and ores" = "Refinery")) -> SGP_WLD

trade_2digit <- read.xlsx2("D:/CEEW/Data/IND_WLD_2digit.xlsx", 1, header = TRUE)

sgp1995 <- read.csv("All_Country_Trade_HS6Digit_1995.csv")
sgp1996 <- read.csv("All_Country_Trade_HS6Digit_1996.csv")
sgp1997 <- read.csv("All_Country_Trade_HS6Digit_1997.csv")
sgp1998 <- read.csv("All_Country_Trade_HS6Digit_1998.csv")
sgp1999 <- read.csv("All_Country_Trade_HS6Digit_1999.csv")
sgp2000 <- read.csv("All_Country_Trade_HS6Digit_2000.csv")
sgp2001 <- read.csv("All_Country_Trade_HS6Digit_2001.csv")
sgp2002 <- read.csv("All_Country_Trade_HS6Digit_2002.csv")
sgp2003 <- read.csv("All_Country_Trade_HS6Digit_2003.csv")
sgp2004 <- read.csv("All_Country_Trade_HS6Digit_2004.csv")
sgp2005 <- read.csv("All_Country_Trade_HS6Digit_2005.csv")
sgp2006 <- read.csv("All_Country_Trade_HS6Digit_2006.csv")
sgp2007 <- read.csv("All_Country_Trade_HS6Digit_2007.csv")
sgp2008 <- read.csv("All_Country_Trade_HS6Digit_2008.csv")
sgp2009 <- read.csv("All_Country_Trade_HS6Digit_2009.csv")
sgp2010 <- read.csv("All_Country_Trade_HS6Digit_2010.csv")
sgp2011 <- read.csv("All_Country_Trade_HS6Digit_2011.csv")
sgp2012 <- read.csv("All_Country_Trade_HS6Digit_2012.csv")
sgp2013 <- read.csv("All_Country_Trade_HS6Digit_2013.csv")
sgp2014 <- read.csv("All_Country_Trade_HS6Digit_2014.csv")
sgp2015 <- read.csv("All_Country_Trade_HS6Digit_2015.csv")
sgp2016 <- read.csv("All_Country_Trade_HS6Digit_2016.csv")
sgp2017 <- read.csv("All_Country_Trade_HS6Digit_2017.csv")


sgp1995 <- subset(sgp1995, location_code == "SGP")
sgp1996 <- subset(sgp1996, location_code == "SGP")
sgp1997 <- subset(sgp1997, location_code == "SGP")
sgp1998 <- subset(sgp1998, location_code == "SGP")
sgp1999 <- subset(sgp1999, location_code == "SGP")
sgp2000 <- subset(sgp2000, location_code == "SGP")
sgp2001 <- subset(sgp2001, location_code == "SGP")
sgp2002 <- subset(sgp2002, location_code == "SGP")
sgp2003 <- subset(sgp2003, location_code == "SGP")
sgp2004 <- subset(sgp2004, location_code == "SGP")
sgp2005 <- subset(sgp2005, location_code == "SGP")
sgp2006 <- subset(sgp2006, location_code == "SGP")
sgp2007 <- subset(sgp2007, location_code == "SGP")
sgp2008 <- subset(sgp2008, location_code == "SGP")
sgp2009 <- subset(sgp2009, location_code == "SGP")
sgp2010 <- subset(sgp2010, location_code == "SGP")
sgp2011 <- subset(sgp2011, location_code == "SGP")
sgp2012 <- subset(sgp2012, location_code == "SGP")
sgp2013 <- subset(sgp2013, location_code == "SGP")
sgp2014 <- subset(sgp2014, location_code == "SGP")
sgp2015 <- subset(sgp2015, location_code == "SGP")

sgp2016 <- subset(sgp2016, location_code == "SGP")
sgp2017 <- subset(sgp2017, location_code == "SGP")


write.csv(sgp1995, "D:/CEEW/Data/SGP_WLD/SGP_WLD_1995.csv", row.names = FALSE)
write.csv(sgp1996, "D:/CEEW/Data/SGP_WLD/SGP_WLD_1996.csv", row.names = FALSE)
write.csv(sgp1997, "D:/CEEW/Data/SGP_WLD/SGP_WLD_1997.csv", row.names = FALSE)
write.csv(sgp1998, "D:/CEEW/Data/SGP_WLD/SGP_WLD_1998.csv", row.names = FALSE)
write.csv(sgp1999, "D:/CEEW/Data/SGP_WLD/SGP_WLD_1999.csv", row.names = FALSE)
write.csv(sgp2000, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2000.csv", row.names = FALSE)
write.csv(sgp2001, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2001.csv", row.names = FALSE)
write.csv(sgp2002, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2002.csv", row.names = FALSE)
write.csv(sgp2003, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2003.csv", row.names = FALSE)
write.csv(sgp2004, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2004.csv", row.names = FALSE)
write.csv(sgp2005, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2005.csv", row.names = FALSE)
write.csv(sgp2006, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2006.csv", row.names = FALSE)
write.csv(sgp2007, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2007.csv", row.names = FALSE)
write.csv(sgp2008, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2008.csv", row.names = FALSE)
write.csv(sgp2009, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2009.csv", row.names = FALSE)
write.csv(sgp2010, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2010.csv", row.names = FALSE)
write.csv(sgp2011, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2011.csv", row.names = FALSE)
write.csv(sgp2012, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2012.csv", row.names = FALSE)
write.csv(sgp2013, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2013.csv", row.names = FALSE)
write.csv(sgp2014, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2014.csv", row.names = FALSE)
write.csv(sgp2015, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2015.csv", row.names = FALSE)
write.csv(sgp2016, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2016.csv", row.names = FALSE)
write.csv(sgp2017, "D:/CEEW/Data/SGP_WLD/SGP_WLD_2017.csv", row.names = FALSE)

sgp1995 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_1995.csv")
sgp1996 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_1996.csv")
sgp1997 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_1997.csv")
sgp1998 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_1998.csv")
sgp1999 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_1999.csv")
sgp2000 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2000.csv")
sgp2001 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2001.csv")
sgp2002 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2002.csv")
sgp2003 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2003.csv")
sgp2004 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2004.csv")
sgp2005 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2005.csv")
sgp2006 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2006.csv")
sgp2007 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2007.csv")
sgp2008 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2008.csv")
sgp2009 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2009.csv")
sgp2010 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2010.csv")
sgp2011 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2011.csv")
sgp2012 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2012.csv")
sgp2013 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2013.csv")
sgp2014 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2014.csv")
sgp2015 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2015.csv")
sgp2016 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2016.csv")
sgp2017 <- read.csv("D:/CEEW/Data/SGP_WLD/SGP_WLD_2017.csv")
HSCode <- read.csv("D:/Ceew/Data/SGP_WLD_HSCode.csv")




SGP_WLD <- rbind(sgp1995, rbind(sgp1996, rbind(sgp1997, rbind(sgp1998, rbind(sgp1999, 
           rbind(sgp2000, rbind(sgp2001, rbind(sgp2002, rbind(sgp2003, rbind(sgp2004, 
           rbind(sgp2005, rbind(sgp2006, rbind(sgp2007, rbind(sgp2008, rbind(sgp2009, 
           rbind(sgp2010, rbind(sgp2011, rbind(sgp2012, rbind(sgp2013, rbind(sgp2014, 
           rbind(sgp2015, rbind(sgp2016, sgp2017))))))))))))))))))))))


HSCode <- c()
for( i in 1:NROW(SGP_WLD)){
  
  spl <- as.numeric(strsplit(as.character(SGP_WLD$hs_product_code[i]), "")[[1]])
  
  if(length(spl) == 5){
    #HSCode[i] = int(''.join(map(str,spl[1:6])))
    HSCode[i]  = as.numeric(paste(spl[1:1], collapse = ""))
    
    
  }else if(length(spl) == 6){
    #HSCode[i] = int(''.join(map(str,spl)))
    HSCode[i] = as.numeric(paste(spl[1:2], collapse = ""))
    
  }
  print(i)
}
write.csv(HSCode, "D:/Ceew/Data/SGP_WLD_HSCode.csv", row.names = FALSE)
HSCode <- read.csv("D:/Ceew/Data/SGP_WLD_HSCode.csv")


Industry_class <- c()
View(Industry_class)


for(i in 1:NROW(HSCode$x)){
  Industry_class[i] <- as.character(trade_2digit[trade_2digit$Product.Code == HSCode$x[i],3])
  print(i)
}


SGP_WLD$trade_code <- Industry_class

SGP_WLD$Industry_Class <- Industry_class
SGP_WLD <- SGP_WLD[, c(4,11,12,13,9,10,5,6,1,2,3,7,8,9)]
SGP_WLD <- SGP_WLD[,-3]


write.csv(SGP_WLD, "D:/Ceew/Data/SGP_WLD.csv", row.names = FALSE)




typeof(temp_sgp_wld$Industry_Class)
temp_sgp_wld$Industry_Class <- unlist(temp_sgp_wld$Industry_Class, use.names=FALSE)
#________________________________________________________________________________________________

SGP_WLD <- read.csv("D:/CEEW/Data/SGP_WLD.csv")
IndClass <- as.data.frame(table(unlist(trade_2digit$Industry.Class)))
names(IndClass)[names(IndClass) == "Var1"] <- "Industry_Class"
View(IndClass)

SGP_WLD_exp <- c()
SGP_WLD_imp <- c()

Ana_SGP_WLD <- data.frame(IndClass$Industry_Class)
names(Ana_SGP_WLD)[names(Ana_SGP_WLD) == "IndClass.Industry_Class"] <- "Industry_Class"

for(i in 1:NROW(IndClass)){
  SGP_WLD_exp[i] <- sum(SGP_WLD$export_value[SGP_WLD$year == 2017 & SGP_WLD$Industry_Class == IndClass$Industry_Class[i]], na.rm = TRUE)
  SGP_WLD_imp[i] <- sum(SGP_WLD$import_value[SGP_WLD$year == 2017 & SGP_WLD$Industry_Class == IndClass$Industry_Class[i]], na.rm = TRUE)
  Ana_SGP_WLD$Export_2017[i] <- SGP_WLD_exp[i]
  Ana_SGP_WLD$Import_2017[i] <- SGP_WLD_imp[i]
  print(i)
}
View(Ana_SGP_WLD)

value_added_SGP <- read.csv("D:/CEEW/Data/SGP_WLD/Value_Added.csv")
manuf_output_SGP <- read.csv("D:/CEEW/Data/SGp_WLD/Manufacturing Output.csv")


#within(IndClass, Industry_Class[Industry_Class == 'Refinery', ] <- 'Refineri')
data(SGP_WLD)


SGP_WLD <- SGP_WLD[, c(1,2,14,3,4,5,6,7,8,9,10,11,12,13)]

for(i in 1:NROW(manuf_output_SGP)){
  
  sub_manu <- subset(manuf_output_SGP, Trade_Data == HSCode$x[4], select = c())
  print(sub_manu)
}


write.csv(Ana_SGP_WLD, "D:/Ceew/Data/SGP_WLD/Analysis_SGP_WLD.csv", row.names = FALSE)
