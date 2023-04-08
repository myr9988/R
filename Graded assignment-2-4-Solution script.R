# Using the data set named as advertising.csv.
install.packages("readxl")
library(readxl)
library(dplyr)
library(ggplot2)

# Importing advertising.csv data set
Advertising_df=read.csv("advertising.csv")
Advertising_df
names(Advertising_df)
str(Advertising_df)

# Building a linear regression model
Sales_Model=lm(Sales~.,data = Advertising_df)
Sales_Model
summary(Sales_Model)

# R-squared value is 0.9026, Model can be considered good because r-squared value is high.

# The equation for linear regression is 
# Y= M1X1+M2X2+M3X3
# Y-Output(Sales)
# M1-Slope of TV
# M2-Slope of Radio
# M3-Slope of Newspaper
# X1-input of TV
# X2-input of Radio
# X3-input of Newspaper
# C- intercept(constant)
coef(Sales_Model)
# In this case
# c -> 4.62
# M1-> 0.05
# M2-> 0.107
# M3-> 0.0003
# Linear equation is : Sales = (0.05*TV spending)+(0.107*Radio spending)+(0.0003*Newspaper spending)+c
# TV spending is 150, Radio spending is 40, Newspaper spending is 70.
Sales=(0.05*150)+(0.107*40)+(0.0003*70)+4.62
# Sales would be 16.421

