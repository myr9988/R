# R EXAM QUESTIONS USING MARKET ANALYSIS DATA

library(readxl)
library(ggplot2)
library(dplyr)

# 1)	Find the top 3 Married customers based on their gold spending.

market = read_excel(file.choose())
top_3 = market %>% group_by(ID) %>% filter(Marital_Status == 'Married') %>% summarise(Marital_Status,MntGoldProds) %>% arrange(-MntGoldProds) %>% head(3)
top_3

# 2)	Find the number of customers who complained in the last 2 year and spent more than 300 on wine.
no_of_cust = market %>% select(ID, Complain, MntWines) %>% filter(Complain == 1 & MntWines > 300) %>% nrow()
no_of_cust

# 3)	Get the month name from the date of customer joining. Find the total amount spend on meat based on the month of joining.

sums = as.data.frame.list(tapply(market$MntMeatProducts, format(as.Date(market$Dt_Customer), "%B"), sum))
sums

# 4)	Based on the recency score, amount spent on sweet, and amount spent on fish, predict the income of the customers. 
#What will be the income for a customer whose recency score is 60, amount spent on sweet is  200 
#and amount spent on meat is 400. 
set.seed(100)
sampleindex = sample(nrow(market), 0.7*nrow(market))
train = market[sampleindex,]
View(train)
test = market[-sampleindex,]
View(test)
train_size = dim(train)
train_size
test_size = dim(test)
test_size
model = lm(Income ~ Recency + MntSweetProducts + MntMeatProducts, data = train)
summary(model)
income = 41801.21 + (-24.07*60) + (95.23*200) + (56.22*400)
income

# 5)	Plot a bar chart between the number of teenagers in home and the average amount spent on fish.
df = market %>% select(Teenhome) %>% filter(Teenhome==1)
df
count(df)
df1 = market %>% select(MntFishProducts) %>%summarise(avg=mean(MntFishProducts))
df1
d = cbind(count(df),df1)
d
bar1 = ggplot(d,aes(x=n,y=avg))
bar1
bar2 = bar1 + geom_bar(stat = 'identity',
                       width = 0.01, fill = 'Red')
bar2
bar3 = bar2 + theme_bw()
bar3
bar4 = bar3 + labs(title='Number of teenagers in home and the average amount spent on fish')
bar4
bar5 = bar4 + geom_text(aes(label=37.53),vjust=-0.2)
bar5

# 6)	For the complete data take 25 random samples and 
#find if there is a significant difference between the amount spent on wine and amount spent on meat, 
#for the 25 data points. Frame the null and alternate hypothesis and attain the conclusion.
# H0 = There is a no significant difference between the amount spent on wine and amount spent on meat
# H1 = There is a significant difference between the amount spent on wine and amount spent on meat
#sample(market, size = 25, replace = TRUE, prob = NULL)
#a=sum(sample(market$MntWines, size=25))
#a
#b=sum(sample(market$MntMeatProducts, size=25))
#b
#x=market[sample(nrow(market),25),]
#x
#t.test(x$MntWines,x$MntMeatProducts,paired=FALSE)

z=sample_n(market,25)
z
t.test(z$MntWines,z$MntMeatProducts,paired=FALSE)

# As we can observe that there is a significant difference in sum of amt spent on wine & meat
# we reject the H0
