library(ggplot2)

ind_asean <- read.csv("D:/CEEW/Data/_WLD/IND_ASEAN.csv")
ind_asean <- subset(ind_asean, year >= 2007 & year <= 2017, select = c("year", "hs_product_code",
                   "partner_code", "export_value", "import_value"))
HScode <- c(HScode = c(floor(ind_asean$hs_product_code/100)))

ind_asean$HScode <- HScode
inter <- c(7203, 7205, 7206, 7207, 7218, 7224)
prod <- c(7208, 7209, 7210, 7211, 7212, 7213, 7214, 7215, 7216, 7217, 7219, 7220, 7221, 7222, 7223,
          7225, 7226, 7227, 7228, 7229)

ore <- subset(ind_asean, HScode == 7201)
scrap <- subset(ind_asean, HScode == 7204)
intermediate <- subset(ind_asean, HScode %in% inter)
product <- subset(ind_asean, HScode %in% prod)

year <- unique(c(ore$year))

yexport <- c()
yimport <- c()

for(i in 1:NROW(year)){
  yexport[i] <- sum(ore$export_value[ore$year == year[i]])
  yimport[i] <- sum(ore$import_value[ore$year == year[i]])
  
}
ore_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(scrap$export_value[scrap$year == year[i]])
  yimport[i] <- sum(scrap$import_value[scrap$year == year[i]])
  
}
scrap_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(intermediate$export_value[intermediate$year == year[i]])
  yimport[i] <- sum(intermediate$import_value[intermediate$year == year[i]])
  
}
intermediate_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(product$export_value[product$year == year[i]])
  yimport[i] <- sum(product$import_value[product$year == year[i]])
  
}
product_dat <- data.frame(year, yexport, yimport)


ore_dat$yexport <- ore_dat$yexport/ 1000000
ore_dat$yimport <- ore_dat$yimport/ 1000000

ggplot(ore_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Ore Trade Trend (IND-ASEAN)")

scrap_dat$yexport <- scrap_dat$yexport/ 1000000
scrap_dat$yimport <- scrap_dat$yimport/ 1000000

ggplot(scrap_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Scrap Trade Trend (IND-ASEAN)")


intermediate_dat$yexport <- intermediate_dat$yexport/ 1000000
intermediate_dat$yimport <- intermediate_dat$yimport/ 1000000

ggplot(intermediate_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Intermediate Trade Trend (IND-ASEAN)")


product_dat$yexport <- product_dat$yexport/ 1000000
product_dat$yimport <- product_dat$yimport/ 1000000

ggplot(product_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Product Trade Trend (IND-ASEAN)")
#______________________________

chn_asean <- read.csv("D:/CEEW/Data/_WLD/CHN_ASEAN.csv")
chn_asean <- subset(chn_asean, year >= 2007 & year <= 2017, select =c("year", "hs_product_code",
                                                                                "partner_code", "export_value", "import_value"))
HScode_2 <- c(HScode = c(floor(chn_asean$hs_product_code/100)))
chn_asean$HScode <- HScode_2

oreC <- subset(chn_asean, HScode == 7201)
scrapC <- subset(chn_asean, HScode == 7204)
intermediateC <- subset(chn_asean, HScode %in% inter)
productC <- subset(chn_asean, HScode %in% prod)

year <- unique(c(oreC$year))

yexport <- c()
yimport <- c()




for(i in 1:NROW(year)){
  yexport[i] <- sum(oreC$export_value[oreC$year == year[i]])
  yimport[i] <- sum(oreC$import_value[oreC$year == year[i]])
  
}
oreC_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(scrapC$export_value[scrapC$year == year[i]])
  yimport[i] <- sum(scrapC$import_value[scrapC$year == year[i]])
  
}
scrapC_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(intermediateC$export_value[intermediateC$year == year[i]])
  yimport[i] <- sum(intermediateC$import_value[intermediateC$year == year[i]])
  
}
intermediateC_dat <- data.frame(year, yexport, yimport)

yexport <- c()
yimport <- c()
for(i in 1:NROW(year)){
  yexport[i] <- sum(productC$export_value[productC$year == year[i]])
  yimport[i] <- sum(productC$import_value[productC$year == year[i]])
  
}
productC_dat <- data.frame(year, yexport, yimport)


oreC_dat$yexport <- oreC_dat$yexport/ 1000000
oreC_dat$yimport <- oreC_dat$yimport/ 1000000

ggplot(oreC_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Ore Trade Trend (CHN-ASEAN)")

scrapC_dat$yexport <- scrapC_dat$yexport/ 1000000
scrapC_dat$yimport <- scrapC_dat$yimport/ 1000000

ggplot(scrapC_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Scrap Trade Trend (CHN-ASEAN)")


intermediateC_dat$yexport <- intermediateC_dat$yexport/ 1000000
intermediateC_dat$yimport <- intermediateC_dat$yimport/ 1000000

ggplot(intermediateC_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Intermediate Trade Trend (CHN-ASEAN)")


productC_dat$yexport <- productC_dat$yexport/ 1000000
productC_dat$yimport <- productC_dat$yimport/ 1000000

ggplot(productC_dat, aes(year, yimport)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, yexport), size = 1, alpha = 0.8,) +
  geom_point(aes(year, yexport)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("Product Trade Trend (CHN-ASEAN)")
#______________________

asean_imp <- intermediate_dat$yimport + product_dat$yimport
chn_exp <- intermediateC_dat$yexport + productC_dat$yexport

ind_chn_dat <- data.frame(c(year), c(asean_imp), c(chn_exp))

ggplot(ind_chn_dat, aes(year, asean_imp)) + 
  geom_point() + 
  geom_line(size = 1, alpha = 0.8, color='steelblue')  +
  geom_line(aes(year, chn_exp), size = 1, alpha = 0.8,) +
  geom_point(aes(year, chn_exp)) +
  scale_color_brewer(name = "Query", palette = "Set1") +
  xlab("Year") + 
  ylab("Value USD Million") + 
  ggtitle("IND_ASEAN_CHN")


write.csv(ind_chn_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_IND_CHN.csv", row.names = TRUE)
write.csv(ore_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_IND_Ore.csv", row.names = TRUE)
write.csv(scrap_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_IND_scrap.csv", row.names = TRUE)
write.csv(intermediate_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_IND_Intermediate.csv", row.names = TRUE)
write.csv(product_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_IND_Product.csv", row.names = TRUE)


write.csv(oreC_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_CHN_Ore.csv", row.names = TRUE)
write.csv(scrap_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_CHN_scrap.csv", row.names = TRUE)
write.csv(intermediateC_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_CHN_Intermediate.csv", row.names = TRUE)
write.csv(productC_dat, "D:/CEEW/Data/Analysis/Iron_Steel_india/Trend_CHN_Product.csv", row.names = TRUE)

