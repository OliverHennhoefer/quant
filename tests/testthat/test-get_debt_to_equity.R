test_that("Debt to Equity check", {
  df <- data.frame("symbol" = "AAPL")
  debt_to_equity <- quant::get_debt_to_equity(df)
  testthat::expect_equal(dim(debt_to_equity), c(1,7))
})
