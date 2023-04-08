#Data Visualization
#Importing the spotify dataset
spotify = read.csv('Spotify.csv')
x = c(25,14,18,27,15)
barplot(x)
#A bar plot for beats per minute
barplot(spotify$Beats.Per.Minute)

#Since bar plot doesnt make much sense, we will use a histogram
hist(spotify$Beats.Per.Minute)
# lets make the histogram better
hist(spotify$Beats.Per.Minute,
     breaks = 5,
     main = 'Distribution of beats per minute',
     xlab='Beats per minute',
     ylab='Frequency of songs',
     col = '#FF4500')

#Lets us plot a histogram for valence
hist(spotify$Valence.,
     breaks=4,
     main='Happiness Distribution',
     xlab='Valence of the song',
     ylab='Number of songs',
     col = '#FF1493')


#Plotting a boxplot for length column
boxplot(spotify$Length.,
        horizontal = T,
        notch = T,
        main='Boxplot of length of the song',
        sub='Length is in seconds',
        xlab='Length of the song',
        col = '#DAA520')

?boxplot
#Scatter plot between speechiness and popularity
plot(spotify$Speechiness.,spotify$Popularity,col='Red')

library(dplyr)
top3 = spotify %>% group_by(Genre) %>% 
  summarise(avg_liv = mean(Liveness)) %>%
  arrange(-avg_liv) %>%head(3)

#Pie chart between genre and avg_liv
pie(top3$avg_liv,top3$Genre,
    radius = 1.2,
    clockwise = T,
    col=rainbow(3))

num_col = spotify[c(5:14)]
x_cor = cor(num_col)
heatmap(x_cor)
install.packages('pheatmap')
library(pheatmap)
pheatmap(x_cor,display_numbers = T)
