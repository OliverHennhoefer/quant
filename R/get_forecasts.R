get_forecasts <- function(df) {

  url <- 'https://www.tipranks.com/stocks/'

  cdf <- data.frame()
  rows <- nrow(df)
  pbar <- utils::txtProgressBar(min = 0, max = rows, style = 3)

  for(i in 1:rows) {
    utils::setTxtProgressBar(pbar, i)

    ticker <- df$symbol[i]
    print(ticker)
    src_url <- paste0(url, ticker, "/forecast")

    # Try to fetch page data in case a ticker symbol cant be resolved
    # (example: OTCPK:BAYRY)
    html_page <- tryCatch({
      rvest::read_html(src_url)
      }, error = function(e) {
        print(paste0("No data for ", ticker))
        data.frame("symbol" = ticker, "rating" = NA, "upside" = NA,
                   "buy" = NA, "hold" = NA, "sell" = NA, "totals" = NA)
      }
    )

    if (is.data.frame(html_page)){
      cdf <- plyr::rbind.fill(cdf, html_page)
      next
    }

    buy_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[1]/div[2]/
    div[3]/div/div/div/div/div[2]/div[1]/span'
    html_node <- rvest::html_nodes(html_page, xpath = buy_xpath)
    html_text <- rvest::html_text(html_node)
    buy <- as.numeric(html_text)

    # When page is available a missing buy rating will be used as a proxy for
    # generally missing page information. (example: RTTO)
    if (length(buy) == 0) {
      table <- data.frame("symbol" = ticker, "rating" = NA, "upside" = NA,
                 "buy" = NA, "hold" = NA, "sell" = NA, "totals" = NA)
      cdf <- plyr::rbind.fill(cdf, table)
      next
    }

    hold_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[1]/div[2]/
    div[3]/div/div/div/div/div[2]/div[2]/span'
    html_node <- rvest::html_nodes(html_page, xpath = hold_xpath)
    html_text <- rvest::html_text(html_node)
    hold <- as.numeric(html_text)
    if (length(hold) == 0) hold <- NA

    sell_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[1]/div[2]/
    div[3]/div/div/div/div/div[2]/div[3]/span'
    html_node <- rvest::html_nodes(html_page, xpath = sell_xpath)
    html_text <- rvest::html_text(html_node)
    sell <- as.numeric(html_text)
    if (length(sell) == 0) sell <- NA

    rtg_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[1]/div[2]/
    div[3]/div/div/div/div/div[1]/svg/g/text[1]'
    html_node <- rvest::html_nodes(html_page, xpath = rtg_xpath)
    html_text <- rvest::html_text(html_node)
    rtg <- as.numeric(html_text)
    if (length(rtg) == 0) rtg <- NA

    str_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[1]/div[2]/
    div[3]/div/div/span'
    html_node <- rvest::html_nodes(html_page, xpath = str_xpath)
    str <- rvest::html_text(html_node)
    if (length(str) == 0) str <- NA

    ups_xpath <- '//*[@id="tr-stock-page-content"]/div[1]/div[4]/div[2]/div[2]/
    div[3]/div/div/div[1]/div[1]/div'
    html_node <- rvest::html_nodes(html_page, xpath = ups_xpath)
    html_text <- rvest::html_text(html_node)
    upside <- as.numeric(gsub("[^0-9.-]+", "\\1", html_text))
    if (length(upside) == 0) upside <- NA


    table <- data.frame("symbol" = ticker,
                        "rating" = str,
                        "upside" = upside,
                        "buy" = buy,
                        "hold" = hold,
                        "sell" = sell,
                        "totals" = rtg)

    cdf <- plyr::rbind.fill(cdf, table)
    Sys.sleep(0.5) #To reach approx. 1 request/sec
  }

  res <- merge(df, cdf, by = "symbol", suffixes = rep("", 2))
  return(res)

}


