
Ana_SGP_WLD <- read.csv("D:/CEEW/Data/SGP_WLD/Analysis_SGP_WLD.csv")
manuf_output_SGP <- read.csv("D:/CEEW/Data/SGP_WLD/Manufacturing Output.csv")
value_added_SGP <- read.csv("D:/CEEW/Data/SGP_WLD/Value_Added.csv")


manuf <- c()
for(i in 1:NROW(manuf_output_SGP)){
  
  subs <- subset(manuf_output_SGP, Trade_Data == toString(Ana_SGP_WLD$Industry_Class[i]))
 
  if(NROW(subs) >= 2){
    subs$X2010 <- gsub(",","",subs$X2010)
    subs$X2011 <- gsub(",","",subs$X2011)
    subs$X2012 <- gsub(",","",subs$X2012)
    subs$X2013 <- gsub(",","",subs$X2013)
    subs$X2014 <- gsub(",","",subs$X2014)
    subs$X2015 <- gsub(",","",subs$X2015)
    subs$X2016 <- gsub(",","",subs$X2016)
    subs$X2017 <- gsub(",","",subs$X2017)

    subs$X2010 <- sum(as.numeric(subs$X2010))
    subs$X2011 <- sum(as.numeric(subs$X2011))
    subs$X2012 <- sum(as.numeric(subs$X2012))
    subs$X2013 <- sum(as.numeric(subs$X2013))
    subs$X2014 <- sum(as.numeric(subs$X2014))
    subs$X2015 <- sum(as.numeric(subs$X2015))
    subs$X2016 <- sum(as.numeric(subs$X2016))
    subs$X2017 <- sum(as.numeric(subs$X2017))
  }
  if(NROW(subs) == 0){
    
    
    Trade_Data <- c(toString(Ana_SGP_WLD$Industry_Class[i]))
    X2010 <- c(0)
    X2011 <- c(0)
    X2012 <- c(0)
    X2013 <- c(0)
    X2014 <- c(0)
    X2015 <- c(0)
    X2016 <- c(0)
    X2017 <- c(0)
    
    subs <- data.frame(Trade_Data, X2010,X2011, X2012, X2013, X2014, X2015, X2016, X2017)
    
    manuf <- rbind(manuf, subs[1,])
    
  }else{
    
    manuf <- rbind(manuf, subs[1,])
  }
  
}
manuf <- manuf[-20:-22,]
write.csv(manuf, "D:/Ceew/Data/SGP_WLD/Manuf_SGP.csv", row.names = FALSE)



valueADD <- c()
for(i in 1:NROW(value_added_SGP)){
  
  subs <- subset(value_added_SGP, Trade_Data == toString(Ana_SGP_WLD$Industry_Class[i]))
  
  if(NROW(subs) >= 2){
    subs$X2010 <- gsub(",","",subs$X2010)
    subs$X2011 <- gsub(",","",subs$X2011)
    subs$X2012 <- gsub(",","",subs$X2012)
    subs$X2013 <- gsub(",","",subs$X2013)
    subs$X2014 <- gsub(",","",subs$X2014)
    subs$X2015 <- gsub(",","",subs$X2015)
    subs$X2016 <- gsub(",","",subs$X2016)
    subs$X2017 <- gsub(",","",subs$X2017)
    
    subs$X2010 <- sum(as.numeric(subs$X2010))
    subs$X2011 <- sum(as.numeric(subs$X2011))
    subs$X2012 <- sum(as.numeric(subs$X2012))
    subs$X2013 <- sum(as.numeric(subs$X2013))
    subs$X2014 <- sum(as.numeric(subs$X2014))
    subs$X2015 <- sum(as.numeric(subs$X2015))
    subs$X2016 <- sum(as.numeric(subs$X2016))
    subs$X2017 <- sum(as.numeric(subs$X2017))
  }
  if(NROW(subs) == 0){
    
    
    Trade_Data <- c(toString(Ana_SGP_WLD$Industry_Class[i]))
    X2010 <- c(0)
    X2011 <- c(0)
    X2012 <- c(0)
    X2013 <- c(0)
    X2014 <- c(0)
    X2015 <- c(0)
    X2016 <- c(0)
    X2017 <- c(0)
    
    subs <- data.frame(Trade_Data, X2010,X2011, X2012, X2013, X2014, X2015, X2016, X2017)
    
    valueADD <- rbind(valueADD, subs[1,])
    
  }else{
    
    valueADD <- rbind(valueADD, subs[1,])
  }
  
}
valueADD <- valueADD[-20:-22,]
write.csv(valueADD, "D:/Ceew/Data/SGP_WLD/ValueAdded_SGP.csv", row.names = FALSE)

