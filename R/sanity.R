#' @title
#' Apply sanity checks
#'
#' @description
#' Internal function. Applies a sanity check on given input parameter(s)
#'
#' @param df Data.frame. A data.frame to be checked for sanity.
#'
#' @return A `"data.table" "data.frame"` object.

sanity <- function(df) {

  message <- "Column 'symbol' containing valid stock tickers required!"
  if (!('symbol' %in% colnames(df))) stop(message)

  return(NULL)
}
