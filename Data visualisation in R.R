# Data visualization in R
# 1. BAR CHART
# They are pictorial representation of grouped data. Compares different categories.
# Categories are plotted on x-axis & values are plotted on y-axis.
# It is useful when we have to look at data & make comparison,it gives us an idea about the magnitude of different categories.

install.packages("ggplot2")
library(ggplot2)
x = c(24,13,7,5,3,2)
barplot(x,col = "red3")
barplot(x, col = c("#FF1493", "#EE2C2C", '#8A2BE2', '#76EE00', '#228B22'))
# Using color palette - it refers to a range of colors
barplot(x, col = 1:6)
barplot(x, col = rainbow(6))
barplot(x, col = heat.colors(6))
barplot(x, col = terrain.colors(6))
barplot(x, col = topo.colors(6))
barplot(x, col = cm.colors(6))


# 2. HISTOGRAM
# It can be used where we want to visualize the distribution of continuous measurements
# It measures the frequencies but target variable is numeric continuous variable
# It is first necessary to 'bin' observed data, we need to define intervals & then count number of observation in each bin

diamonds # inbuilt dataset (ggplot2 library)
hist(diamonds$price)
# we can see that most diamonds are priced between 0-5000$
# it has the right skewed distribution
# only few diamonds are priced>15000
# HISTOGRAM with parameters
hist(diamonds$price,
     breaks = 7, # suggests no of breaks
     main = "Distribution of Price of Diamonds",
     sub = "(Source:ggplot2::diamonds)",
     ylab = "Frequency",
     xlab = "Price of Diamonds",
     border = NA, # no borders on bars
     col = "#FF4500" # orangered1
)


# 3. BOX PLOT
# It is a visual representation of statistical 5 no summary of given data points
# Summary includes 1)minimum 2)1st quartile 3)median 4)3rd quartile 5)maximum
# Major use of boxplot is to identify outliers.

boxplot(diamonds$price)
library(dplyr)
diamonds %>%
  select(price) %>%
  boxplot(
    horizontal = T,
    notch = T, # confidence interval for median
    main = "Boxplot of Price of Diamonds",
    sub = "(Source:ggplot2::diamonds)",
    xlab = "Price of Diamonds",
    col = "#c71585"
  )


# 4. SCATTER PLOT
# It uses dots or circles to represent the relationship of values between
# 2 numeric variables & it will identify the relationship between them.
# Independent variable is plotted on x-axis while dependent variable is plotted
# on y-axis.
# Position of each dot indicates values for an individual data point.

df = read.csv('StateData.csv')
plot(df$instagram,df$facebook)
# Plotting using ggplot2
ggplot(data=df) + 
  geom_point(mapping=aes(x=instagram,
                         y=facebook,
                         color=as.factor(x=governor)))


# 5. BUBBLE CHART
# It is an enhanced version of scatter plot, size will be based on the magnitude 
# of category.
# It can be used to define relationship of more than 2 variables.
# It can be used when we want data to be visualised in a free form.

library(tidyverse)
df1=mpg
bubble = ggplot(df1, aes(x=cty,y=hwy)) + 
                  geom_jitter(aes(col=class,size=cyl))
bubble


# 6. LINE CHART
# It is a type of a plot that uses points connected by line segments from left to
# right to demonstrate changes in values over the period of time & used when time
# element is attached with the data.
# Data value will be plotted on x-axis & numeric value will be plotted on y-axis.

library(datasets)
uspop
plot(uspop)
