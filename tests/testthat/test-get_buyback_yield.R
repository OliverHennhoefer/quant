test_that("Buyback Yield check", {
  df <- data.frame("symbol" = "AAPL")
  buyback_yield <- quant::get_buyback_yield(df)
  testthat::expect_equal(dim(buyback_yield), c(1,7))
})
