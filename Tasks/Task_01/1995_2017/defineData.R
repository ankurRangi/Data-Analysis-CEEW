
setwd("C:/Users/ankur/OneDrive/Desktop/IIITD/CEEW/Task_01")

#Loading the readxl library to read xls, xlsx file,
library("readxl")
mast <- read_excel("HS_2.xlsx")

#___________________________________________________________________________

ASEAN <- subset(mast, Trade == "ASEAN", select = c( "Partnery_Name", "hs_product_code", 
      "export_value", "import_value", "Industry_class"))

Indo <- subset(ASEAN, Partnery_Name == "Indonesia", select = c("Partnery_Name", "hs_product_code", 
      "export_value", "import_value", "Industry_class"))

Mal <- subset(ASEAN, Partnery_Name == "Malaysia", select = c("Partnery_Name", "hs_product_code", 
      "export_value", "import_value", "Industry_class"))

Phil <- subset(ASEAN, Partnery_Name == "Philippines", select = c("Partnery_Name", "hs_product_code", 
      "export_value", "import_value", "Industry_class"))

Thai <- subset(ASEAN, Partnery_Name == "Thailand", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Bru <- subset(ASEAN, Partnery_Name == "Brunei Darussalam", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Sing <- subset(ASEAN, Partnery_Name == "Singapore", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Laos <- subset(ASEAN, Partnery_Name == "Lao PDR", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Viet <- subset(ASEAN, Partnery_Name == "Vietnam", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Cam <- subset(ASEAN, Partnery_Name == "Cambodia", select = c("Partnery_Name", "hs_product_code", 
                                                                 "export_value", "import_value", "Industry_class"))

Myan <- subset(ASEAN, Partnery_Name == "Myanmar", select = c("Partnery_Name", "hs_product_code", 
                                                             "export_value", "import_value", "Industry_class"))


#View(Mal)

China <- subset(mast, Partnery_Name == "China", select = c("Partnery_Name", "hs_product_code", 
        "export_value", "import_value","Industry_class"))

colChina <- c("China")
export_China <- mast[mast$Partnery_Name %in% colChina, "export_value"]
import_China <- mast[mast$Partnery_Name %in% colChina, "import_value"]
net_China <- import_China - export_China 

China$net_China <- net_China

View(China)