#Now


Ana_SGP_WLD$Value_Added_2010 <- valueADD$X2010
Ana_SGP_WLD$Value_Added_2011 <- valueADD$X2011
Ana_SGP_WLD$Value_Added_2012 <- valueADD$X2012
Ana_SGP_WLD$Value_Added_2013 <- valueADD$X2013
Ana_SGP_WLD$Value_Added_2014 <- valueADD$X2014
Ana_SGP_WLD$Value_Added_2015 <- valueADD$X2015
Ana_SGP_WLD$Value_Added_2016 <- valueADD$X2016
Ana_SGP_WLD$Value_Added_2017 <- valueADD$X2017


Ana_SGP_WLD$Manufacturing_Output_2010 <- manuf$X2010
Ana_SGP_WLD$Manufacturing_Output_2011 <- manuf$X2011
Ana_SGP_WLD$Manufacturing_Output_2012 <- manuf$X2012
Ana_SGP_WLD$Manufacturing_Output_2013 <- manuf$X2013
Ana_SGP_WLD$Manufacturing_Output_2014 <- manuf$X2014
Ana_SGP_WLD$Manufacturing_Output_2015 <- manuf$X2015
Ana_SGP_WLD$Manufacturing_Output_2016 <- manuf$X2016
Ana_SGP_WLD$Manufacturing_Output_2017 <- manuf$X2017


Ana_SGP_WLD <- Ana_SGP_WLD[, c(1, 2,3,18,26, 4,5,19,27, 6,7,20,28, 8,9,21,29, 
                               10,11,22,30, 12,13,23,31, 14,15,24,32, 16,17,25,33)]





write.csv(Ana_SGP_WLD, "D:/Ceew/Data/SGP_WLD/Analysis_SGP_WLD.csv", row.names = FALSE)
#_________________________________________________________________________________________

Analysis_SGP_WLD <- read.csv("D:/CEEW/Data/SGP_WLD/Analysis_SGP_WLD.csv")
manuf <- read.csv("D:/CEEW/Data/SGP_WLD/Manuf_SGP.csv")
valueADD <- read.csv("D:/CEEW/Data/SGP_WLD/ValueAdded_SGP.csv")


ratio <- c()
for (i in 1:NROW(Analysis_SGP_WLD)){
  valueADD$X2017 <- gsub(",","",valueADD$X2017)
  manuf$X2017 <- gsub(",","",manuf$X2017)
  ratio[i] <- (as.numeric(as.character(valueADD$X2017[i])) / as.numeric(as.character(manuf$X2017[i])) * 100)
  if( is.na(ratio[i]) == TRUE){
    ratio[i] = 0
  }
}
#View(ratio)

Analysis_SGP_WLD$Value_Output_2017 <- ratio




Analysis_SGP_WLD <- Analysis_SGP_WLD[, c(1,2,3,4,5,34, 6,7,8,9,35, 10,11,12,13,36, 14,15,16,17,37, 18,19,20,21,38,
                                         22,23,24,25,39, 26,27,28,29,40, 30,31,32,33,41)]


write.csv(Analysis_SGP_WLD, "D:/Ceew/Data/SGP_WLD/Analysis_SGP_WLD.csv", row.names = FALSE)

#_________________________________________________________________________________________

#Plotting SGP_WLD Bar graph
library(tidyr)
library(ggplot2)

year <- c(2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017)



sb <- t(data.frame(t(as.numeric(as.character(Analysis_SGP_WLD[1,c(2,7,12,17,22,27,32,37)]))), 
                     t(as.numeric(as.character(Analysis_SGP_WLD[1, c(3,8,13,18,23,28,33,38)]))), 
                     t(as.numeric(as.character(Analysis_SGP_WLD[1,c(4,9,14,19,24,29,34,39)]))), 
                     t(as.numeric(as.character(Analysis_SGP_WLD[1,c(5,10,15,20,25,30,35,40)])))))

