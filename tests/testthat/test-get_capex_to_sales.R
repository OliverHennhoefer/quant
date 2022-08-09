test_that("CAPEX to Sales check", {
  df <- data.frame("symbol" = "AAPL")
  capex_to_sales <- quant::get_capex_to_sales(df)
  testthat::expect_equal(dim(capex_to_sales), c(1,7))
})
