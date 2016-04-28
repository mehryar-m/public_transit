library(plotly)
library("ggplot2")

## alternative transit
bplot.atransit$type <- "alt transit"
long.atransit <- melt(bplot.atransit, id = c("type"))
long.atransit <- long.atransit[which(long.atransit$variable == "HINCP"),]

ggplot(long.atransit, aes(type, value)) + geom_boxplot()
plot_ly(long.atransit, x = long.atransit$type, y = long.atransit$value, type = "box")

## Car
bplot.car$type <- "car"
long.car <- melt(bplot.car, id = c("type"))
long.car <- long.car[which(long.car$variable == "HINCP"),]
long.car <- long.car[,c("type", "variable", "value")]

## Bus
bplot.bus$type <- "bus"
long.bus <- melt(bplot.bus, id = c("type"))
long.bus <- long.bus[which(long.bus$variable == "HINCP"),]
##  Street car
bplot.SC$type <- "street car"
long.SC <- melt(bplot.SC, id = c("type"))
long.SC <- long.SC[which(long.SC$variable == "HINCP"),]
## subway
bplot.subway$type <- "subway"
long.subway <- melt(bplot.subway, id = c("type"))
long.subway <- long.subway[which(long.subway$variable == "HINCP"),]
## rail
bplot.rail$type <- "rail"
long.rail <- melt(bplot.rail, id = c("type"))
long.rail <- long.rail[which(long.rail$variable == "HINCP"),]
## bike
bplot.bike$type <- "bike"
long.bike <- melt(bplot.bike, id = c("type"))
long.bike <- long.bike[which(long.bike$variable == "HINCP"),]
## home
bplot.home$type <- "home"
long.home <- melt(bplot.home, id = c("type"))
long.home <- long.home[which(long.home$variable == "HINCP"),]

all <- rbind(long.car, long.atransit, long.bus, long.SC, long.subway, long.rail, long.bike, long.home)
all <- all[,c("type","value")]
all <- rename(all,c(type = "motransportation", value = "Income"))
ggplot(all, aes(motransportation,Income)) + geom_boxplot()
plot_ly(all ,x = motransportation, y = Income, type = "box")
