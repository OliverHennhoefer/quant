get_finstren <- function(df) {

  pfx <- 'fin_strength'
  url <- 'https://www.gurufocus.com/term/rank_balancesheet/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Financial Strength----------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
