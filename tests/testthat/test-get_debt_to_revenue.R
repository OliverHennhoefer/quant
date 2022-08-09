test_that("Debt to Revenue check", {
  df <- data.frame("symbol" = "AAPL")
  debt_to_revenue <- quant::get_debt_to_revenue(df)
  testthat::expect_equal(dim(debt_to_revenue), c(1,7))
})
