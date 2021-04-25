library(treemap)
library(data.table)
#library(d3treeRz)


copper_dat <- data.frame(col = c("Production", "Inter_Production", "Inter_Import", 
                                 "Inter_Export", "Product_Production", "Product_Import",
                                 "Product_Export"), 
                         values = c(7433.6, 6139.7, 1188.53, 2305.31, 
                                  5022.4, 2269.17, 888.9))
dat <- as.data.table(copper_dat)[, `:=`(total = factor("ALL"), i = 1, index = 1:.N)][]
indeList <- c("Initial Production", "Intermediate Products", "Final Products")

colour <- c("chartreuse", "bisque1", "cornflowerblue", "aquamarine1", "darkorange", "hotpink", "olivedrab1")

copper_dat$mix <- paste(copper_dat$col, copper_dat$values, sep = ",  ")




res <- treemap(copper_dat,
        index = c("mix"),
        vSize = "values",
        vColor = "index",
        #fun.aggregate = "agg",
        #palette = colour,
        type = "index",
        align.labels = list(c("left", "top"), c("right", "bottom")))

out <- res$tm
out$label <- out[cbind(1:nrow(out), out$level)]
out$label <- with(out, ifelse(level==4, substring(label, 1, 1), label))  
out$level <- factor(out$level, levels=sort(unique(out$level), TRUE))     


out$xlab <- out$vSize / max(aggregate(vSize ~ level, data=out, sum)$vSize)
split(out$xlab, out$level) <- lapply(split(out$xlab, out$level), function(x) cumsum(x) - x/2)

library(ggplot2)

ggplot(out, aes(x=level, y=vSize, fill=vColor, group=interaction(level, label))) +
  geom_bar(stat='identity', position='fill') +  # add another for black rectangles but not legend
  geom_bar(stat='identity', position='fill', color="black", show.legend=FALSE) +
  geom_text(data=out, aes(x=level, y=xlab, label=label), size=6, fontface=1,
            inherit.aes=FALSE) +
  coord_flip() +
  scale_fill_gradientn(colours = c("white", "red")) +
  theme_minimal() +  # Then just some formatting 
  xlab("") + ylab("") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank())
