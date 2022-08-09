test_that("Days to Sales Outstanding check", {
  df <- data.frame("symbol" = "AAPL")
  days_sales_outstanding <- quant::get_days_sales_outstanding(df)
  testthat::expect_equal(dim(days_sales_outstanding), c(1,7))
})
