#Comparing the data with singapore Imports data,

library("xlsx")

singapore_imports_s1 <- read.xlsx2("D:/CEEW/Data/Singapore Imports.xlsx", 1, header = TRUE)
singapore_imports_s2 <- read.xlsx2("D:/CEEW/Data/Singapore Imports.xlsx", 2, header = TRUE)
names(singapore_imports_s1)[names(singapore_imports_s1) == "HSCode"] <- "hs_product_code"
names(singapore_imports_s2)[names(singapore_imports_s2) == "HSCode"] <- "hs_product_code"

d2016 <- subset(ind_sgp, year == "2016", select = c("year","export_value", "import_value", "hs_product_code"))
d16_17 <- merge(d2016, d2017, by = "hs_product_code")

#Renaming Columns
names(d16_17)[names(d16_17) == "year.x"] <- "year_2016"
names(d16_17)[names(d16_17) == "export_value.x"] <- "export_value_2016"
names(d16_17)[names(d16_17) == "import_value.x"] <- "import_value_2016"

names(d16_17)[names(d16_17) == "year.y"] <- "year_2017"
names(d16_17)[names(d16_17) == "export_value.y"] <- "export_value_2017"
names(d16_17)[names(d16_17) == "import_value.y"] <- "import_value_2017"


compImport <- c()
for( i in 1:NROW(d16_17)){
  
  c1 <- (d16_17$import_value_2017[i] / d16_17$import_value_2016[i])
  compImport[i] <- ( c1 ^ (1/2)) - 1
}

d16_17$Import_Growth_2017 <- compImport
d16_17$Import_Growth_2017 <- d16_17$Import_Growth_2017*100

#All the data have been imported for comparing,
#Now we need to trim the 8 digit HS code to 6 Digit in order to compare.

HSCode <- c()
for( i in 1:4182){
  
  spl <- as.numeric(strsplit(as.character(singapore_imports_s1$hs_product_code[i]), "")[[1]])
  if(length(spl) > 6){
    #HSCode[i] = int(''.join(map(str,spl[1:6])))
    HSCode[i]  = as.numeric(paste(spl[1:6], collapse = ""))
     
  }else{
    #HSCode[i] = int(''.join(map(str,spl)))
    HSCode[i] = as.numeric(paste(spl, collapse = ""))
    
  }
  
}

singapore_imports_s1<- singapore_imports_s1[-4183:-4185,]
singapore_imports_s1$hs_product_code <- HSCode


#Singapore Imports have been made comparable.

comp_sing_har <- merge(singapore_imports_s1, d16_17, by = "hs_product_code")
comp_sing_har <- comp_sing_har[,c(1,2,3,4,5,7,8,9,10,11,12,6,13)]

write.csv(comp_sing_har, "D:/CEEW/Data/Data_Summary/IND_SGP_CHN/Comparing_Singapore_Improrts.csv", row.names = FALSE)
sing <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/Comparing_Singapore_Improrts.csv")

print(sum(sing$im))
print(sum(sing$Import_Growth_2017))
#________________________________________________________________________________________________

library(ggplot2)
library(reshape2)
extracted_codes <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/Exp_Imp_CAGR_10_13_17_v2.csv")
chn_sgp <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/CHN_SGP.csv")
ind_sgp <- read.csv("D:/CEEW/Data/Data_Summary/IND_SGP_CHN/IND_SGP.csv")
chn_sgp_exp_codes <- subset(chn_sgp, hs_product_code %in% extracted_codes$hs_product_code
                            , select = c( "year", "hs_product_code", "export_value" ))
ind_sgp_imp_codes <- subset(ind_sgp, hs_product_code %in% extracted_codes$hs_product_code
                            , select = c( "year", "hs_product_code", "import_value" ))



for(i in 1:NROW(extracted_codes)){
  hs_chn <- subset(chn_sgp_exp_codes, hs_product_code == extracted_codes$hs_product_code[6])
  hs_ind <- subset(ind_sgp_imp_codes, hs_product_code == extracted_codes$hs_product_code[6])
  print(extracted_codes$hs_product_code[6])
  hs <- merge(hs_chn, hs_ind, by = "year", all = TRUE)
  #hs[is.na(hs)] <- 0
  hs[hs == 0] <- NA
  hs <- hs[,-2]
  hs <- hs[,-3]
  title = "Trade for HS_Code: "
  title = paste(title, extracted_codes$hs_product_code[6], collapse = "")

  sb <- t(data.frame(hs$export_value, hs$import_value))
  
  barplot(sb, col=c("red", "blue4"), main = title, xlab = "Years", ylab = "Trade Value in US Dollors", 
          legend = c("CHN's Exports to SGP", "SGP's Exports to IND"), 
          args.legend = list( x = "topleft", cex = .45),
          names.arg=hs$year, beside=TRUE)
  
  
}




print()








ggplot(data = hs %>% gather(Variable, export_value, import_value),
       aes(x = year, y = Hours, fill = Variable)) + 
  geom_bar(stat = 'identity', position = 'dodge')

ggplot(data = hs) + 
  geom_bar( aes(import_value, export_value), width=0.4, colour = "red", stat = 'identity', position = position_dodge(width=0.1))+
  #geom_bar( aes(year, import_value), width=0.4, colour = "blue", stat = 'identity', position = position_dodge(width=0.1))
  
  ggplot(hs) + 
  geom_bar(aes(x=year, y=export_value), width = 0.5, colour = "red", stat="identity", position = position_dodge(width=0.2)) + 
  geom_bar(aes(x=year, y=import_value), width = 0.5, stat="identity", position = position_dodge(width=0.2)) +
  labs(x="Years", y="Trade Value")


