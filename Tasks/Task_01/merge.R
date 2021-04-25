

total_china_trade <- rbind(China_trade1995, rbind(China_trade1996, rbind(China_trade1997, rbind(China_trade1998, rbind(China_trade1999, rbind(China_trade2000, rbind(China_trade2001, rbind(China_trade2002,  rbind(China_trade2003, rbind(China_trade2004, rbind(China_trade2005, rbind(China_trade2006, rbind(China_trade2007, rbind(China_trade2008, rbind(China_trade2009, rbind(China_trade2010, rbind(China_trade2011, rbind(China_trade2012, 
        rbind(China_trade2013, China_trade2014)))))))))))))))))))

#View(total_china_trade)

write.csv(total_china_trade,
          "D:/CEEW/Data/Data_Summary/China_trade_summary.csv", row.names = FALSE)


total_ASEAN_trade <- rbind(ASEAN_trade1995, rbind(ASEAN_trade1996, rbind(ASEAN_trade1997, rbind(ASEAN_trade1998, rbind(ASEAN_trade1999, rbind(ASEAN_trade2000, rbind(ASEAN_trade2001, rbind(ASEAN_trade2002, rbind(ASEAN_trade2003, rbind(ASEAN_trade2004, rbind(ASEAN_trade2005, rbind(ASEAN_trade2006, rbind(ASEAN_trade2007, rbind(ASEAN_trade2008, rbind(ASEAN_trade2009, rbind(ASEAN_trade2010, rbind(ASEAN_trade2011, rbind(ASEAN_trade2012, 
                  rbind(ASEAN_trade2013, rbind(ASEAN_trade2014, rbind(ASEAN_trade2015, rbind(ASEAN_trade2016, ASEAN_trade2017))))))))))))))))))))))


write.csv(total_ASEAN_trade,
          "D:/CEEW/Data/Data_Summary/ASEAN_trade_summary.csv", row.names = FALSE)


China_trade_15_17 <- rbind(China_trade2015, rbind(China_trade2016, China_trade2017))

write.csv(China_trade_15_17,
          "D:/CEEW/Data/Data_Summary/China_trade_2_summary.csv", row.names = FALSE)

ASEAN_trade_15_17 <- rbind(ASEAN_trade2015, rbind(ASEAN_trade2016, ASEAN_trade2017))
write.csv(ASEAN_trade_15_17,
          "D:/CEEW/Data/Data_Summary/ASEAN_trade_2_summary.csv", row.names = FALSE)


#____________________________________________________________________-

library(readr)
china_1 <- read.csv("D:/CEEW/Data/Data_Summary/ASEAN_trade_summary.csv")
china_2 <- read.csv("D:/CEEW/Data/Data_Summary/ASEAN_trade_2_summary.csv")

ch <- rbind(china_1, china_2)
write.csv(ch,
          "D:/CEEW/Data/Data_Summary/ASEAN.csv", row.names = FALSE)

#______________________________________________________________________________


tot_CHN_ASEAn <- rbind(china_ASEAN_trade1995, rbind(china_ASEAN_trade1996, rbind(china_ASEAN_trade1997, 
        rbind(china_ASEAN_trade1998, rbind(china_ASEAN_trade1999, rbind(china_ASEAN_trade2000, 
        rbind(china_ASEAN_trade2001, rbind(china_ASEAN_trade2002, rbind(china_ASEAN_trade2003, 
        rbind(china_ASEAN_trade2004, rbind(china_ASEAN_trade2005, rbind(china_ASEAN_trade2006, 
        rbind(china_ASEAN_trade2007, rbind(china_ASEAN_trade2008, rbind(china_ASEAN_trade2009, 
        rbind(china_ASEAN_trade2010, rbind(china_ASEAN_trade2011, rbind(china_ASEAN_trade2012, 
       rbind(china_ASEAN_trade2013, rbind(china_ASEAN_trade2014, rbind(china_ASEAN_trade2015, 
        rbind(china_ASEAN_trade2016, china_ASEAN_trade2017))))))))))))))))))))))


write.csv(tot_CHN_ASEAn,
          "D:/CEEW/Data/Data_Summary/IND_SGP_CHN/CHN_ASEAN.csv", row.names = FALSE)
#View(tot_CHN_ASEAn)
