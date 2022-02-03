get_pe_ratio_nri <- function(df) {

  pfx <- 'penri'
  url <- 'https://www.gurufocus.com/term/penri/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Price to Earnings Ratio without Non-Recurring Items ------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
