#' Get HTML text element
#'
#' @param url String. The Uniform Resource Locator of the resource of interest.
#'
#' @param xpath String. The XML path to an element of interest.
#'
#' @return
#' The string to be found under the given XML path and URL.
#'
#' @examples
#' get_text(url = 'https://www.gurufocus.com/stock/AAPL/summary',
#' xpath = '//*[@id="stock-header"]/div/div[1]/div[1]/div[2]/div/h1/span[1]')
#'
get_text <- function(url, xpath) {

  html_page <- rvest::read_html(url)
  html_node <- rvest::html_nodes(html_page, xpath = xpath)
  html_text <- rvest::html_text(html_node)

  return(html_text)
}
