#creating a vector
vector1 = c(11,20,22,-31,-15,8,13)
vector1
mayur = vector1
mayur
length(mayur)
sort(mayur,decreasing = TRUE)
mayur[3]
#Data frame
'MHG' = data.frame(
  name = c('x','y','z','a','b','c','m','n'),
  department = c('sales','finance','logistics','operations','human resource',
                 'purchase','production','technology'),
  experience = c(10,12,9,8,11,5,2,13),
  age = c(40,42,35,34,41,44,30,28),
  mobile_numbers = c(9970755208,9561418875,8888235247,9860289765,8668543786,
                     9881236745,9456789876,9552347890))
first_row = head(MHG,n = 3)
last_row = tail(MHG,n = 3)
#Revenue analysis
april = read.csv(file.choose())
april_df = read.csv('April Revenue.csv')
may = read.csv(file.choose())
may_df = read.csv('May Revenue.csv')
june = read.csv(file.choose('June Revenue.csv'))
june_df = read.csv('June Revenue.csv')
total_revenue = rbind(april_df,may_df,june_df)
total_revenue_df = total_revenue
str(total_revenue_df)
max_amount = subset(total_revenue_df,Amount == max(Amount))
filter_val = subset(total_revenue_df,Order.Total>7000)
nrow('Order.Total')
#Global sales analysis
install.packages(readxl)
library(readxl)
Orders = read_excel('global_sales.xlsx')
install.packages("dplyr")
library(dplyr)
southern_asia = Orders %>% filter(Region=='Southern Asia') %>% nrow()
total_sales = Orders %>% group_by(Sales) %>% summarise(total_sales = sum(Sales))
top3_market = Orders %>% group_by(Market) %>% summarise(avg_profit = mean(Profit)) %>% head(3)
location = Orders %>% select(`Customer Name`, City, State)
