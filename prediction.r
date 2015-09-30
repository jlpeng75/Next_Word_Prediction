## Load ngram_frequency data

library(data.table)
library(dplyr)
library(stringr)


corpus <- read.table("ngram_freq.csv", header = T, stringsAsFactors = F)
corpus <- as.tbl(corpus)
four_gram <- filter(corpus, n_gram == "four")
tri_gram <- filter(corpus, n_gram == "tri")
bi_gram <- filter(corpus, n_gram == "bi")
uni_gram <- filter(corpus, n_gram =="uni")
pred <- uni_gram

prediction <- function(x){
  x <- tolower(x)
  x <- str_replace_all(x, pattern = "[[:punct:]]", "")
  x <- str_replace_all(x, pattern = "\\d+", replacement = "")
  x <- str_replace_all(x, pattern = "\\s+", " ")
  x <- str_trim(x, side = "both")
  
  if (length(unlist(strsplit(x, " "))) >= 3){
    x <- word(x, -3, -1)
    if (x %in% four_gram$mat_word){
      pred <- filter(four_gram, mat_word == x)}
    else if(!x %in% four_gram$mat_word){
      x <- word(x, -2, -1)
      if (x %in% tri_gram$mat_word){
        pred <- filter(tri_gram, mat_word == x)}
      else if (!x %in% corpus){
        x <- word(x, -1)
        if (x %in% bi_gram$mat_word){
          pred <-filter(bi_gram, mat_word == x)} 
      }
    }
  }
  else if (length(unlist(strsplit(x, " "))) == 2){
    if (x %in% tri_gram$mat_word){
      pred <- filter(tri_gram, mat_word == x)}
    else if(!x %in% tri_gram$mat_word){
      x <- word(x, -1)
      if (x %in% bi_gram$mat_word){
        pred <-filter(bi_gram, mat_word == x)} 
    }
  }
  else if (length(unlist(strsplit(x, " "))) == 1){
    if (x %in% bi_gram$mat_word){
      pred <- filter(bi_gram, mat_word == x)}
  }
  pred <- arrange(pred, desc(counts))
  pred <- select(pred, pred_word, counts)
  pred <- as.data.frame(pred)
  
  return(pred)
  
  }