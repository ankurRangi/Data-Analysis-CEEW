library(ggplot2)


Class <- c(rep("Initial_Process",3), rep("Intermediate_Product",3), rep("Final_Product",3))
Tags <- c("Domestic Production", "Export Value", "Import Value")
value <- c(7433.6, 0 ,0, 6139.7, -2305.31, 1188.53,  5022.4, -888.9, 2269.17)
values2 <- c(1055, 0, 0, 871, -327, 168, 1629, -288, 736)

data <- data.frame(Class,Tags,value, values2)
data$Class <- factor(data$Class, levels =  c("Initial_Process", "Intermediate_Product", "Final_Product"))


#copper_dat <- data.frame(col = c("Production", "Inter_Production", "Inter_Import", 
                                # "Inter_Export", "Product_Production", "Product_Import",
                                # "Product_Export"), 
                        # values = c(7433.6, 6139.7, 1188.53, 2305.31, 
                         #           5022.4, 2269.17, 888.9))
#dat <- as.data.table(copper_dat)[, `:=`(total = factor("ALL"), i = 1, index = 1:.N)][]
#indeList <- c("Initial Production", "Intermediate Products", "Final Products")

ggplot(data, aes(fill=Tags, y=value, x=Class, label = abs(value))) + 
  geom_bar(position = "stack", stat="identity")+
  ggtitle("Copper Trade of India")+
  labs(x = "Process", y = "Value in USD Million") +
  geom_text(size = 3, position = position_stack(vjust = 0.5))


ggplot(data, aes(fill=Tags, y=values2, x=Class, label = abs(values2))) + 
  geom_bar(position = "stack", stat="identity")+
  ggtitle("Copper Trade of India (VALUE ADDED)")+
  labs(x = "Process", y = "Value in USD Million") +
  geom_text(size = 3, position = position_stack(vjust = 0.5))

#coord_flip()
#ggplot(out, aes(x=level, y=vSize, fill=vColor, group=interaction(level, label))) +
  #geom_bar(stat='identity', position='fill') +  # add another for black rectangles but not legend
 # geom_bar(stat='identity', position='fill', color="black", show.legend=FALSE) +
  #geom_text(data=out, aes(x=level, y=xlab, label=label), size=6, fontface=1,
    #        inherit.aes=FALSE) +
  #coord_flip() +
 # scale_fill_gradientn(colours = c("white", "red")) +
 # t#heme_minimal() +  # Then just some formatting 
 # xlab("") + ylab("") +
 # theme(axis.text.x = element_blank(),
  #      axis.ticks.x = element_blank(),
  #      axis.text.y = element_blank(),
 #       axis.ticks.y = element_blank())
  
  
#write.csv(data, "D:/CEEW/Data/Analysis/Copper/Copper_Bargraph.csv", row.names = TRUE)
  

