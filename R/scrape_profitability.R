#' @title Helper Function for Profitability
#'
#'  @usage scrape_profitability(df, url, xpath_txt)
#'
#' @param df data.frame
#' @param url String
#' @param xpath_txt String
#'
#' @return data.frame
#' @export

scrape_profitability <- function(df, url, xpath_txt) {

  sanity(df)

  df$profitability <- NA
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(0, rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]
    src_url <- paste0(url, ticker, "/")

    profitability <- get_text(src_url, xpath = xpath_txt)

    df$profitability[i] <- regex_ttm(profitability)
  }

  return(df)

}

