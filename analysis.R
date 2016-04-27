library(ggplot2)
j <- 1

ggplot(analysis.final, aes(x = (analysis.final$atransit == 1), y = analysis.final$HINCP)) + geom_boxplot()
bplot.atransit <- analysis.final[,c("HINCP","atransit")]
bplot.atransit <- bplot.atransit[which(bplot.atransit$atransit == 1),]
boxplot(bplot.atransit$HINC, data = bplot.atransit)

bplot.bus <- analysis.final[,c("HINCP","BusStr")]
bplot.bus <- bplot.bus[which(bplot.bus$BusStr == 1),]

ggplot(bplot.bus, aes(x = bplot.bus$HINCP)) + geom_histogram(binwidth=.5)
