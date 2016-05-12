my_print <- function (x, ..., digits = NULL, quote = FALSE, right = TRUE, 
                      row.names = TRUE, head = TRUE) 
{
  n <- length(row.names(x))
  if (length(x) == 0L) {
    cat(sprintf(ngettext(n, "data frame with 0 columns and %d row", 
                         "data frame with 0 columns and %d rows", domain = "R-base"), 
                n), "\n", sep = "")
  }
  else if (n == 0L) {
    print.default(names(x), quote = FALSE)
    cat(gettext("<0 rows> (or 0-length row.names)\n"))
  }
  else {
    m <- as.matrix(format.data.frame(x, digits = digits, 
                                     na.encode = FALSE))
    if (!isTRUE(row.names)) 
      dimnames(m)[[1L]] <- if (identical(row.names, FALSE)) 
        rep.int("", n)
    else row.names
    
    if(head) {
      print(head(m), ..., quote = quote, right = right)
      cat("----\n", nrow(m) - 5, "rows ommited\n")
    } else {
      print(m, ..., quote = quote, right = right)
    }
  }
  invisible(x)
}

unlockBinding("print.data.frame", as.environment("package:base"))
assignInNamespace("print.data.frame", my_print, ns="base", envir=as.environment("package:base"))
assign("print.data.frame", my_print, as.environment("package:base"))
lockBinding("print.data.frame", as.environment("package:base"))
