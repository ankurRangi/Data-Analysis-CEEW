#File created -> ind_asean, chn_asean, 
# ind_sgp, chn_sgp, ind_sgp_table, chn_sgp_table

library(readr)

ind_asean <- read.csv("D:/CEEW/Data/Data_Summary/IND_ASEAN.csv")
chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

ind_sgp <- subset(ind_asean, partner_code == "SGP")
chn_sgp <- subset(chn_asean, partner_code == "SGP")

ind_sgp_table <- as.data.frame(table(unlist(ind_sgp$hs_product_code)))
chn_sgp_table <- as.data.frame(table(unlist(chn_sgp$hs_product_code)))
#Sorting by the frequency
ind_sgp_table <- ind_sgp_table[with(ind_sgp_table, order(-Freq)),]
chn_sgp_table <- chn_sgp_table[with(chn_sgp_table, order(-Freq)),]

names(ind_sgp_table)[names(ind_sgp_table) == "Var1"] <- "hs_product_code"
names(chn_sgp_table)[names(chn_sgp_table) == "Var1"] <- "hs_product_code"

for (i in 1:NROW(ind_sgp_table$hs_product_code)){
  exp <- subset(ind_sgp, hs_product_code == ind_sgp_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(ind_sgp, hs_product_code == ind_sgp_table$hs_product_code[i], select = c("import_value"))
  tot_sum_ind <- sum(exp)
  tot_sum_ind_imp <- sum(imp)
  
  ind_sgp_table$export_value[i] <- tot_sum_ind
  ind_sgp_table$import_value[i] <- tot_sum_ind_imp
  print(i)
}

for (i in 1:NROW(chn_sgp_table$hs_product_code)){
  exp <- subset(chn_sgp, hs_product_code == chn_sgp_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(chn_sgp, hs_product_code == chn_sgp_table$hs_product_code[i], select = c("import_value"))
  tot_sum_chn <- sum(exp)
  tot_sum_chn_imp <- sum(imp)
  
  
  chn_sgp_table$export_value[i] <- tot_sum_chn
  chn_sgp_table$import_value[i] <- tot_sum_chn_imp
  print(i)
}





