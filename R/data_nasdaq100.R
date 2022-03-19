#' Fetch quotes for NASDAQ-100 Index
#'
#' Fetches the stock list provided by
#' [wikipedia.org](https://de.wikipedia.org/wiki/NASDAQ-100)
#'
#' @return A `"data.table" "data.frame"` object.
#'
#' @exampl
#' nasdaq100 <- data_nasdaq100()
#'
data_nasdaq100 <- function() {

  url <- 'https://en.wikipedia.org/wiki/Nasdaq-100'
  xpath <- '//*[@id="constituents"]'
  names <- c('symbol', 'company', 'sector', 'subsector')

  # Fetch Data -----------------------------------------------------------------
  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_tbl <- rvest::html_table(html_node)
  html_dt <- data.table::as.data.table(html_tbl)

  html_dt <- html_dt[, c(2, 1, 3, 4)]

  data.table::setnames(html_dt, names)

  return(html_dt)
}
