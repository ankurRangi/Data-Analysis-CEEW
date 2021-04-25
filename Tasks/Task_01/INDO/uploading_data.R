#File created -> ind_asean, chn_asean, 
# ind_sgp, chn_sgp, ind_sgp_table, chn_sgp_table

library(readr)

ind_asean <- read.csv("D:/CEEW/Data/Data_Summary/IND_ASEAN.csv")
chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

ind_indo <- subset(ind_asean, partner_code == "IDN")
chn_indo <- subset(chn_asean, partner_code == "IDN")

ind_indo_table <- as.data.frame(table(unlist(ind_indo$hs_product_code)))
chn_indo_table <- as.data.frame(table(unlist(chn_indo$hs_product_code)))
#Sorting by the frequency
ind_indo_table <- ind_indo_table[with(ind_indo_table, order(-Freq)),]
chn_indo_table <- chn_indo_table[with(chn_indo_table, order(-Freq)),]

names(ind_indo_table)[names(ind_indo_table) == "Var1"] <- "hs_product_code"
names(chn_indo_table)[names(chn_indo_table) == "Var1"] <- "hs_product_code"

for (i in 1:NROW(ind_indo_table$hs_product_code)){
  exp <- subset(ind_indo, hs_product_code == ind_indo_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(ind_indo, hs_product_code == ind_indo_table$hs_product_code[i], select = c("import_value"))
  tot_sum_ind <- sum(exp)
  tot_sum_ind_imp <- sum(imp)
  
  ind_indo_table$export_value[i] <- tot_sum_ind
  ind_indo_table$import_value[i] <- tot_sum_ind_imp
  print(i)
}

for (i in 1:NROW(chn_indo_table$hs_product_code)){
  exp <- subset(chn_indo, hs_product_code == chn_indo_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(chn_indo, hs_product_code == chn_indo_table$hs_product_code[i], select = c("import_value"))
  tot_sum_chn <- sum(exp)
  tot_sum_chn_imp <- sum(imp)
  
  
  chn_indo_table$export_value[i] <- tot_sum_chn
  chn_indo_table$import_value[i] <- tot_sum_chn_imp
  print(i)
}

write.csv(ind_indo, "D:/CEEW/Data/Data_Summary/INDO/IND_INDO.csv", row.names = FALSE)
write.csv(chn_indo, "D:/CEEW/Data/Data_Summary/INDO/CHN_INDO.csv", row.names = FALSE)
write.csv(ind_indo_table, "D:/CEEW/Data/Data_Summary/INDO/IND_INDO_table.csv", row.names = FALSE)
write.csv(chn_indo_table, "D:/CEEW/Data/Data_Summary/INDO/CHN_INDO_table.csv", row.names = FALSE)





