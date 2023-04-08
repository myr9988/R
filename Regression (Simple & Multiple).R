setwd("~/Client Related/Datasets/Regression")
### Simple Linear Regression - HR ######
salary = read.csv('Salary_Data.csv')
names(salary)
str(salary)
summary(salary)
#Building Linear Regression model
salary_model = lm(Salary~YearsExperience,data=salary)

summary(salary_model)
#Higher the R square value better our model
#Since our model is explaining 95.54% of variance, we can consider
# it to be a good model.

#The equation of simple linear regression is Y = mX+C
# Y - Output (Salary)
# m - slope 
# X - Input (YearsExperience)
# c - Intercept (Constant)

coef(salary_model)
#In our case, when we run the coef function
#m - 9449
#c - 25792



#Salary = (9449 * YearsExperience) + 25792
#Imagine an employee with 3 years of experience joining.
# What is the salary to offer?
Salary_Predict = (9449*3) + 25792
Salary_Predict


#Lets import icecream data
ice_cream = read.csv('IceCreamData.csv')


library(readxl)
tv = read_excel('TV rating.xlsx')

summary(tv)
names(tv)
#Build a multiple linear regression model
tv_model = lm(Revenue~Spend+CTRP,data=tv)
summary(tv_model)


#R square value is high, so the model can be considered good

# The equation of multiple linear regression is 
# Y = m1X1+m2X2+..+mnXn+c
# Y - Output (Revenue)
# m1 - slope (CTRP)
# m2 - slope (Spend)
# X1 - Input (CTRP)
#X2 - Input (Spend)
# c - Intercept (Constant)
coef(tv_model)
#In our case
# c - 41008
# m1 -  3.13
# m2 - 5931


# Equation : Revenue = (3.13*Spend)+(5931*CTRP)+41008

#Imagine moon world is planning to spend 100000 and 
# the CTRP is estimated to be 120

Revenue_Predict = (3.13*100000)+(5931*120)+41008
Revenue_Predict

# if we have a space in column name, we need to write it inside
`Amount Spend`