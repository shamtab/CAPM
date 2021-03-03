# CAPM
Capital Asset Pricing Model

According to the CAPM formula, we will first get the beta of each stock by regressions; then calculate the expected return of each stock and the covariance matrix of the four stocks; finally we can calculate the optimal asset allocations (weights) of the portfolio consisting of the 2 stocks.

In this example we compare stocks of google and facebook against S&P500 which is considered as market.

If a stock has a beta of 1.00, it indicates that its price is correlated with the market. A stock like that has systemic risk, but the beta calculation can’t detect any unsystemic risk. Adding a stock to a portfolio with a beta of 1.00 doesn’t add any risk to the portfolio, but it also doesn’t increase the likelihood
that the portfolio will provide excess return.

A beta of less than 1.00 means that the security is theoretically less volatile than the market which means the portfolio is less risky with the stock included 
than without it. 

A beta that is greater than 1.00 indicates that the security's price is theoretically more volatile than the market. For example, if a stock's beta is 1.20, it is assumed to be 20% more volatile than the market. Technology stocks and small caps tend to have higher betas than the market benchmark. This indicates that adding the stock to a portfolio will increase the portfolio’s risk, but also increase its expected return.

As per our CAPM calculations we found:

"Beta of Google:  0.967775652340298"
"Beta of Facebook:  0.999968515022591"

This means FB stock is less risky compared to Google as it has beta close to 1 and adding it to portoflio reduces the risk to systemic risk caused by market fluctations and compared to market S&P 500 returns.
