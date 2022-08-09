test_that("Days Inventory check", {
  df <- data.frame("symbol" = "AAPL")
  days_inventory <- quant::get_days_inventory(df)
  testthat::expect_equal(dim(days_inventory), c(1,7))
})
