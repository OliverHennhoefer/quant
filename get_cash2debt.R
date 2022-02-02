get_cash2debt <- function(df) {

  pfx <- 'cash2debt'
  url <- 'https://www.gurufocus.com/term/cash2debt/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Cash to Debt Ratio----------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
