# install.packages("tseries")
# install.packages("quantmod")

library(tseries)
library(quantmod)

# Go on yahoo finance, search GOOG (Google), FB (facebook), and ^GSPC (S&P 500). 
# Obtain the prices from . 

GoogData <- read.csv("/Users/shamstabrez/Downloads/GOOGL.csv", header=TRUE, sep=",") 
FBData <- read.csv("/Users/shamstabrez/Downloads/FB.csv", header=TRUE, sep=",") 
SP500Data <- read.csv("/Users/shamstabrez/Downloads/^GSPC.csv", header=TRUE, sep=",") 

# Remove any missing values if needed
GoogData = na.omit(GoogData)

# See what the data classes are
str(GoogData)

# Compute the returns and remove any missing values. 
ReturnGoog = na.omit(Delt(GoogData[,5]))
ReturnFB = na.omit(Delt(FBData[,5]))
ReturnSP500 = na.omit(Delt(SP500Data[,5]))

# Merge the returns of all three index into single data
MyData = cbind(ReturnSP500,ReturnGoog,ReturnFB)

# Monthly Return of Investment of Interest
colnames(MyData) = c("SP500", "Google", "Facebook")
head(MyData)

# See how the data looks. You can see the risk is much lesser in the S&P as this 
# represents the market, compared to the individual stock. 
boxplot(MyData,main="Expected Return", xlab="Stock Picks", ylab="Return")

# Compute mean and stdev for the returns.
DataMean=apply(MyData, 2, mean)
DataSD=apply(MyData, 2, sd)
# Take a look at the means and standard deviations. 
cbind(DataMean,DataSD)

# According to the CAPM formula, we will first get the beta of each stock by 
# regressions; then calculate the expected return of each stock and the covariance 
# matrix of the four stocks; finally we can calculate the optimal asset allocations 
# (weights) of the portfolio consisting of the 2 stocks.

# Model for Google. Model fit can be judged by R-sq. Using LM here as interprtation 
# is key. SVM is not so useful.
lm.Goog<- lm(Google ~ SP500, data = as.data.frame(MyData))
summary(lm.Goog)
BetaGoog <- summary(lm.Goog)$coefficients[2, 1]

# Model for Facebook. Model fit can be judged by R-sq. 
lm.FB<- lm(Facebook ~ SP500, data = as.data.frame(MyData))
summary(lm.FB)
BetaFB <- summary(lm.FB)$coefficients[2, 1]

# Display betas
paste("Beta of Google: ", BetaGoog)
paste("Beta of Facebook: ", BetaFB)

# If a stock has a beta of 1.00, it indicates that its price is correlated with 
# the market. A stock like that has systemic risk, but the beta calculation can’t 
# detect any unsystemic risk. Adding a stock to a portfolio with a beta of 1.00 
# doesn’t add any risk to the portfolio, but it also doesn’t increase the likelihood
# that the portfolio will provide excess return.

# A beta of less than 1.00 means that the security is theoretically less volatile 
# than the market which means the portfolio is less risky with the stock included 
# than without it. 

# A beta that is greater than 1.00 indicates that the security's price is 
# theoretically more volatile than the market. For example, if a stock's beta is 
# 1.20, it is assumed to be 20% more volatile than the market. Technology stocks and 
# small caps tend to have higher betas than the market benchmark. This indicates that
# adding the stock to a portfolio will increase the portfolio’s risk, but also 
# increase its expected return.

# For computation of return on investement, you can use US Treasury bill rates as 
# the risk free rate, and the S&P as the market rate. 