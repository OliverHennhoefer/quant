get_debt2asset <- function(df) {

  pfx <- 'debt2asset'
  url <- 'https://www.gurufocus.com/term/debt2asset/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Debt to Asset Ratio --------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
