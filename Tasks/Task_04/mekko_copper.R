library(mekko)
library(ggplot2)
library(dplyr)

Class <- c(rep("Initial_Process",3), rep("Intermediate_Product",3), rep("Final_Product",3))
Tags <- c("Domestic Production", "Export Value", "Import Value")
value <- c(7433.6, 0 ,0, 6139.7, -2305.31, 1188.53,  5022.4, -888.9, 2269.17)

mekko <- data.frame(Class,Tags,value)

total <- sum(abs(value))

mekko_per <- mekko %>%
  group_by(Class) %>%
  summarise(value_prop = (sum(abs(value))/total) * 100)

mekko_per$xmax <- cumsum(mekko_per$value_prop)
mekko_per$xmin <- mekko_per$xmax - mekko_per$value_prop

mekko <- left_join(mekko, mekko_per)

total_value_in_process <- mekko %>%
  group_by(Class) %>%
  summarise(total_value = sum(abs(value)))

mekko  <- left_join(mekko, total_value_in_process)

mekko <- mekko %>%
  mutate(subject_prop = (abs(value)/total_value) * 100,
         ymax = cumsum(subject_prop),
         ymin = ymax - subject_prop)

mekko <- mekko %>%
  mutate(xtext = xmin + (xmax - xmin)/2,
         ytext = ymin + (ymax - ymin) /2)

p <- ggplot(mekko, aes(ymin = ymin, ymax = ymax, 
                              xmin = xmin, xmax = xmax, fill = Tags))
p1 <- p + geom_rect(colour = ('grey'))
p1
