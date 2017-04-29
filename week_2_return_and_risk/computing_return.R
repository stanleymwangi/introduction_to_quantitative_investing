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
#twenty_five_year_return<-round(((SP500[1,5] - SP500[301,5]) / SP500[301,5]) * 100, 2)
