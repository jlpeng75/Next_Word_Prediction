### create a corpus file
setwd("C:/Users/jpeng/Documents/courses/DataScienceCapstone/final/Next_Word_Prediction")

load("en_US_sample.Rdata")
en_US_sample <- c(twitter_sample, blogs_sample, news_sample)

library(tm)
library(RWeka)

corpus <- Corpus(VectorSource(en_US_sample))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
save(corpus, file = "corpus.Rdata")
