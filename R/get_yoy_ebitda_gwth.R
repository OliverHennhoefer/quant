get_yoy_ebitda_gwth <- function(df) {

  pfx <- 'yoy_ebitda_gwth'
  url <- 'https://www.gurufocus.com/term/growth_per_share_ebitda/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Year over Year Earnings before Interest and Appreciation Growth ------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
