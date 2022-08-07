#' @title
#' Fetch components of the S&P 500
#'
#' @description
#' Fetches the list of components provided by
#' [wikipedia.org](n.wikipedia.org/wiki/List_of_S%26P_500_companies)
#'
#' @return data.table data.frame
#' @export

data_sp500 <- function() {

  url <- 'https://en.wikipedia.org/wiki/List_of_S%26P_500_companies'
  xpath <- '//*[@id="constituents"]'

  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_tbl <- rvest::html_table(html_node)
  html_dt <- data.table::as.data.table(html_tbl)

  html_dt <- html_dt[, c(1, 2, 4, 5)]
  names <- c('symbol', 'company', 'sector', 'subsector')
  data.table::setnames(html_dt, names)

  return(html_dt)
}
