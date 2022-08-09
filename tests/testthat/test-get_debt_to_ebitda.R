test_that("Debt to EBITDA check", {
  df <- data.frame("symbol" = "AAPL")
  debt_to_ebitda <- quant::get_debt_to_ebitda(df)
  testthat::expect_equal(dim(debt_to_ebitda), c(1,7))
})
