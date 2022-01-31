get_fptso <- function(df) {

  pfx <- 'fptso'
  url <- 'https://www.gurufocus.com/term/FloatPercentageOfTSO/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Float Percentage of Total Shares Outstanding -------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
