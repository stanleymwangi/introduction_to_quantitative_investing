# First R script to read yahoo finance S&P finance data and assign to a variable

# SP500 monthly data from Jan 1990 to Dec 2015  
SP500<-read.csv(file="./week_1_intro_to_quantitative_investing/SP500_data.csv")

# Retrieve column names
colnames(SP500)

# Retrieve closing price by indexing by column name
price<-SP500$Close

# Retrieve volume by indexing by column number
volume<-SP500[,6]

# Retrieve opening price for July 2011 using row name followed by column name
july_open<-SP500[54,2]
