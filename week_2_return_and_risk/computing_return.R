# Script to calculate historical returns from S&P 500 

# SP500 monthly data from Jan 1990 to Dec 2015  
SP500<-read.csv(file="./week_1_intro_to_quantitative_investing/SP500_data.csv")

# Calculate holding period return for SP500 for different holding periods using closing price
# Return = (gain of investment - cost of investment) / cost of investment

# 6 month horizon: June 30th 2015 - December 31st 2015 
six_month_return<-round(((SP500[1,5] - SP500[7,5]) / SP500[7,5]) * 100, 2)

# 1 year horizon: Dec 31st 2014 - December 31st 2015 
one_year_return<-round(((SP500[1,5] - SP500[13,5]) / SP500[13,5]) * 100, 2)

# 25 year horizon: Dec 31st 1990 - December 31st 2015
twenty_five_year_return<-round(((SP500[1,5] - SP500[301,5]) / SP500[301,5]) * 100, 2)

# Calculating annualised return so that we can compare returns across varying holding periods by standardising to 1 year
# dividing by return by 100 to undo earlier percentage transformation
# 1/0.5 as six months is half a year, 1/0.25 or 12 / (3/12) would be for a quarter, etc
six_month_return_annualised<-round((((1+six_month_return/100) ** (1/0.5) - 1) * 100), 2)

# 1/25 part is akin to 1/(25/1) i.e. 25 lots of a standard year
twenty_five_year_return_annualised<-round((((1 + twenty_five_year_return/100) ** (1/25) - 1) * 100), 2)

# Calculating monthly holding returns across all months
# Get the closing price for all years
price<-SP500$Close

# Get the prices to be used for the gain, SP500 data is in chronologically reverse order so from 1st row to 2nd last row
gain<-price[1:(length(price)-1)]

# Get the prices to be used for the cost, SP500 data is in chronologically reverse order so from 2nd row to last row
cost<-price[2:length(price)]

# Calculate monthly holding return
monthly_return<-round(((gain - cost) / cost) * 100, 2)

# Can use historical holding returns to work out future expected returns
# Example of expecations (for 1 year):
#    Status | Probability of status | Expected return in status
# Excellent (s_1) |            0.3        |           20%
# Good      (s_2) |            0.2        |           10%
# Poor      (s_3) |            0.4        |           -5%
# Terrible  (s_4) |            0.1        |           -40%

probability_status<-c(0.3, 0.2, 0.4, 0.1)
expected_return_status<-c(0.2, 0.1, -0.05, -0.4)

# Expected return = sum over all scenarions (probability of status * expected return in status)
expected_return<-round((sum(probability_status * expected_return_status) * 100), 2)

# Monthly expected return (using 1/12 to get one month return from a 1 year expected return)
monthly_expected_return<-round((((1 + expected_return/100) ** (1/12) - 1) * 100), 2)

