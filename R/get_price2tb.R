get_price2tb <- function(df) {

  pfx <- 'tangible_book'
  url <- 'https://www.gurufocus.com/term/p2tangible_book/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Price to Tangible Book Ratio -----------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
