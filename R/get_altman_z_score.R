#' @title
#' Get Altman Z-score
#'
#' @description
#' Wrapper function for fetching data from
#' [gurufocus.com](https://www.gurufocus.com/term/zscore/AAPL/).
#'
#' @usage get_altman_z_score(df)
#'
#' @param df data.frame. Data frame with column 'symbol' containing at least one
#' valid stock ticker symbol.
#'
#' @return
#' The original data.frame supplemented by the company's **Altman Z-score**
#' of the last five fiscal years plus current years TTM.
#'
#' @example
#' df <- data.frame('symbol' = 'AAPL')
#' res <- get_altman_z_score(df)
#'
#' @details
#' The Altman Z-Score quantifies the risk of bankruptcy of a company within the
#' next two years. The Z-Score is a multivariate measure of financial distress
#' and classifies the rated company either into the *Distress Zone* (<=1.8) or
#' into the *Safe Zone* (>=3). Values in between can be seen as *Grey Zone*
#' indicating *Grey Zone* indicating a latent risks of bankruptcy.
#'
#' The original formula for calculating the **Altman Z-score** is a
#' linear combination of five business ratios:
#' \deqn{Z = 1.2X_{1} + 1.4X_{2} + 3.3X_{3} + 0.6X_{4} + 1.0X_{5}}
#'
#' \itemize{
#'   \item \eqn{X_{1}}: Ratio of working capital to total assets. Measures
#'   liquid assets in relation to the size of the company and determines the
#'   short-term company's solvency.
#'
#'   \item \eqn{X_{2}}: Ratio of retained earnings to total assets. Determines
#'   whether the company was successful in generating profits and retaining
#'   profits for future reinvestments in the business.
#'
#'   \item \eqn{X_{3}}: Ratio of earnings before interest and taxes to total
#'   assets. Determines how effective a company is at using its own assets for
#'   generating profits.
#'
#'   \item \eqn{X_{4}}: Ratio of market value of equity to book value of total
#'   liabilities. Gives an impression to what extent the company's own assets
#'   can decline in value before the liabilities exceed these assets and the
#'   company becomes insolvent.
#'
#'   \item \eqn{X_{5}}: Ratio of Sales to total assets. Common measure for
#'   determining the total asset turnover ratio that measures how effective a
#'   company is at generating revenue from its own assets.
#' }
#'
#' The formula was parameterized by multivariate linear discriminant analysis
#' applied on a data set of 33 solvent and 33 insolvent companies
#' (see *references*).
#'
#' @references
#' Altman, Edward I. (1968): Financial Ratios, Discriminant Analysis and the
#' Prediction of Corporate Bankruptcy in The Journal of Finance, Volume 23,
#' Issue 4, p. 589-610
#' @references
#' Altman, Edward I., Sanders, A. (1998): Credit Risk Measurement: Developments
#' over the last 20 Years in Journal of Banking and Finance, Volume 21,
#' p. 1721-1742
#' @references
#' Altman, Edward I. (2000): Predicting Financial Distress of Companies:
#' Revisiting the Z-Score and Zeta Models, Working Paper, New York University
#' @references
#' Altman, Edward I. (2002): Revisiting Credit Scoring Models in a Basel 2
#' Environment, Working Paper, Stern School of Business, New York University
#' @references
#' Altman, Edward I., Iwanicz-Drozdowska, Malgorzata, Laitinen, Erkki K.,
#' Suvas, Arto (2014): Distressed Firm and Bankruptcy Prediction in an
#' international Context: A Review and empirical Analysis of Altman's Z-Score
#' Model, Working Paper, Stern School of Business, New York University
#'
get_altman_z_score <- function(df) {

  pfx <- 'zscore'
  url <- 'https://www.gurufocus.com/term/zscore/'
  xpath_tbl <- '//*[@id="target_def_historical_data"]/div[2]/div/table'
  xpath_txt <- '//*[@id="def_body_detail_height"]/font[1]'

  res <- suppressWarnings(scrape_key_fig(df, url, pfx, xpath_txt, xpath_tbl))

  return(res)
}
