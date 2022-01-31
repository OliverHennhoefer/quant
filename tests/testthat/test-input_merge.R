test_that("Checking input_merge merging functionality", {
  df1 <- data.frame("symbol" = "STOCK", "eps_2016" = 99)
  df2 <- data.frame("symbol" = "STOCK", "eps_2016" = 99, "eps_2017" = 199)
  expect_equal(
    dim(input_merge(new_data = df1, input = df2, kpi = "eps")),
    expected = c(1, 2))
})
