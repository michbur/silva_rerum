format_table <- function(x, caption, label, range) {
  bold_max <- function(x) {
    nx <- as.numeric(x)
    x[nx == max(nx)] <- paste0("\\textbf{", x[nx == max(nx)], "}")
    x
  }
  
  tab_bold <- x[range] %>%
    formatC(digits = 4, format = "f") %>% 
    mutate_each(bold_max)
  
  rws <- seq(1, nrow(tab) - 1, by = 2)
  col <- rep("\\rowcolor[gray]{0.85}", length(rws))
  
  tab_full <- cbind(x[-range], tab_bold)
  
  res <- print(xtable(tab_full, caption = caption, label = label), include.rownames = TRUE, booktabs = TRUE,
               add.to.row = list(pos = as.list(rws), command = col), print.results = FALSE, 
               caption.placement = "top", sanitize.text.function = identity, 
               sanitize.rownames.function = identity)
  res
}
