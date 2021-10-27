#' Wraps the sanity check regarding available ticker symbols in column 'Symbol'
check_sanity <- function(input) {
  message <- "Column 'Symbol' containing valid stock tickers required."
  if (!("Symbol" %in% colnames(input))) stop(message)
}
