setwd("~/Client Related/Datasets/Hypothesis testing")
golf = read.csv('Golf.csv')
#If we use the attach command we can directly use the column names
attach(golf)
t_test = t.test(Current,New,paired = F)
t_test
?t.test
# H0 = The coating does not have effect on driving distance
# H1 = The coating has an effect on driving distance


#If P value is lesser than 0.05 the reject null hypothesis
# if p value is greater than 0.05 then accept null hypothesis

#Since the p value is greater than 0.05, Accept null hypothesis.

#Conclusion - There is no effect on driving distance 
# due to the coating. The manufacturer can use the new coating.



###ANOVA#####
library(readxl)
football = read_excel('Football.xlsx')
names(football)
rep('Kaushik',3)


team = c(rep('Dallas',17),rep('Green Bay',17),rep('Denver',17),
         rep('Miami',17),rep('San Francisco',17))
team
weights = c(football$Dallas,football$`Green Bay`,football$Denver,
            football$Miami,football$`San Francisco`)
weights

df_football = data.frame(team,weights)

head(df_football)
##Let us perform ANOVA now

anova = aov(weights~team,data=df_football)
anova
summary(anova)

#H0 = The weights of the players does not have effect on players performance
#H1 = The weights of the players have an effect on players performance

#The p value is 0.189, accept the null hypothesis.

#Conclusion: The weights of the players does not have any effect
#   the franchise can hire players irrespective of their weights.


####Chi Square Test ####
actual = c(190,185,90,35)
assumption = c(500*0.35,500*0.4,500*0.2,500*0.05)
actual
assumption


chisq.test(actual,assumption)
#H0 : Captain Cook's claim is true
#H1 : Captain Cook's claim is false

# The p value is 0.2133, accept the null hypothesis

#Conclusion: Captain Cook's claim is true, they can follow
# captain cook's proportion