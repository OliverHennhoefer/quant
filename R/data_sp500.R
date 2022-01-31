data_sp500 <- function(raw = FALSE) {

  url <- "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
  xpath <- '//*[@id="constituents"]'

  table <- rvest::read_html(url) %>%
    rvest::html_nodes(xpath = xpath) %>%
    rvest::html_table() %>%
    as.data.frame()

  table <- table[, c(1, 2, 4, 5)]

  colnames(table) <- c("Symbol", "Company", "Sector", "Subsector")

  if (raw) return(table)
  return(table[, 1 , drop = FALSE])
}
