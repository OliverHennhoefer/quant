get_dayinventory <- function(df) {

  pfx <- 'DaysInventory'
  url <- 'https://www.gurufocus.com/term/DaysInventory/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Days Inventory -------------------------------------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
