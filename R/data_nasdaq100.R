data_nasdaq100 <- function(raw = FALSE) {

  url <- "https://en.wikipedia.org/wiki/Nasdaq-100"
  xpath <- '//*[@id="constituents"]'

  table <- rvest::read_html(url) %>%
    rvest::html_nodes(xpath = xpath) %>%
    rvest::html_table() %>%
    as.data.frame()

  colnames(table) <- c("Company", "Symbol", "Sector", "Subsector")

  if (raw) return(table)
  return(table[, 2, drop = FALSE])
}
