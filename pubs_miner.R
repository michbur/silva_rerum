library(rentrez)
arch, rettype = "uilist")

search_year <- function(quotation, year){
  query <- paste(quotation, "AND (", year, "[PDAT])")
  entrez_search(db="pubmed", term=query, retmax=0)$count
}



year <- 1990:2017
pubs <- sapply(year, search_year, quotation = "peptide array[TIAB] OR peptide microarray[TIAB])")
dpcr_pubs <- data.frame(year = year, n_pub = pubs)

mod <- nls(n_pub ~ exp(a + b * year), data = dpcr_pubs[-nrow(dpcr_pubs), ], start = list(a = 0, b = 0))

final_pubs <- cbind(dpcr_pubs, pred = predict(mod, list(year = dpcr_pubs[["year"]]))) %>% 
  melt(id.vars = "year") %>% 
  mutate(value = ifelse(variable == "pred" & year != 2017, 0, value)) %>% 
  mutate(variable = factor(variable, labels = c("Observed", "Predicted")))

write.csv(final_pubs, file = "./data/dpcr_final_data.csv", row.names = FALSE)
