## set the working directory

setwd("C:/Users/jpeng/Documents/courses/DataScienceCapstone/final/en_US")

## Data sampling and partition and transformation
load("raw_data.Rdata")

## A random subset (representing 1% of total twitter data set) was used for this preliminary analysis. And subset was partitioned into training and testing set. The subsetted Twitter corpus was transformed with the tm package. The data was cleaned by several steps, tolower, removePunctuation, removeNumbers, remove stopwords, stripWhitespace.

set.seed(1000)
twitter_sample <- sample(twitter.data, 118007, replace = F)
save(twitter_sample, file = "twitter_sample.txt")
set.seed(1000)
news_sample <- sample(news.data, 3862, replace = F)
save(news_sample, file = "news_sample.txt")
set.seed(1000)
blogs_sample <- sample(blogs.data, 44964, replace = F)
save(blogs_sample, file = "blogs_sample.txt")

### save the three files to en_US_sample.Rdata
save(twitter_sample, blogs_sample, news_sample, file = "en_US_sample.Rdata")