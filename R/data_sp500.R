#' Fetch quotes for S&P500 Index
#'
#' Fetches the stock list provided by
#' [wikipedia.org](n.wikipedia.org/wiki/List_of_S%26P_500_companies)
#'
#' @return
#' A `"data.table" "data.frame"` object.
#'
#' @example
#' sp500 <- data_sp500()
#'
#' @export
#'
data_sp500 <- function() {

    url <- 'https://en.wikipedia.org/wiki/List_of_S%26P_500_companies'
  xpath <- '//*[@id="constituents"]'
  names <- c('symbol', 'company', 'sector', 'subsector')

  # Fetch Data -----------------------------------------------------------------
  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_tbl <- rvest::html_table(html_node)
  html_df <- as.data.frame(html_tbl)

  html_df <- html_df[, c(1, 2, 4, 5)]
  colnames(html_df) <- c('symbol', 'company', 'sector', 'subsector')

  return(html_df)
}
