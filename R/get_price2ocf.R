get_price2ocf <- function(df) {

  pfx <- 'pocf'
  url <- 'https://www.gurufocus.com/term/pocf/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Price to Operating Cash Flow -----------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
