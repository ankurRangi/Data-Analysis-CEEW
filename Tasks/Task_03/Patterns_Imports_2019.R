
library(readxl)
library(stringr)

indo_2019 <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 3)
sing_2019 <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 3)
mala_2019 <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 3)
thai_2019 <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 3)
viet_2019 <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 3)
phil_2019 <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 3)
brun_2019 <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 3)
laos_2019 <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 3)
camb_2019 <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 3)
myan_2019 <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 3)

indo_2019[is.na(indo_2019)] <- 0
sing_2019[is.na(sing_2019)] <- 0
mala_2019[is.na(mala_2019)] <- 0
thai_2019 [is.na(thai_2019 )] <- 0
viet_2019 [is.na(viet_2019 )] <- 0
phil_2019[is.na(phil_2019)] <- 0
brun_2019[is.na(brun_2019)] <- 0
laos_2019[is.na(laos_2019)] <- 0
camb_2019[is.na(camb_2019)] <- 0
myan_2019[is.na(myan_2019)] <- 0

HSCode <- c()
for( i in 1:NROW(phil_2019)){
  spl <- as.numeric(strsplit(as.character(phil_2019$HSCode[i]), "")[[1]])
  if(length(spl) == 8){
    HSCode[i] = as.numeric(paste(spl[1:6], collapse = ""))
  }else if(length(spl) == 7){
    HSCode[i] = as.numeric(paste(spl[1:5], collapse = ""))
    
  }else{
    HSCode[i] = as.numeric(paste(spl, collapse = ""))
  }
}
#HSCodev2 <- str_pad(HSCode, width=6, side="left", pad="0")
#View(HSCode)
phil_2019$HSCode_2 <- HSCode
phil_2019 <- phil_2019[, c(1,2,7,3,4,5,6)]

hscode_list <- c(indo_2019$HSCode_2, sing_2019$HSCode_2, mala_2019$HSCode_2, thai_2019$HSCode_2, 
                 viet_2019$HSCode_2, phil_2019$HSCode_2, brun_2019$HSCode_2, laos_2019$HSCode_2, 
                 camb_2019$HSCode_2, myan_2019$HSCode_2)




temp <- c()
for(i in 1:NROW(myan_2019)){
  if((myan_2019[i,6] - myan_2019[i,5]) > 0 ){
    temp[i] <- as.numeric(myan_2019$HSCode_2[i])
  }else{
    temp[i] <- 0
  }
}
hslist_growth <- c(hslist_growth, temp)

hslist_growth[hslist_growth == 0] <- NA
hslist_growth <- hslist_growth[complete.cases(hslist_growth)]
View(hslist_growth)

updated_dataset <- data.frame(c(hslist_growth))

indo
sing
mala
thai
viet
phil
brun
laos
camb
myan

year_2019 <- c()
for(i in 1:NROW(hslist_growth)){
  if(length(phil_2019$`2019-2020(Apr-Feb(P))`[phil_2019$HSCode_2 == hslist_growth[i]]) != 0 ){
    year_2019[i] <- phil_2019$`2019-2020(Apr-Feb(P))`[phil_2019$HSCode_2 == hslist_growth[i]]
  }else{
    year_2019[i] <- NA
  }
}
updated_dataset$phil_2019 <- year_2019
View(year_2019)

View(updated_dataset)

twodigit <- updated_dataset$c.hslist_growth./10000
twodigit <- floor(twodigit)
View(twodigit)

updated_dataset$twodigit <- twodigit
updated_dataset <- updated_dataset[, c(1,2,3,4,5,6,7,12,8,9,10, 11)]

write.csv(updated_dataset, "D:/CEEW/Data/Task_03/UPDATED_dataset_2019_v2.csv", row.names = TRUE)

