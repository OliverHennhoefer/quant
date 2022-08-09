test_that("Cash to Debt check", {
  df <- data.frame("symbol" = "AAPL")
  cash_to_debt <- quant::get_cash_to_debt(df)
  testthat::expect_equal(dim(cash_to_debt), c(1,7))
})
