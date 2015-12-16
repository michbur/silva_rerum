library(dplyr)

readLines("https://raw.githubusercontent.com/michbur/silva_rerum/master/cran2roxygen/cran2roxygen_example.txt") %>%
  gsub('"', " ", ., fixed = TRUE) %>%
  gsub("[(),]", " ", .) %>%
  gsub("[ ]{1,}", " ", .) %>%
  gsub("^ ", "", .) %>%
  gsub("importFrom", "\n#' @importFrom", .) %>%
  cat(., sep = "", file = "result.txt")
