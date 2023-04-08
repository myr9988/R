#### Exam Question Solutions ####

library(readxl)
library(dplyr)

market = read_excel(file.choose())

# H0 - There is no significant difference between the three groups
# H1 - There is a significant difference between the three groups

group = c(rep('Group A',20),rep('Group B',20),rep('Group C',20))
group

marks = c(market$`Group A`,market$`Group B`,market$`Group C`)
marks

df_survey = data.frame(group,marks)

# Performing ANOVA
anova = aov(marks~group,data=df_survey)
anova
summary(anova)
# p-value is 2e-16, it is less than 0.05 so we reject the null hypothesis
# Conclusion - There is a significant difference between the three groups



# Performing chi sq test

# H0 - There is no significant difference between expected and observed results.
# H1 - There is a significant difference between expected and observed results.

actual = c(200,168,240,192)
assumption = c(800*0.28,800*0.19,800*0.23,800*0.3)
actual
assumption

chisq.test(actual,assumption)
# p-value is 0.2133, it is greater than 0.05 so we accept Null hypothesis
# Conclusion - There is a significant difference between expected and observed results