# R EXAM Q2 SOLUTION
library(dplyr)
library(readxl)
library(ggplot2)
# 1)	Create a column called as "Total Sales" and find the value. Find the average sales of each region
shop = read_excel(file.choose())
shop = shop %>% mutate(`Total Sales` = `Unit Price`*Quantity)

avg_sales = shop %>% group_by(Region) %>% summarise(`Average Sales` = mean(`Total Sales`))
avg_sales

# 2)	Find the top 3 cities based on average profit. Find the bottom 3 cities based on total profit.
top_3 = shop %>% group_by(City) %>% summarise(avg_profit = mean(Profit)) %>% arrange(-avg_profit) %>% head(3)
bottom_3 = shop %>% group_by(City) %>% summarise(total_profit = sum(Profit)) %>% arrange(total_profit) %>% head(3)

# 3)	Get the day name from the date of order. Find the total quantity ordered on each day name.
shop$day_name = format(shop$`Date of Order`,"%A")
shop
total_quantity = shop %>% group_by(day_name) %>% summarise(quantity_ordered = sum(Quantity))

# 4)	Based on the Age and Monetary Score, predict the total sales of the customers. 
#What will be the total sales for a customer whose Age is 35 and Monetary Score is 70.
sales_model = lm(`Total Sales`~Age+`Monetary Score`, data=shop)
summary(sales_model)
coef(sales_model)
total_sales_for_customer =  107153.37+(156.58*35)+( -16.25*70)
total_sales_for_customer
#totalSales = shop%>%filter(Age==35&`Monetary Score`==70)%>%summarise(TotalSales=sum(Sales))

# 5)	Find the average monetary score based on the customer type. Plot a pie chart for this data.
avg_score = shop %>% group_by(`Customer Type`) %>% summarise(avg_monetary_score=mean(`Monetary Score`))
pie(avg_score$avg_monetary_score,avg_score$`Customer Type`,main = 'average_score', 
    radius = 1, clockwise = TRUE, col=rainbow(3))
install.packages("plotrix")
library(plotrix)
pie3D(avg_score$avg_monetary_score,labels = avg_score$`Customer Type`,explode=0.1,main='average_score',)

# 6)	Find the average profit of each payment method and plot a bar chart for this data.
avg_profit = shop %>% group_by(`Payment Method`) %>% summarise(average_profit = mean(Profit))
bar1 = ggplot(avg_profit,aes(x=`Payment Method`,y=average_profit))
bar1
bar2 = bar1 + geom_bar(stat='Identity',width=0.6,aes(fill=`Payment Method`))
bar2
bar3 = bar2 + theme_bw()
bar3
bar4 = bar3 + geom_text(aes(label=paste('Rs',round(average_profit/1000,2),'k')),vjust=-0.2)
bar4
bar5 = bar4 + theme(axis.text.x = element_text(angle=90))
bar5
bar6 = bar5 + theme(axis.title.y=element_blank(),
                    axis.text.y = element_blank(),
                    axis.ticks.y = element_blank())
bar6
bar7 = bar6 + labs(title='Average Profit of each Payment Method')
bar7
bar8 = bar7 + theme(legend.position = 'top')
bar8
