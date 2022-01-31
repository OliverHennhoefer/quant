#' Apply sanity checks
#'
#' Internal function. Applies a sanity check on given input parameter(s)
#'
#' @param df Data.frame. A data.frame to be checked for sanity.
#'
#' @examples
#' sanity(data.frame("symbol" = "AAPL", "MSFT", "BABA)) #passes
#' sanity(data.frame("stocks" = "AAPL", "MSFT", "BABA)) #flunks
sanity <- function(df) {

  message <- "Column 'symbol' containing valid stock tickers required!"
  if (!('symbol' %in% colnames(df))) stop(message)

  return(NULL)
}
