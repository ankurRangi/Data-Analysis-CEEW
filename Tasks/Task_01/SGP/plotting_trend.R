

y <- subset(ind_sgp, hs_product_code == ind_sgp_table$hs_product_code[2125], 
            select = c("year", "hs_product_code", "export_value", "import_value"))

ggplot(y, aes(year)) + 
  geom_point(aes(year,export_value)) +
  geom_point(aes(year,import_value), colour = "red") +
  geom_line(aes(year,export_value), colour = "black") +
  geom_line(aes(year,import_value), colour = "red")+
  xlab("Year of Trade") + 
  ylab("Total Value of tade in the particular year")


