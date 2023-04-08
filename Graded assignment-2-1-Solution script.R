# Using the data set named 'Salary Data.xlsx': It contains the data of 30 sample salary of women and men in an organization
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
Salary = read_excel("Salary Data.xlsx")
Salary
attach(Salary)

# We have sample size of 30 & we have to compare the means of two groups so we have to perform t-test.
t_test=t.test(`Men Salary`,`Women Salary`,paired = F)
t_test

# H0 (Null hypothesis) = There is no difference between Salary of Men & Women.
# HA (Alternate hypothesis)=There is difference between Salary of Men & women.
# p-value = 0.001494
# As our p-value is less than 0.05 so we have to reject the Null hypothesis.
# Business conclusion based on p-value is there is a difference between Salary of the Men & Women in the Organization.


#if P value is lesser than 0.05 then reject null hypothesis.
#if P value is greater than 0.05 then accept the null hypothesis.