library(stargazer)

regression.data <- analysis.final[,c("HINCP","atransit")]
regression.data$logincome <- log(regression.data$HINCP)
## get rid of nans (produced by negative incomes)
regression.data <- regression.data[!(is.na(regression.data$logincome)),]

basic.regression <- glm(atransit~logincome, data = regression.data)
stargazer(basic.regression, title="Basic Regression alternate transit on log(HINC)")
simple.regression <- lm(atransit~logincome, data = regression.data)
stargazer(basic.regression, simple.regression, title="alongside")
