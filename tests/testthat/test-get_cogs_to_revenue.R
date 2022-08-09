test_that("COGS to Revenue check", {
  df <- data.frame("symbol" = "AAPL")
  cogs_to_revenue <- quant::get_cogs_to_revenue(df)
  testthat::expect_equal(dim(cogs_to_revenue), c(1,7))
})
