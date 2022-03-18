#' Text-processing of key figure from gurufocus.com
#'
#' Internal **'quant'**-function for processing the scraped character string
#' of key figures provided by gurufocus.com
#'
#' @usage regex_ttm(string)
#'
#' @param string String. The character string to be processed
#'
#' @return
#' The input data frame supplemented by the company's respective key figures
#' of the last five fiscal years plus current years TTM.
#'
regex_ttm <- function(string) {

  # Remove Paranthesis ---------------------------------------------------------
  rm_par <- gsub("\\([^\\)]+\\)", "\\1", string)

  # Extract number -------------------------------------------------------------
  extr_num <- as.numeric(gsub("[^0-9.-]+", "\\1", rm_par))

  return(extr_num)
}
