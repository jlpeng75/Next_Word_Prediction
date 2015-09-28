tdm.generate <- function(string, ng){
  options(mc.cores=1) # http://stackoverflow.com/questions/17703553/bigrams-instead-of-single-words-in-termdocument-matrix-using-r-and-rweka/20251039#20251039
  ngramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = ng, max = ng)) # create n-grams
  tdm <- TermDocumentMatrix(corpus, control = list(tokenize = ngramTokenizer)) # create tdm from n-grams
  tdm
}
