# Using data set 'Prime TV Shows Data set': It contains the details of TV shows in Amazon Prime OTT. 
install.packages('readxl')
library(readxl)
install.packages('dplyr')
library(dplyr)
install.packages('ggplot2')
library(ggplot2)

# Using a bar chart to plot the number of shows in each 'Age of viewers' category
Prime_TV_Shows=read.csv("Prime TV Shows Data set.csv")
Prime_TV_Shows
new_df=Prime_TV_Shows %>% group_by(Age.of.viewers) %>% count()
bar1=ggplot(new_df,aes(x=Age.of.viewers,y=n))
bar1
bar2=bar1+geom_bar(stat='identity',width = 0.6,aes(fill=Age.of.viewers))
bar2
bar3=bar2+labs(y='Number of shows')
bar3
bar4=bar3+labs(title='Total shows in each Age of viewers category')
bar4
bar5=bar4+theme(legend.position = 'top')
bar5
bar6=bar5+theme_bw()
bar6

#	Plotting a histogram for the 'IMDb Rating'
hist(Prime_TV_Shows$IMDb.rating,main = 'IMDB rating of Movies',
     xlab = 'IMDB ratings',
     ylab = 'Number of movies',
     border = T,col='gray')

# Plotting a bar chart for the top 3 shows based on 'IMDb Rating'.
Top3_shows=Prime_TV_Shows %>% group_by(IMDb.rating) %>% count() %>% tail(3)
Top3_shows

MovieBar1=barplot(Top3_shows$n,names.arg = Top3_shows$IMDb.rating,xlab='Movie rating',ylab='Number of movie',col="gray")
MovieBar1



#	Plotting a pie chart between the number of shows released and the years 2018,2019,2020.
number_of_shows_released=Prime_TV_Shows %>% group_by(Year.of.release) %>% count() %>% tail(3)
number_of_shows_released
pie(number_of_shows_released$Year.of.release,number_of_shows_released$n,radius = 1,clockwise = T,col = rainbow(3))