rownames(s2)[rownames(s2) == "Import_2010"] <- "2010"
rownames(s2)[rownames(s2) == "Import_2011"] <- "2011"
rownames(s2)[rownames(s2) == "Import_2012"] <- "2012"
rownames(s2)[rownames(s2) == "Import_2013"] <- "2013"
rownames(s2)[rownames(s2) == "Import_2014"] <- "2014"
rownames(s2)[rownames(s2) == "Import_2015"] <- "2015"
rownames(s2)[rownames(s2) == "Import_2016"] <- "2016"
rownames(s2)[rownames(s2) == "Import_2017"] <- "2017"

rownames(s3)[rownames(s3) == "Value_Added_2010"] <- "2010"
rownames(s3)[rownames(s3) == "Value_Added_2011"] <- "2011"
rownames(s3)[rownames(s3) == "Value_Added_2012"] <- "2012"
rownames(s3)[rownames(s3) == "Value_Added_2013"] <- "2013"
rownames(s3)[rownames(s3) == "Value_Added_2014"] <- "2014"
rownames(s3)[rownames(s3) == "Value_Added_2015"] <- "2015"
rownames(s3)[rownames(s3) == "Value_Added_2016"] <- "2016"
rownames(s3)[rownames(s3) == "Value_Added_2017"] <- "2017"

rownames(s4)[rownames(s4) == "Manufacturing_Output_2010"] <- "2010"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2011"] <- "2011"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2012"] <- "2012"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2013"] <- "2013"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2014"] <- "2014"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2015"] <- "2015"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2016"] <- "2016"
rownames(s4)[rownames(s4) == "Manufacturing_Output_2017"] <- "2017"



s1 <- t(data.frame(Analysis_SGP_WLD[1,c(2,7,12,17,22,27,32,37)]))
s2 <- t(data.frame(Analysis_SGP_WLD[1,c(3,8,13,18,23,28,33,38)]))
s3 <- t(data.frame(Analysis_SGP_WLD[1,c(4,9,14,19,24,29,34,39)]))
s4 <- t(data.frame(Analysis_SGP_WLD[1,c(5,10,15,20,25,30,35,40)]))

sb <- data.frame(year, s1, s2, s3, s4)


rownames(sb)[rownames(sb) == "Export_2010"] <- "2010"
rownames(sb)[rownames(sb) == "Export_2011"] <- "2011"
rownames(sb)[rownames(sb) == "Export_2012"] <- "2012"
rownames(sb)[rownames(sb) == "Export_2013"] <- "2013"
rownames(sb)[rownames(sb) == "Export_2014"] <- "2014"
rownames(sb)[rownames(sb) == "Export_2015"] <- "2015"
rownames(sb)[rownames(sb) == "Export_2016"] <- "2016"
rownames(sb)[rownames(sb) == "Export_2017"] <- "2017"

names(sb)[names(sb) == "X1"] <- "Export_Value"
names(sb)[names(sb) == "X1.1"] <- "Import_Value"
names(sb)[names(sb) == "X1.2"] <- "Value_Added"
names(sb)[names(sb) == "X1.3"] <- "Manufacturing_Output"



mx <- t(as.matrix(sb[-1]))
colnames(mx) <- sb$year


rownames(mx)[rownames(mx) == "X1"] <- "Export_Value"
rownames(mx)[rownames(mx) == "X1.1"] <- "Import_Value"
rownames(mx)[rownames(mx) == "X1.2"] <- "Value_Added"
rownames(mx)[rownames(mx) == "X1.3"] <- "Manufacturing_Output"

title <- toString(Analysis_SGP_WLD$Industry_Class[i])

colours = c("red","blue", "green", "black")
barplot(mx, main=title, ylab='Value in US Dollors', xlab='Year',beside = TRUE, 
        col=colours)

box()

# add a legend
legend('topright',fill=colours,legend=c('OriginalEstimate','TimeSpent'))













