get_fror_yacktman <- function(df) {

  pfx <- 'RateOfReturn'
  url <- 'https://www.gurufocus.com/term/RateOfReturn/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Forwards Rate of Return (Yacktman) -----------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
