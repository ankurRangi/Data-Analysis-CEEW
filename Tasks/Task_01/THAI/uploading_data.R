#File created -> ind_asean, chn_asean, 
# ind_sgp, chn_sgp, ind_sgp_table, chn_sgp_table

library(readr)

ind_asean <- read.csv("D:/CEEW/Data/Data_Summary/IND_ASEAN.csv")
chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

ind_thai <- subset(ind_asean, partner_code == "THA")
chn_thai <- subset(chn_asean, partner_code == "THA")

ind_thai_table <- as.data.frame(table(unlist(ind_thai$hs_product_code)))
chn_thai_table <- as.data.frame(table(unlist(chn_thai$hs_product_code)))
#Sorting by the frequency
ind_thai_table <- ind_thai_table[with(ind_thai_table, order(-Freq)),]
chn_thai_table <- chn_thai_table[with(chn_thai_table, order(-Freq)),]

names(ind_thai_table)[names(ind_thai_table) == "Var1"] <- "hs_product_code"
names(chn_thai_table)[names(chn_thai_table) == "Var1"] <- "hs_product_code"

for (i in 1:NROW(ind_thai_table$hs_product_code)){
  #exp <- subset(ind_thai, hs_product_code == ind_thai_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(ind_thai, hs_product_code == ind_thai_table$hs_product_code[i], select = c("import_value"))
  #tot_sum_ind <- sum(exp)
  tot_sum_ind_imp <- sum(imp)
  
  #ind_thai_table$export_value[i] <- tot_sum_ind
  ind_thai_table$import_value[i] <- tot_sum_ind_imp
  print(i)
}

for (i in 1:NROW(chn_thai_table$hs_product_code)){
  #exp <- subset(chn_thai, hs_product_code == chn_thai_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(chn_thai, hs_product_code == chn_thai_table$hs_product_code[i], select = c("import_value"))
  #tot_sum_chn <- sum(exp)
  tot_sum_chn_imp <- sum(imp)
  
  
  #chn_thai_table$export_value[i] <- tot_sum_chn
  chn_thai_table$import_value[i] <- tot_sum_chn_imp
  print(i)
}

write.csv(ind_thai, "D:/CEEW/Data/Data_Summary/THAI/IND_THAI.csv", row.names = FALSE)
write.csv(chn_thai, "D:/CEEW/Data/Data_Summary/THAI/CHN_THAI.csv", row.names = FALSE)
write.csv(ind_thai_table, "D:/CEEW/Data/Data_Summary/THAI/IND_THAI_table.csv", row.names = FALSE)
write.csv(chn_thai_table, "D:/CEEW/Data/Data_Summary/THAI/CHN_THAI_table.csv", row.names = FALSE)





