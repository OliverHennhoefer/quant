get_oeps <- function(df) {

  pfx <- 'owners.eps'
  url <- 'https://www.gurufocus.com/term/Owner_Earnings/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Owners Earnings per Share---------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
