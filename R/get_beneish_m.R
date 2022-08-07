#' @title Get Beneish M-Score
#'
#' @description Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/mscore/AAPL/).
#'
#' The Beneish M-Score quantifies the likelihood of reported earnings
#' manipulation. The M-Score is a probabilistic model that classifies the rated
#' company either into the category "Unlikely Manipulator" (M-Score>=-1.78) or
#' "Likely Manipulator" (M-Score>-1.78). The M-Score must not be applied among
#' financial firms like banks and insurance companies due to their very specific
#' business characteristics.
#'
#' @usage get_beneish_m(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return Input data.frame supplemented by the company's available
#' **Beneish M-Score** data.
#' @export
#'
#' @examples
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_beneish_m(df)
#'
#' @details The original formula for calculating the **Beneish M-Score**
#' consists of eight financial ratios:
#' \deqn{M = -4.84+0.92xDSRI+0.528xGMI+0.404xAQI+0.892xSGI+0.115xDEPI-0.172xSGAI
#' +4.679xTATA-0.327xLVGI}
#'
#' \itemize{
#'   \item DSRI: Days Sales in Receivables Index as earnings quality metric
#'   indicates whether earnings quality is rising or falling.
#'
#'   \item GMI: Gross Margin Index as a fundamental momentum metric indicates
#'    whether a company's profitability and pricing power is rising or falling.
#'
#'   \item AQI: Asset Quality Index can be used to determine whether a company
#'   is excessively capitalizing expenses.
#'
#'   \item SGI: Sales Growth Index indicates whether a company's sales are
#'   rising or falling.
#'
#'   \item DEPI: Depreciation Index indicates whether a company is depreciating
#'   assets at faster or slower rates.
#'
#'   \item SGAI: Sales, General and Administrative (SGA) Expenses Index
#'   indicates whether a company's SGA Expenses are rising or falling.
#'
#'   \item LVGI: Leverage Index indicates whether a company's leverage is rising
#'   or falling.
#'
#'   \item TATA: Total Accruals to Total Assets indicates whether a change in
#'   accounting practices may resulted in
#' }
#'
#' The formula was parameterized by multivariate linear discriminant analysis
#' applied on a data set of 33 solvent and 33 insolvent companies
#' (see *references*).
#'
#' @references
#' Beneish, Messod D. (1999): The Detection of Earnings Manipulation
#' in Financial Analysts Journal, Volume 55, Issue 5, p. 24-36

get_beneish_m <- function(df) {

  pfx <- 'mscore'
  url <- 'https://www.gurufocus.com/term/mscore/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
