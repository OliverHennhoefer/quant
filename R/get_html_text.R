#' wraps the scraping process for single text elements
#'
#' @return dis
#'
#' @example
#' dat
get_html_text <- function(url, xpath = NULL) {

  text <- content <- rvest::read_html(url) %>%
    rvest::html_nodes(xpath = xpath) %>%
    rvest::html_text()

  return(text)
}
