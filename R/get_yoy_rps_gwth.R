get_yoy_rps_gwth <- function(df) {

  pfx <- 'yoy_rps_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_rev/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Year over Year Revenue Per Share Growth ------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
