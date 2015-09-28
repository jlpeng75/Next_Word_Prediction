## load the corpus data
setwd("C:/Users/jpeng/Documents/courses/DataScienceCapstone/final/Next_Word_Prediction")
load("corpus.Rdata")

### tri-gram generation

## This transformed corpus was then converted into a trigram term document matrix. (It is entirely possible to create any n-gram, TDM.), In this report, only trigram was illustrated. To reduce the data size, removeSparseTerms function was used to remove the sparsely used terms. 
library(tm)
library(RWeka)

tdm.generate <- function(string, ng){
  options(mc.cores=1)
  ngramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = ng, max = ng))
  tdm <- TermDocumentMatrix(corpus, control = list(tokenize = ngramTokenizer))
}
trigram_tdm <- tdm.generate(corpus, 3)
save(trigram_tdm, file = "trigram_tdm.csv")


### bi-gram, uni-gram and 4-gram generation


bigram_tdm <- tdm.generate(corpus, 2)
save(bigram_tdm, file = "bigram_tdm.csv")
unigram_tdm <- tdm.generate(corpus, 1)
save(unigram_tdm, file = "unigram_tdm.csv")
fourgram_tdm <- tdm.generate(corpus, 4)
save(fourgram_tdm, file = "fourgram_tdm.csv")

save(fourgram_tdm, trigram_tdm, bigram_tdm, unigram_tdm, file = "ngram.Rdata")