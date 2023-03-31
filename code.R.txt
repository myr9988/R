install.packages('tidyverse')
library(tidyverse)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
data=read.csv("Train.csv")
sample=data %>% select(Product_importance,Gender)
ware<-aggregate(data$Customer_care_calls~data$Warehouse_block,FUN=sum)
View(ware)

pie(ware$`data$Customer_care_calls`, labels = ware$`data$Customer_care_calls`,
    main ="Warehouse with highest Customer care calls")
median(data$Customer_rating)   
filtered_data<-data %>% filter(Customer_rating>3)
head(filtered_data)
ggplot(filtered_data)+geom_bar(mapping=aes(x=Reached.on.Time.Y.N),fill='blue')

library(tidyverse)# metapackage with lots of helpful functions
install.packages('tm')
library(tm)
install.packages('SnowballC')
library(SnowballC)
install.packages('caTools')
library(caTools)
install.packages("e1071")
library(e1071)
install.packages('caret')
library(caret)
install.packages('gmodels')
library(gmodels)
install.packages('lattice')
library(lattice)
install.packages('pROC')
library(pROC)
install.packages('ROCR')
library(ROCR)
install.packages('randomForest')
library(randomForest)
rfNews()## Running code
tweet=read.csv('dataset.csv',header=F,stringsAsFactors = FALSE)
str(tweet)
## removing unused col from data frame
tweet<-tweet[,-c(2,3,4,5)]
str(tweet)

#===================================================
#shuffling rows of data frame 
tweet <- tweet[sample(nrow(tweet)),]
#col names to data frame
colnames(tweet)<-c("polarity","text")
#changing label from char to factor form
tweet$polarity<-factor(tweet$polarity)
##structure of data frame 
str(tweet)
### splitting big data file to 1/100 of it's size
ind<-createDataPartition(tweet$polarity,p=1/1600,list = FALSE)
tweet1<-tweet[ind,]
#str(tweet1)

#===============================================
#Remove non english words
tweet1 <- tweet1[which(!grepl("[^\x01-\x7F]+", tweet1$text)),]
str(tweet1)

#create corpus (data structure in R for test mining and manipulation)
install.packages('corpus')
library(corpus)

tweet_corpus<-Corpus(VectorSource(tweet1$text))
print(tweet_corpus)


#============================================================================================================
# to lower+ remove number+ remove stopwords + 
#remove punctuation + trim whitespaces + stem document +
#remove url+ only letters 

NumPunct<- function(x) gsub("[^[:alpha:][:space:]]*","",x)
removeURL<-function(x) gsub("http[^[:space:]]*","",x)
tweet_clean<-tm_map(tweet_corpus,content_transformer(removeURL))
tweet_clean<-tm_map(tweet_clean,content_transformer(NumPunct))
tweet_clean<-tm_map(tweet_clean,removeNumbers)
tweet_clean<-tm_map(tweet_clean,removeWords,stopwords())
tweet_clean<-tm_map(tweet_clean,removePunctuation)
tweet_clean<-tm_map(tweet_clean,stemDocument)
tweet_clean<-tm_map(tweet_clean,stripWhitespace)
tweet_clean<-tm_map(tweet_clean,removeWords,letters)
tweet_clean<-tm_map(tweet_clean,content_transformer(tolower))


#=========================================================================================================
as.character(tweet_clean[[9]])

#SPlitting text doxuments into words
#corpus into MATRIX
tweet_dtm<-DocumentTermMatrix(tweet_clean)
inspect(tweet_dtm)
S_DTM <- removeSparseTerms(tweet_dtm, 0.996)
S_DTM
inspect(S_DTM)
#=======================================================================
##changing document term matrix explicitly into data frame
tweetsS <- as.data.frame(as.matrix(S_DTM))
colnames(tweetsS) <- make.names(colnames(tweetsS))

##adding polarity in DTM data frame as one of the column
tweetsS$polarity <- tweet1$polarity
tweetsS
nrow(tweetsS)

#=========================================================================
####Partition in train and test


ind<-createDataPartition(tweetsS$polarity,p=0.85,list = FALSE)
tweet_dtm_train<-tweetsS[ind,]
tweet_dtm_test<-tweetsS[-ind,]
prop.table(table(tweet_dtm_train$polarity))
prop.table(table(tweet_dtm_test$polarity))
#==========================================================================================
####Cross validation control
library(caret)
Control<-trainControl(method="cv",number=10)

#Random Forest

#train model with 10 k fold cross validation
tweet_RF_Model<-train(polarity~.,data=tweet_dtm_train,method="rf",parms = list(split = "information"),
                      trControl=Control,na.action=na.roughfix)

#train model with out 10 k fold cross validation
#tweet_RF_Model <- randomForest(label~ . , data = tweet_dtm_train,na.action=na.roughfix)

####Cross validation control
predict_tweet_RF <- predict(tweet_RF_Model, newdata = tweet_dtm_test)
###CROSS TABLE

CrossTable(predict_tweet_RF,tweet_dtm_test$polarity,prop.chisq = FALSE,prop.t = FALSE,prop.r=FALSE,dnn=c('predicted','actual'))

#=========================================================================================
#predicting result in probability to calculate AUC

PredictionRF<-predict(tweet_RF_Model,tweet_dtm_test,type = "prob")
head(PredictionRF)    
#===========================================================================
###AUC score
roc<-roc(tweet_dtm_test$polarity,PredictionRF[,1])
roc
roc$auc
#=======================================================================================
##CONFUSION MATRIX
confusionMatrix(predict_tweet_RF,tweet_dtm_test$polarity)
#===============================================================
neutral <- length(which(tweet1$polarity == 3))
neutral
positive <- length(which(tweet1$polarity > 3))
negative <- length(which(tweet1$polarity < 3))
Sentiment <- c("Positive","Neutral","Negative")
Count <- c(positive,neutral,negative)
output <- data.frame(Sentiment,Count)
output$Sentiment<-factor(output$Sentiment,levels=Sentiment)
ggplot(output, aes(x=Sentiment,y=Count))+
  geom_bar(stat = "identity", aes(fill = Sentiment))+
  ggtitle("Barplot of Sentiment type of 4000 tweets")

#===============================================================
#for wordcloud
install.packages("wordcloud")
library(wordcloud)
install.packages("RColorBrewer")
library(RColorBrewer)

tweetsS <- as.data.frame(as.matrix(S_DTM))
colnames(tweetsS) <- make.names(colnames(tweetsS))
tweetsS<- sort(rowSums(tweetsS), decreasing = TRUE)
tweetsS <- data.frame(word = names(tweetsS), freq =tweetsS)
set.seed(123)
wordcloud(tweet_clean, min.freq = 1, max.words = 100, scale = c(2.2,1),
          colors=brewer.pal(8, "Dark2"), random.color = T, random.order = F)
