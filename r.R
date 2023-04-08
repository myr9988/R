library(readxl)
library(dplyr)
df=read_excel(file.choose())
#HO- There is no significant difference between the three groups
#HA- There is a significant difference between the three groups
g= c(rep('Group A',20),rep('Group B',20),rep('Group C',20))
g
m= c(df$`Group A`,df$`Group B`,df$`Group C`)
m
df1 = data.frame(g,m)
anova = aov(m~g,data=df1)
anova
summary(anova)
#p-value is 2e-16, it is less than 0.05
#There is a significant difference between the three groups

#H0-There is no significant difference between expected and observed results.
#H1-There is a significant difference between expected and observed results.
actual = c(200,168,240,192)
assumption = c(800*0.28,800*0.19,800*0.23,800*0.3)
actual
assumption
chisq.test(actual,assumption)
#p-value is 0.2133
#There is a significant difference between expected and observed results