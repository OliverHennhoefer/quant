#' Fetch quotes for NASDAQ-100 Index
#'
#' Fetches the stock list provided by
#' [wikipedia.org](https://de.wikipedia.org/wiki/NASDAQ-100)
#'
#' @return data.table(). Returns a data.frame containing stock ticker symbols.
#'
#' @example
#' nasdaq100 <- data_nasdaq100()
#'
data_nasdaq100 <- function() {

  url <- 'https://en.wikipedia.org/wiki/Nasdaq-100'
  xpath <- '//*[@id="constituents"]'
  names <- c('company', 'symbol', 'sector', 'subsector')

  # Fetch Data -----------------------------------------------------------------
  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_tbl <- rvest::html_table(html_node)
  html_dt <- data.table::as.data.table(html_tbl)

  data.table::setnames(html_dt, names)

  return(html_dt)
}
