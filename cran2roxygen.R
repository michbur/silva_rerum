# R function to covert suggestions from R ("consider adding blah blah blah") to roxygen
library(dplyr)

readLines("cran2roxygen_example.txt") %>%
  gsub(",", "", .) %>%
  gsub("(", " ", ., fixed = TRUE) %>%
  gsub(")", " ", ., fixed = TRUE) %>%
  gsub('"', '', ., fixed = TRUE) %>%
  gsub("[ ]{2,}", "", .) %>%
  gsub("importFrom", "\n#' @importFrom", .) %>%
  cat(., file = "result.txt")
