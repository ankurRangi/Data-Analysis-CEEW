

library(readxl)
indonesia1     <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 1)
indonesia2     <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 2)
indonesia3     <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 3)

singapore1     <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 1)
singapore2     <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 2)
singapore3     <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 3)


malaysia1      <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 1)
malaysia2      <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 2)
malaysia3      <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 3)

thailand1      <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 1)
thailand2      <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 2)
thailand3      <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 3)

vietnam1       <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 1)
vietnam2       <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 2)
vietnam3       <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 3)

philippines1  <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 1)
philippines2  <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 2)
philippines3  <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 3)

brunie1        <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 1)
brunie2        <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 2)
brunie3        <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 3)

laos1          <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 1)
laos2          <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 2)
laos3          <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 3)

cambodia1      <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 1)
cambodia2      <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 2)
cambodia3      <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 3)

myanmar1       <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 1)
myanmar2       <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 2)
myanmar3       <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 3)



indonesia1[is.na(indonesia1)] <- 0
singapore1[is.na(singapore1)] <- 0
malaysia1[is.na(malaysia1)] <- 0
thailand1[is.na(thailand1)] <- 0
vietnam1[is.na(vietnam1)] <- 0
philippines1[is.na(philippines1)] <- 0
brunie1[is.na(brunie1)] <- 0
laos1[is.na(laos1)] <- 0
cambodia1[is.na(cambodia1)] <- 0
myanmar1[is.na(myanmar1)] <- 0

indonesia2[is.na(indonesia2)] <- 0
singapore2[is.na(singapore2)] <- 0
malaysia2[is.na(malaysia2)] <- 0
thailand2[is.na(thailand2)] <- 0
vietnam2[is.na(vietnam2)] <- 0
philippines2[is.na(philippines2)] <- 0
brunie2[is.na(brunie2)] <- 0
laos2[is.na(laos2)] <- 0
cambodia2[is.na(cambodia2)] <- 0
myanmar2[is.na(myanmar2)] <- 0

indonesia3[is.na(indonesia3)] <- 0
singapore3[is.na(singapore3)] <- 0
malaysia3[is.na(malaysia3)] <- 0
thailand3[is.na(thailand3)] <- 0
vietnam3[is.na(vietnam3)] <- 0
philippines3[is.na(philippines3)] <- 0
brunie3[is.na(brunie3)] <- 0
laos3[is.na(laos3)] <- 0
cambodia3[is.na(cambodia3)] <- 0
myanmar3[is.na(myanmar3)] <- 0


HSCode <- c()
for( i in 1:NROW(vietnam1)){
  
  spl <- as.numeric(strsplit(as.character(vietnam1$HSCode[i]), "")[[1]])
  if(length(spl) > 6){
    #HSCode[i] = int(''.join(map(str,spl[1:6])))
    HSCode[i]  = as.numeric(paste(spl[1:6], collapse = ""))
    
  }else{
    #HSCode[i] = int(''.join(map(str,spl)))
    HSCode[i] = as.numeric(paste(spl, collapse = ""))
    
  }
  
}
vietnam1$HSCode_2 <- HSCode



indo_list <- c(indonesia1$HSCode_2, indonesia2$HSCode_2, indonesia3$HSCode_2)
sing_list <- c(singapore1$HSCode_2, singapore2$HSCode_2, singapore3$HSCode_2)
mala_list <- c(malaysia1$HSCode_2, malaysia2$HSCode_2, malaysia3$HSCode_2)
thai_list <- c(thailand1$HSCode_2, thailand2$HSCode_2, thailand3$HSCode_2)
viet_list <- c(vietnam1$HSCode_2, vietnam2$HSCode_2, vietnam3$HSCode_2)
phil_list <- c(philippines1$HSCode_2, philippines2$HSCode_2, philippines3$HSCode_2)
brun_list <- c(brunie1$HSCode_2, brunie2$HSCode_2, brunie3$HSCode_2)
laos_list <- c(laos1$HSCode_2, laos2$HSCode_2, laos3$HSCode_2)
camb_list <- c(cambodia1$HSCode_2, cambodia2$HSCode_2, cambodia3$HSCode_2)
myan_list <- c(myanmar1$HSCode_2, myanmar2$HSCode_2, myanmar3$HSCode_2)


commonlist <- Reduce(intersect, list(indo_list, sing_list, mala_list, thai_list, viet_list, phil_list, brun_list, 
                                     laos_list, camb_list, myan_list))


hslist <- unique(c(indo_list, sing_list, mala_list, thai_list, viet_list, phil_list, brun_list, 
                   laos_list, camb_list, myan_list))


country_list <- c("indonesia", "singapore", "malaysia", "thailand", "vietnam", "phlippines", "brunie", 
                  "laos", "cambodia", "myanmar")



count <- as.list(rep(0, NROW(hslist)))
xyz <- as.list(rep(0, NROW(hslist)))
for(i in 1:NROW(hslist)){
  if (length(brunie3$`%Growth`[brunie3$HSCode_2 == hslist[i]]) != 0 &
      brunie3$`%Growth`[brunie3$HSCode_2 == hslist[i]] > 0.0){
    xyz[i] <- as.numeric(xyz[i]) + 1
  }else{
    xyz[i] <- 0
  }
}

count<- as.numeric(count)
View(count)
View(abc_list)
abc_list <- data.frame(cbind(hslist, count))
abc_list <- abc_list[with(abc_list, order(-count)), ]

abc_list_2 <- subset(abc_list, count > 0)
write.csv(abc_list_2, "D:/CEEW/Data/Task_03/Final_HScodes.csv", row.names = TRUE)


hslist <- read_xlsx("D:/CEEW/Data/Task_03/Final_HScodes.xlsx", 1)
hslist$twodigit <- floor(hslist$twodigit)

dataset <- data.frame(c(hslist$hslist), c(hslist$count), c(hslist$twodigit))

indonesia
singapore
malaysia
thailand
vietnam
philippines
brunie
laos
cambodia
myanmar


col17 <- c()
col18 <- c()
col19 <- c()
for (i in 1:NROW(dataset)){
  
  if(length( myanmar1$`2016-2017`[myanmar1$HSCode_2 == dataset$c.hslist.hslist.[i]]) != 0){
    col17[i] <- myanmar1$`2016-2017`[myanmar1$HSCode_2 == dataset$c.hslist.hslist.[i]]
  }else{
    col17[i] <- 0.0
  }
  
  if(length(myanmar2$`2018-2019`[myanmar2$HSCode_2 == dataset$c.hslist.hslist.[i]]) != 0){
    col18[i] <- myanmar2$`2018-2019`[myanmar2$HSCode_2 == dataset$c.hslist.hslist.[i]]
  }else{
    col18[i] <- 0.0
  }
  
  if(length(myanmar3$`2019-2020(Apr-Feb(P))`[myanmar3$HSCode_2 == dataset$c.hslist.hslist.[i]]) != 0){
    col19[i] <- myanmar3$`2019-2020(Apr-Feb(P))`[myanmar3$HSCode_2 == dataset$c.hslist.hslist.[i]]
    
  }else{
    col19[i] <- 0.0
  }
  print(i)
}

dataset$myanmar_2017 <- col17
dataset$myanmar_2018 <- col18
dataset$myanmar_2019 <- col19




write.csv(dataset, "D:/CEEW/Data/Task_03/Final_dataset.csv", row.names = TRUE)






