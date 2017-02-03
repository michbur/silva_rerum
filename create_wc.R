library(tm)
library(wordcloud)
library(dplyr)

polish_stopwords <- readLines("https://raw.githubusercontent.com/bieli/stopwords/master/polish.stopwords.txt")
words <- readLines("ojciec.txt") %>% 
  strsplit(" ") %>% 
  unlist() %>% 
  VectorSource() %>% 
  Corpus() %>% 
  tm_map(PlainTextDocument) %>% 
  tm_map(removePunctuation) %>% 
  tm_map(removeWords, c(polish_stopwords, "ponadto"))

set.seed(5)
wordcloud(words)
title("Wszystkiego najlepszego z okazji urodzin!", col.main = "red")
