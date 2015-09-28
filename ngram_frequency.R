## Load the ngram data
setwd("C:/Users/jpeng/Documents/courses/DataScienceCapstone/final/Next_Word_Prediction")
load("ngram.Rdata")
library(data.table)
library(slam)
library(dplyr)
library(stringr)

## frequency count
freq_trigram <- row_sums(trigram_tdm)
freq_bigram <- row_sums(bigram_tdm)
freq_unigram <- row_sums(unigram_tdm)
freq_fourgram <- row_sums(fourgram_tdm)

tri_freq <- data.table(term = names(freq_trigram), counts = freq_trigram)
names(tri_freq) = c("term", "counts")
tri_freq$n_gram <- "tri"

bi_freq <- data.table(term = names(freq_bigram), counts = freq_bigram)
names(bi_freq) = c("term", "counts")
bi_freq$n_gram <- "bi"

uni_freq <- data.table(term = names(freq_unigram), counts = freq_unigram)
names(uni_freq) = c("term", "counts")
uni_freq$n_gram <- "uni"

four_freq <- data.table(term = names(freq_fourgram), counts = freq_fourgram)
names(four_freq) = c("term", "counts")
four_freq$n_gram <- "four"

## combine four dataframe, four_freq, tri_freq, bi_freq, and uni_freq into one larger dataframe, ngram_freq
ngram_freq <- rbind(four_freq, tri_freq, bi_freq, uni_freq)

## discard the terms with counts less than 2, in order to reduce the data size.

ngram_freq <- filter(ngram_freq, counts >= 2)
mat_word <- word(ngram_freq$term, 1, -2)
pred_word <- word(ngram_freq$term, -1)
ngram_freq$mat_word <- mat_word
ngram_freq$pred_word <- pred_word
ngram_freq <- select(ngram_freq, n_gram,counts, mat_word, pred_word)


write.table(ngram_freq, file = "ngram_freq.csv")

