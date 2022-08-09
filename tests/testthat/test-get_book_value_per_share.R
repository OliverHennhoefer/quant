test_that("Book Value per Share check", {
  df <- data.frame("symbol" = "AAPL")
  book_value_per_share <- quant::get_book_value_per_share(df)
  testthat::expect_equal(dim(book_value_per_share), c(1,7))
})
