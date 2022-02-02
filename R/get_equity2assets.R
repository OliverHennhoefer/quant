get_equity2assets <- function(df) {

  pfx <- 'equity2asset'
  url <- 'https://www.gurufocus.com/term/equity2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Equity to Total Assets Ratio -----------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
