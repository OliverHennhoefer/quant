test_that("Effective Interest Rate check", {
  df <- data.frame("symbol" = "AAPL")
  eff_interest_rate <- quant::get_eff_interest_rate(df)
  testthat::expect_equal(dim(eff_interest_rate), c(1,7))
})
