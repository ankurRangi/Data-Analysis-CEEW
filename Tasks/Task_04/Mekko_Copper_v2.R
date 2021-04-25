library(data.table)
library(ggplot2)
library(dplyr)

Class <- c(rep("Initial_Process",3), rep("Intermediate_Product",3), rep("Final_Product",3))
Tags <- c("Domestic Production", "Export Value", "Import Value")
#value <- c(7433.6, 0 ,0, 6139.7, -2305.31, 1188.53,  5022.4, -888.9, 2269.17)
value <- c(1055, 0, 0, 871, -327, 168, 1629, -288, 736)

mekko <- data.frame(Class,Tags,value)

t1 <- sum(abs(value[1:3]))
t2 <- sum(abs(value[4:6]))
t3 <- sum(abs(value[7:9]))

total <- sum(abs(value))

mekko_perc <- unique(c(Class))
value_perc <- c()
value_perc[1] <- (sum(abs(value[1:3]))/total) * 100
value_perc[2] <- (sum(abs(value[4:6]))/total) * 100
value_perc[3] <- (sum(abs(value[7:9]))/total) * 100

mekko_perc <- data.frame(Class = c(mekko_perc), value_perc = c(value_perc) )

#mekko_per <- mekko %>%
#group_by(Class) %>%
#summarise(value_prop = (sum(abs(value))/total) * 100)

xmax <- cumsum(mekko_perc$value_perc)
xmin <- xmax - mekko_perc$value_perc

mekko_perc$xmax <- xmax
mekko_perc$xmin <- xmin


mekko <- left_join(mekko, mekko_perc)
#ord <- order(mekko$xmax, decreasing = FALSE)
#mekko <- mekko[ord, ]
#ord2 <- order(mekko$xmin, decreasing = FALSE)
#mekko[ord2, ]

col1 <- c()

for(i in 1:9){
  if(i <= 3){
    col1[i] <- sum(abs(value[i]))
  }else if(i > 3 & i <= 6){
    col1[i] <- sum(abs(value[i]))
  }else if(i > 6 & i <= 9){
    col1[i] <- sum(abs(value[i]))
  }
}

mekko$per <- col1

#mekko$xmax[1:3] <- cumsum(mekko$per[1:3])
#mekko$xmax[4:6] <- cumsum(mekko$per[4:6])
#mekko$xmax[7:9] <- cumsum(mekko$per[7:9])

#mekko$xmin[1:3] <- mekko$xmax[1:3] - mekko$per[1:3]
#mekko$xmin[4:6] <- mekko$xmax[4:6] - mekko$per[4:6]
#mekko$xmin[7:9] <- mekko$xmax[7:9] - mekko$per[7:9]

ymax <- c()
ymax[1:3] <- cumsum(col1[1:3])
ymax[4:6] <- cumsum(col1[4:6])
ymax[7:9] <- cumsum(col1[7:9])

ymin <- c()
ymin[1:3] = ymax[1:3] - col1[1:3]
ymin[4:6] = ymax[4:6] - col1[4:6]
ymin[7:9] = ymax[7:9] - col1[7:9]



mekko$ymax <- ymax
mekko$ymin <- ymin

mekko$xtext <- with(mekko, xmin + (xmax - xmin)/2)
mekko$ytext <- with(mekko, ymin + (ymax - ymin)/2)

p <- ggplot(mekko, aes(ymin = ymin, ymax = ymax,
                       xmin = xmin, xmax = xmax, fill = Tags))
p1 <- p + geom_rect(colour = I("grey"))
#p1
p2 <- p1 + geom_text(aes(x = xtext, y = ytext,
                         label = ifelse(value != 0, paste(abs(value), sep = ""), 
                                        paste("", sep = ""))), size = 3.5)
#p2
p3 <- p2 + geom_text(aes(x = xtext, y = 103,
                         label = Class), size = 4)
p3


