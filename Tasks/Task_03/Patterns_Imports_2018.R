library(readxl)
library(stringr)

indo_2018 <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 2)
sing_2018 <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 2)
mala_2018 <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 2)
thai_2018 <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 2)
viet_2018 <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 2)
phil_2018 <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 2)
brun_2018 <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 2)
laos_2018 <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 2)
camb_2018 <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 2)
myan_2018 <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 2)

indo_2018[is.na(indo_2018)] <- 0
sing_2018[is.na(sing_2018)] <- 0
mala_2018[is.na(mala_2018)] <- 0
thai_2018 [is.na(thai_2018 )] <- 0
viet_2018 [is.na(viet_2018 )] <- 0
phil_2018[is.na(phil_2018)] <- 0
brun_2018[is.na(brun_2018)] <- 0
laos_2018[is.na(laos_2018)] <- 0
camb_2018[is.na(camb_2018)] <- 0
myan_2018[is.na(myan_2018)] <- 0

HSCode <- c()
for( i in 1:NROW(thai_2018)){
  spl <- as.numeric(strsplit(as.character(thai_2018$HSCode[i]), "")[[1]])
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
thai_2018$HSCode_2 <- HSCode
thai_2018 <- thai_2018[, c(1,2,7,3,4,5,6)]




hscode_list <- c(indo_2018$HSCode_2, sing_2018$HSCode_2, mala_2018$HSCode_2, thai_2018$HSCode_2, 
                 viet_2018$HSCode_2, phil_2018$HSCode_2, brun_2018$HSCode_2, laos_2018$HSCode_2, 
                 camb_2018$HSCode_2, myan_2018$HSCode_2)


hslist_growth <- c()

temp <- c()
for(i in 1:NROW(myan_2018)){
  if((myan_2018[i,6] - myan_2018[i,5]) > 0 ){
    temp[i] <- as.numeric(myan_2018$HSCode_2[i])
  }else{
    temp[i] <- 0
  }
}

hslist_growth <- c(hslist_growth, temp)

View(hslist_growth)

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

year_2018 <- c()
for(i in 1:NROW(hslist_growth)){
  if(length(myan_2018$`2018-2019`[myan_2018$HSCode_2 == hslist_growth[i]]) != 0 ){
    year_2018[i] <- myan_2018$`2018-2019`[myan_2018$HSCode_2 == hslist_growth[i]]
  }else{
    year_2018[i] <- NA
  }
}
updated_dataset$myan_2018 <- year_2018


View(updated_dataset)

twodigit <- updated_dataset$c.hslist_growth./10000
twodigit <- floor(twodigit)
View(twodigit)

updated_dataset$twodigit <- twodigit
updated_dataset <- updated_dataset[, c(1,12,2,3,4,5,6,7,8,9,10,11)]

write.csv(updated_dataset, "D:/CEEW/Data/Task_03/UPDATED_dataset_2018.csv", row.names = TRUE)

SGP_WLD
