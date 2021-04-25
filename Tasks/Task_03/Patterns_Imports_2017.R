library(readxl)
library(stringr)

indo_2017 <- read_xlsx("D:/CEEW/Data/Task_03/indonesia.xlsx", 1)
sing_2017 <- read_xlsx("D:/CEEW/Data/Task_03/singapore.xlsx", 1)
mala_2017 <- read_xlsx("D:/CEEW/Data/Task_03/malaysia.xlsx", 1)
thai_2017 <- read_xlsx("D:/CEEW/Data/Task_03/thailand.xlsx", 1)
viet_2017 <- read_xlsx("D:/CEEW/Data/Task_03/vietnam.xlsx", 1)
phil_2017 <- read_xlsx("D:/CEEW/Data/Task_03/philippines.xlsx", 1)
brun_2017 <- read_xlsx("D:/CEEW/Data/Task_03/brunie.xlsx", 1)
laos_2017 <- read_xlsx("D:/CEEW/Data/Task_03/laos.xlsx", 1)
camb_2017 <- read_xlsx("D:/CEEW/Data/Task_03/cambodia.xlsx", 1)
myan_2017 <- read_xlsx("D:/CEEW/Data/Task_03/myanmar.xlsx", 1)

indo_2017[is.na(indo_2017)] <- 0
sing_2017[is.na(sing_2017)] <- 0
mala_2017[is.na(mala_2017)] <- 0
thai_2017[is.na(thai_2017)] <- 0
viet_2017[is.na(viet_2017)] <- 0
phil_2017[is.na(phil_2017)] <- 0
brun_2017[is.na(brun_2017)] <- 0
laos_2017[is.na(laos_2017)] <- 0
camb_2017[is.na(camb_2017)] <- 0
myan_2017[is.na(myan_2017)] <- 0


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

HSCode <- c()
for( i in 1:NROW(myan_2017)){
  spl <- as.numeric(strsplit(as.character(myan_2017$HSCode[i]), "")[[1]])
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
myan_2017$HSCode_2 <- HSCode
myan_2017 <- myan_2017[, c(1,2,7,3,4,5,6)]




hscode_list <- c(indo_2017$HSCode_2, sing_2017$HSCode_2, mala_2017$HSCode_2, thai_2017$HSCode_2, 
                 viet_2017$HSCode_2, phil_2017$HSCode_2, brun_2017$HSCode_2, laos_2017$HSCode_2, 
                 camb_2017$HSCode_2, myan_2017$HSCode_2)


hslist_growth <- c()

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

temp <- c()
for(i in 1:NROW(myan_2017)){
  if((myan_2017[i,6] - myan_2017[i,5]) > 0 ){
    temp[i] <- as.numeric(myan_2017$HSCode_2[i])
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

year_2017 <- c()
for(i in 1:NROW(hslist_growth)){
  if(length(myan_2017$`2017-2018`[myan_2017$HSCode_2 == hslist_growth[i]]) != 0 ){
    year_2017[i] <- myan_2017$`2017-2018`[myan_2017$HSCode_2 == hslist_growth[i]]
  }else{
    year_2017[i] <- NA
  }
}
updated_dataset$myan_2017 <- year_2017


View(updated_dataset)

twodigit <- updated_dataset$c.hslist_growth./10000
twodigit <- floor(twodigit)
View(twodigit)

updated_dataset$twodigit <- twodigit
updated_dataset <- updated_dataset[, c(1,12,2,3,4,5,6,7,8,9,10,11)]

write.csv(updated_dataset, "D:/CEEW/Data/Task_03/UPDATED_dataset_2017.csv", row.names = TRUE)

