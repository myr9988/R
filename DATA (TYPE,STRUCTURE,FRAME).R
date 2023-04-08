#Data types in R
#class function will give you the data type of the variable
#Numeric
a = 20
class(a)
b = 3.14
class(b)
# In R, both decimal and whole numbers will be 
# considered as numeric

#Integer
c = 15L
class(c)

#Character
name = 'Kaushik'
class(name)
location = 'Chennai'
org = 'KPMG'

#There is a command in R called as paste()
# paste() will concatenate all the string into one variable
complete = paste(name,location,org)
complete

complete1 = name+location+org

#If we want to count the number of characters in a text, 
# we can use the command nchar()
nchar(name)
nchar(location)
nchar(org)
nchar(complete)
complete

#I want to use a separator

complete = paste(name,location,org,sep = '@')
complete

#Boolean
k = TRUE
class(k)
p = F



#Date
date = "09-04-2021"
class(date)

#If we want to declare a date, we need to use the function
# as.Date()
date = as.Date("09-04-2021")
class(date)

#the general date format in R is yyyy-mm-dd
date = as.Date("04-09-2021",format = '%d-%m-%Y')
date

#If we want to know the date of today
today = Sys.Date()
today

#If we want to know the time of today
now = Sys.time()
now

today=format(as.Date(Sys.Date(), '%m/%d/%Y'), '%d/%m/%Y')
today

class(date)
class(now)
?POSIXct



#### Data Structures in R #####
#Vector - Collection of data in a normal format (single dimension)
emp_name = 'Akash'
emp_name = 'Amit'
emp_name = c('Akash','Amit','Bala','Churchill','Kaushik','Gowtham')
class(emp_name)

age = c(20,23,25,26,3,40,30)
class(age)

details = c(20,30,FALSE,'TRUE')
class(details)
details

#If we want to know the number of elements in the vector
# We can use the function length()
length(emp_name)

length(age)
emp_name

#Accessing an element in a vector - square bracket indexing
emp_name[3]

# IN R the index always starts with 1

# We want to access only the 1st name, 3rd name and 5th name
emp_name[c(1,3,5)]


#We want to access all the elements staring from 3 till the last element

emp_name[c(3:6)]
#If we dont want the first name we can use -1
emp_name[-3]

age
#If i want to sort the elements in my vector
sort(age)
sort(age,decreasing = TRUE)
?sort


#Dataframe - When our data is in rows and columns, it is called
# a data frame

# Data frame can be created with multiple vector
name = c('Stephen','Srijith','Amit','Kaushik')
age = c(22,23,25,24)
department = c('Analytics','HR',"Finance",'Analytics')

#Lets create a dataframe using the function data.frame()
emp_df = data.frame(name,age,department)
View(emp_df)

#Lets learn about a few function in a dataframe
# 1) View - if we want to look at our data

# 2) head() - It will show you the top 6 rows
head(emp_df)
head(emp_df,3)

# 3) tail() - It will show you the last 6 rows
tail(emp_df,1)

# 4) dim() - It will show you the dimension of your df
dim(emp_df)

# 5) str() - This will give info about the columns data type
str(emp_df)

# 6) names() - This will show you the names of the columns
names(emp_df)
