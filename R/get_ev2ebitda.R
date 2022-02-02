get_ev2ebitda <- function(df) {

  pfx <- 'ev2ebitda'
  url <- 'https://www.gurufocus.com/term/ev2ebitda/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Enterprise Value to Earnings before Interest and Depreciation --------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
