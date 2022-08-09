test_that("Dividend per Share check", {
  df <- data.frame("symbol" = "AAPL")
  dividend_per_share <- quant::get_dividend_per_share(df)
  testthat::expect_equal(dim(dividend_per_share), c(1,7))
})
