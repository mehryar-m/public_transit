install.packages("stargazer")
library(stargazer)
stargazer(attitude)
library(ggplot2)
bplot.everyone <- analysis.final[,c("HINCP","JWRIP","atransit")]
bplot.everyone <- bplot.everyone[which(bplot.everyone$JWRIP == 1 | bplot.everyone$atransit == 1),]
stargazer(stargazer(bplot.everyone, 
                    mean.sd = TRUE, median = TRUE,
                    iqr = TRUE))
## Car
bplot.car <- analysis.final[,c("HINCP","JWRIP")]
bplot.car <- bplot.car[which(bplot.car$JWRIP == 1),]
stargazer(bplot.car, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Alternative Transit
bplot.atransit <- analysis.final[,c("HINCP","atransit")]
bplot.atransit <- bplot.atransit[which(bplot.atransit$atransit == 1),]
boxplot(bplot.atransit$HINCP, data = bplot.atransit)
stargazer(bplot.atransit, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for just the Bus
bplot.bus <- analysis.final[,c("HINCP","bus")]
bplot.bus <- bplot.bus[which(bplot.bus$bus == 1),]
boxplot(bplot.bus$HINCP, data = bplot.bus)
stargazer(bplot.bus, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for street car
bplot.SC <- analysis.final[,c("HINCP","SC")]
bplot.SC <- bplot.SC[which(bplot.SC$SC == 1),]
stargazer(bplot.SC, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for subway
bplot.subway <- analysis.final[,c("HINCP","subway")]
bplot.subway <- bplot.subway[which(bplot.subway$subway == 1),]
stargazer(bplot.subway, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for rail
bplot.rail <- analysis.final[,c("HINCP","rail")]
bplot.rail <- bplot.rail[which(bplot.rail$rail ==1),]
stargazer(bplot.rail, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for bike
bplot.bike <- analysis.final[,c("HINCP","bike")]
bplot.bike <- bplot.bike[which(bplot.bike$bike == 1),]
stargazer(bplot.bike, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)
## Data for work at home
bplot.home <- analysis.final[,c("HINCP","home")]
bplot.home <- bplot.home[which(bplot.home$home ==1),]
stargazer(bplot.home, 
          mean.sd = TRUE, median = TRUE,
          iqr = TRUE)

