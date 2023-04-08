### Today we will learn about 3 more functions of dplyr####
#4) group_by() - This will help you group the data
#5) summarise() - This will help you to aggregate the data
#6) mutate() - This will help you create derived columns


ott = read.csv(file.choose())
library(dplyr)
#1) find the number of movies on each platform
platform = ott %>% group_by(Platform) %>% count()

#2) Find the number of movies on each language
language = ott %>% group_by(Language) %>% count()

#3) Find the top 3 countries based on number of movies
top3_country = ott %>% group_by(Country) %>% 
  count()%>% arrange(-n) %>% head(3)

top3_country = rename(top3_country,No_of_movies=n)

#4) Find the top 3 genre based on number of movies
top3_genre = ott %>% group_by(Genres) %>% 
  count()%>% arrange(-n) %>% head(3)

top3_genre = rename(top3_genre,`No of movies`=n)



#Lets import the sample superstore data
# The extension of that file is .xlsx, which means we 
# need a separate library for it.
install.packages(readxl)
library(readxl)

#There are 3 different sheets in superstore
orders = read_excel('Sample-Superstore-Subset-Excel.xlsx')
#By default always the first sheet would be imported

returns = read_excel('Sample-Superstore-Subset-Excel.xlsx',sheet = 2)
users = read_excel('Sample-Superstore-Subset-Excel.xlsx',sheet = 3)

#1) Find the total sales of each region
region_sales = orders %>% group_by(Region) %>% 
  summarise(Total_sales = sum(Sales))

#2) Find the average profit of each region
region_profit = orders %>% group_by(Region) %>%
  summarise(Avg_Profit = mean(Profit))
region_profit
# Find the average sales of each customer segment
segment_sales = orders %>% group_by(`Customer Segment`) %>%
  summarise(Avg_sales = mean(Sales))


#3)Find the Average Profit and total sales of each product category.
multi_case = orders %>% group_by(`Product Category`) %>%
  summarise(Avg_Profit = mean(Profit),Total_sales = sum(Sales)) 
multi_case

#4) Find which product subcategory has the highest sales
# and what is the profit to sales ratio of this particular sub category

orders %>% group_by(`Product Sub-Category`) %>%
  summarise(Total_sales = sum(Sales),Total_profit=sum(Profit)) %>%
  arrange(-Total_sales) %>% mutate(Ratio =Total_profit/Total_sales)%>%
  head(1)
