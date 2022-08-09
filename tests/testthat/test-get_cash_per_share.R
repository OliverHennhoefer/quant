test_that("Cash per Share check", {
  df <- data.frame("symbol" = "AAPL")
  cash_per_share <- quant::get_cash_per_share(df)
  testthat::expect_equal(dim(cash_per_share), c(1,7))
})
