get_insown <- function(df) {

  pfx <- 'insider.own'
  url <- 'https://www.gurufocus.com/term/InsiderOwnership/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  # Insider Ownership ----------------------------------------------------------
  res <- suppressWarnings(
    scrape_ownership_fig(df, url, pfx, xpath_txt, xpath_tbl)
    )

  return(res)
}
