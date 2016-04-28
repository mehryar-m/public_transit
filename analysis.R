library(ggplot2)
j <- 1

ggplot(analysis.final, aes(x = (analysis.final$atransit == 1), y = analysis.final$HINCP)) + geom_boxplot()
bplot.atransit <- analysis.final[,c("HINCP","atransit")]
bplot.atransit <- bplot.atransit[which(bplot.atransit$atransit == 1),]
boxplot(bplot.atransit$HINC, data = bplot.atransit)

## Data for just the Bus and Street Car
bplot.bus <- analysis.final[,c("HINCP","BusStr")]
bplot.bus <- bplot.bus[which(bplot.bus$BusStr == 1),]
## Data for subway and rail
bplot.subRail <- analysis.final[,c("HINCP","SubRail")]
bplot.subRail <- bplot.subRail[which(bplot.subRail$SubRail == 1),]
## Data for Bike
bplot.bike <- analysis.final[,c("HINCP","bike")]
bplot.bike <- bplot.bike[which(bplot.bike$bike == 1),]
## Data for work at home
bplot.athome <- analysis.fina[,]
boxplot(bplot.bus$HINCP~bplot.subRail$HINCP~bplot.bike$HINCP)

