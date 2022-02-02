get_capex2rev <- function(df) {

  pfx <- 'capex2rev'
  url <- 'https://www.gurufocus.com/term/capex_to_revenue/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Captial Expenditure to Revenue Ratio ---------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
