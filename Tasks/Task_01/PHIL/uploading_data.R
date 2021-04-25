#File created -> ind_asean, chn_asean, 
# ind_sgp, chn_sgp, ind_sgp_table, chn_sgp_table

library(readr)

ind_asean <- read.csv("D:/CEEW/Data/Data_Summary/IND_ASEAN.csv")
chn_asean <- read.csv("D:/CEEW/Data/Data_Summary/CHN_ASEAN.csv")

ind_phil <- subset(ind_asean, partner_code == "PHL")
chn_phil <- subset(chn_asean, partner_code == "PHL")

ind_phil_table <- as.data.frame(table(unlist(ind_phil$hs_product_code)))
chn_phil_table <- as.data.frame(table(unlist(chn_phil$hs_product_code)))
#Sorting by the frequency
ind_phil_table <- ind_phil_table[with(ind_phil_table, order(-Freq)),]
chn_phil_table <- chn_phil_table[with(chn_phil_table, order(-Freq)),]

names(ind_phil_table)[names(ind_phil_table) == "Var1"] <- "hs_product_code"
names(chn_phil_table)[names(chn_phil_table) == "Var1"] <- "hs_product_code"

for (i in 1:NROW(ind_phil_table$hs_product_code)){
  #exp <- subset(ind_phil, hs_product_code == ind_phil_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(ind_phil, hs_product_code == ind_phil_table$hs_product_code[i], select = c("import_value"))
  #tot_sum_ind <- sum(exp)
  tot_sum_ind_imp <- sum(imp)
  
  #ind_phil_table$export_value[i] <- tot_sum_ind
  ind_phil_table$import_value[i] <- tot_sum_ind_imp
  print(i)
}

for (i in 1:NROW(chn_phil_table$hs_product_code)){
  #exp <- subset(chn_phil, hs_product_code == chn_phil_table$hs_product_code[i], select = c("export_value"))
  imp <- subset(chn_phil, hs_product_code == chn_phil_table$hs_product_code[i], select = c("import_value"))
  #tot_sum_chn <- sum(exp)
  tot_sum_chn_imp <- sum(imp)
  
  
  #chn_phil_table$export_value[i] <- tot_sum_chn
  chn_phil_table$import_value[i] <- tot_sum_chn_imp
  print(i)
}

write.csv(ind_phil, "D:/CEEW/Data/Data_Summary/PHIL/IND_PHIL.csv", row.names = FALSE)
write.csv(chn_phil, "D:/CEEW/Data/Data_Summary/PHIL/CHN_PHIL.csv", row.names = FALSE)
write.csv(ind_phil_table, "D:/CEEW/Data/Data_Summary/PHIL/IND_PHIL_table.csv", row.names = FALSE)
write.csv(chn_phil_table, "D:/CEEW/Data/Data_Summary/PHIL/CHN_PHIL_table.csv", row.names = FALSE)





