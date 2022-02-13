get_liadb2assets <- function(df) {

  pfx <- 'liabilities2assets'
  url <- 'https://www.gurufocus.com/term/liabilities_to_assets/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Liabilities to Assets Ratio ------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
