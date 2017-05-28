library(rentrez)

search_year <- function(quotation, year){
  query <- paste(quotation, "AND (", year, "[PDAT])")
  entrez_search(db="pubmed", term=query, retmax=0)$count
}



year <- 1990:2017
pubs <- sapply(year, search_year, quotation = "peptide array[TIAB] OR peptide microarray[TIAB])")
pubs <- data.frame(year = year, n_pub = pubs)

mod <- nls(n_pub ~ exp(a + b * year), data = pubs[-nrow(pubs), ], start = list(a = 0, b = 0))

final_pubs <- cbind(pubs, pred = predict(mod, list(year = pubs[["year"]]))) %>% 
  melt(id.vars = "year") %>% 
  mutate(value = ifelse(variable == "pred" & year != 2017, 0, value)) %>% 
  mutate(variable = factor(variable, labels = c("Observed", "Predicted")))
