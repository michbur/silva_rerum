library(dplyr)

readLines("cran2roxygen_example.txt") %>%
  gsub('"', " ", ., fixed = TRUE) %>%
  gsub("[(),]", " ", .) %>%
  gsub("[ ]{1,}", " ", .) %>%
  gsub("^ ", "", .) %>%
  gsub("importFrom", "\n#' @importFrom", .) %>%
  cat(., sep = "", file = "result.txt")
