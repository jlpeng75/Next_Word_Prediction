## set the working directory

setwd("C:/Users/jpeng/Documents/courses/DataScienceCapstone/final/Next_Word_Prediction")

## read data from en_US.twitter.txt file
con <- file("en_US.twitter.txt", "r")
twitter.data <- readLines(con, skipNul = T)
close(con)

## read data from en_US.blog.txt file

con <- file("en_US.blogs.txt", "r")
blogs.data <- readLines(con, skipNul = T)
close(con)

## read data from en_US.news.txt file

con <- file("en_US.news.txt", "r")
news.data <- readLines(con, skipNul = T)
close(con)

save(twitter.data, news.data, twitter.data, file = "raw_data.Rdata")