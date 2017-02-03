library(seqinr)
nucls <- c("A", "C", "T", "G")
aa <- a()[-1]

generate_seqs <- function(alph) {
  seq1 <- sample(alph, 12, replace = TRUE)
  seq2 <- seq1
  unigrams2change <- runif(12) < 0.4
  if(any(unigrams2change))
    seq2[unigrams2change] <- sample(alph, sum(unigrams2change), replace = TRUE)
  
  gap <- rpois(1, lambda = 1.8) + 1
  gap_id <- sample(2L:(12 - gap - 2), 1)
  seq2[gap_id:(gap + gap_id - 1)] <- "-"
  
  cat("Sekwencja 1: ", paste0(seq1, collapse = ""), "\n",
      "Sekwencja 2: ", paste0(seq2, collapse = ""), sep = "")
}

generate_seqs(nucls)
