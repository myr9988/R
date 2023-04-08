##### DPLYR - Package ######
# It is a data wrangling or manipulation package.
# There are 6 key functions in dplyr() 
# 90% of the data manipulation can be done using dplyr

#1) filter() - This will help you to extract rows based on conditions
#2) select() - This will help you to select particular columns 
#3) arrange() - This will help you sort the data based on a column
#4) group_by() - This will help you group the data
#5) summarise() - This will help you to aggregate the data
#6) mutate() - This will help you create derived columns

#Pipline statement - A dplyr always consists of a pipeline
 # %>% The function in a pipeline will be executed from left to right
# f1 %>% f2 %>% f3 %>% f4


#Importing the OTT data
ott = read.csv(file.choose())
install.packages("dplyr")
library(dplyr)
#1) Number of movies language wise
tamil = ott %>% filter(Language=='Tamil') %>% nrow()
tamil
english = ott %>% filter(Language=='English') %>% nrow()
english

#2) No of movies genre wise
action7 = ott %>% filter(Genres=='Action'&IMDb>7) %>% nrow()
action7
comedy = ott %>% filter(Genres=='Comedy'&IMDb>8.5)%>% nrow()

drama = ott %>% filter(Genres=='Drama'|IMDb>8.5) %>% nrow()
drama

documentary = ott%>%
  filter(Genres=='Documentary'&Platform=='Netflix')%>%
  nrow()

### Select() - This command will help you get only specific columns##
partial = ott %>% select(Title,Directors,IMDb)

#The columns will be arranged based on your code

#Extract the columns that starts with G
g_column = ott %>% select(starts_with('G'))

#I would recommend the participants to explore
# endswith(), contains(),grepl() and matches()



##Arrange() - This function will sort the data
# By default the sorting happens in ascending order
# If we want descending order, we need to use - sign

# Top 10 movies - Rotten tomatoes
top10 = ott %>% arrange(-Rotten.Tomatoes)%>% head(10)

#Top 3 movies - Runtime
top3 = ott %>% arrange(-Runtime) %>% head(3)


#Find the top 3 indian movies based on runtime in Netflix
top3_indian_nflix = ott %>% 
  filter(Country=='India'&Platform=='Netflix')%>%
  arrange(-Runtime) %>% head(3) %>% select(Title)
