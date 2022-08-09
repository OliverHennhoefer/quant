test_that("Cash Ratio check", {
  df <- data.frame("symbol" = "AAPL")
  get_cash_ratio <- quant::get_cash_ratio(df)
  testthat::expect_equal(dim(get_cash_ratio), c(1,7))
})
