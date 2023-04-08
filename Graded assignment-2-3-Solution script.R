# Using the data set 'Question 3.xlsx'. Solving with the help of ggplot:
install.packages('readxl')
library(readxl)
install.packages('dplyr')
library(dplyr)
library(ggplot2)

# Using the sheet named Stock price and plotting a line chart between Date and Close columns. 
# Giving the title, axis labels and color
Stock_price=read_excel("Question 3.xlsx")
library(datasets)
Stock_price %>%
  plot(main='Stock price',sub='source:datasets::Stock',
       xlab='Date',ylab='close',col='red',type='l')

# Using the sheet named Sales vs Profit and plotting a scatter plot between sales and profit columns. 
# Using the region column to give colors in the scatter plot.
Sales_vs_Profit=read_excel("Question 3.xlsx",sheet = 2)
Sales_vs_Profit
ggplot(Sales_vs_Profit,aes(x=Sales,y=Profit,color=Region)) + geom_point()

# Using the sheet named Product Category Sales 
# Plotting a bar chart between Product Category and Sales. 
# Adding 5 layers to make the chart attractive.
Product_category_sales=read_excel("Question 3.xlsx",sheet = 3)
Product_category_sales                                
bar1=ggplot(Product_category_sales,aes(x=reorder(`Product Category`,-`Sales (in Millions)`),y=`Sales (in Millions)`))
bar1
bar2=bar1+geom_bar(stat = 'identity',width=0.2,aes(fill=`Product Category`))
bar2
bar3=bar2 + theme_bw()
bar3
bar4=bar2+geom_text(aes(label=paste('$',`Sales (in Millions)`,'M'),
                        vjust= -0.2))
bar4
bar5=bar4+theme(axis.title.y=element_blank(),
                axis.text.y=element_blank(),
                axis.ticks.y=element_blank())  
bar5
