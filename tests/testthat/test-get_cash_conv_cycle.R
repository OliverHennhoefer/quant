test_that("Cash Conversion Cycle check", {
  df <- data.frame("symbol" = "AAPL")
  cash_conv_cycle <- quant::get_cash_conv_cycle(df)
  testthat::expect_equal(dim(cash_conv_cycle), c(1,7))
})
