get_epsnri <- function(df) {

  pfx <- 'epsnri'
  url <- 'https://www.gurufocus.com/term/eps_nri/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Earnings per Share ex Non-recurrent Items-----------------------------------
  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
