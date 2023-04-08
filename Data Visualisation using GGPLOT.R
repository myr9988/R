#### GGPLOT #####
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
df = economics
?economics
#Draw a line chart between date and unemployment
line1 = ggplot(df,aes(x=date,y=unemploy)) + 
  geom_line(colour = 'red',size=1) 
line1

line2 = line1+ggtitle('Unemployment of USA')
line2

line3 = line2+theme_minimal()
line3

#Let us learn about scatter plot###

df2 = faithful
?faithful

ggplot(df2,aes(x=eruptions,y=waiting,colour=eruptions>3))+
  geom_point()

#bar chart using dc store sales##
library(readxl)
store = read_excel('DC Store Sales.xlsx')

#Example -Plot the city wise total sales

df3 = store %>% group_by(City) %>% summarise(total_sales=sum(Total))

# Step 1 - Create the canvas for a bar chart
bar1 = ggplot(df3,aes(x=City,y=total_sales))
bar1

#Step 2 - Mentioning the type of plot
bar2 = bar1+ geom_bar(stat='Identity',width = 0.3,aes(fill=City))
bar2


#Here onwards, we will add new layers to the plot.

#theme_bw() - theme black and white will help you remove the
# background grey color
bar3 = bar2+theme_bw()
bar3


#theme() - the theme() function will contain a lot of commands

# axis.title.x = this command will help you modify the title of x axis
# axis.text.x = this command will help you modify the text of x axis
# axis.ticks.x = this command will help you modify the title of x axis


#For example - Let us rotate the text of x axis
bar3 + theme(axis.text.x = element_text(angle=90))

#Put a data label - this can be done using geom_text(aes(label))

bar4 = bar3 + geom_text(aes(label=paste('$',round(total_sales/100000,2),"L")),
                        vjust=-0.2)
bar4


#Since the y axis is not giving any extra information, let us remove it
bar5 = bar4 + theme(axis.title.y = element_blank(),
                    axis.text.y = element_blank(),
                    axis.ticks.y=element_blank())
bar5


#To add a new title we can use command labs()
bar6 = bar5 + labs(title = 'Total Sales City wise')
bar6


#Handling the legend
bar7 = bar6+theme(legend.position = 'top')
bar7



#all the codes can be written in single line

bar_plot = ggplot(df3,aes(x=City,y=total_sales))+
  geom_bar(stat='Identity',width = 0.3,aes(fill=City)) +
  theme_bw() +geom_text(aes(label=paste('$',round(total_sales/100000,2),"L")),
                        vjust=-0.2)+
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y=element_blank()) +
  labs(title = 'Total Sales City wise') +
  theme(legend.position = 'top')
bar_plot


#Converting a vertical bar plot into horizontal bar plot, 
# we can do it by coord_flip()
bar_plot + coord_flip()
store = DC_Store_Sales