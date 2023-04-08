name = c('Amit','Arun','Sarala','Suba','Kaushik','Logith','Kaushik')
name[4]
which(name=='Koushik')
name[5]

# Dataframe, rbind,cbind, import external dataset, 
# few data analysis,date function
student_name = c('Satish','Mohan','Shankar','Shaurya','Shreya')
student_mark = c(65,70,73,68,80)
student_dep = c('B.E','BBA','BCOM','MBA','Bsc')


student_df = data.frame(student_name,student_mark,student_dep)

# We want to add the location of each student
#Option 1 - We can use the cbind() function


#Step 1 : Create the vector
student_location = c('Delhi','Pune','Mysore','Coimbatore','Mumbai')
#Step 2 : Convert the vector into a dataframe
loc_df = data.frame(student_location)

#Step 3: Using cbind function
student_update = cbind(student_df,loc_df)

# Option 2 - To add a new column using $
# We need to add the age of each student
student_update$age = c(19,25,20,21,24)
student_update



#### Adding rows to our data frame####
#This can be done by rbind()

new_df = data.frame(student_name=c('John','Reese'),
                    student_mark = c(80,90),
                    student_dep = c('Science','Tech'),
                    student_location = c('Bangalore','Kerala'),
                    age = c(30,27))
final_df = rbind(student_update,new_df)


#### Importing excel sheets into R ####
books = read.csv(file.choose())
books_df = read.csv('goodreads_books.csv')


# Let us look at the structure of our dataframe
str(books_df)

#We will change the publication date into a date format
books_df$publication_date = as.Date(books_df$publication_date,
                                    format ='%m/%d/%Y')

#We will perform data analysis using the publication date column


# 1. Find the number of books that is 
# published in the month of July

#Create a new column with the name of the month from the date
books_df$month_name = format(books_df$publication_date,'%B')

# From the month name, filter out only july
july = subset(books_df,month_name=='July')

#using nrow to get the number of books
nrow(july)


# 2. Find the number of books written by
# Sidney Sheldon in the month of july
ss = subset(books_df, authors=='Sidney Sheldon' & 
              month_name == 'July')
ss


# 3. Find the book which has the highest rating_count
max_ratingc = subset(books_df,ratings_count == max(ratings_count)) 


max_ratingc


# 4. Find the book which has the highest average rating
high_rating = subset(books_df,average_rating == max(average_rating))


# 5. Find the number of books with pages greater than 600
pages = subset(books_df,num_pages>600)
nrow(pages)
