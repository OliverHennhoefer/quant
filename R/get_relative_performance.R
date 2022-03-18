get_relative_performance <- function(df,
                                     from = as.Date("2018/01/01"),
                                     to = as.Date("2021/12/31"),
                                     reference = "^GSPC") {

  #quantEnv <- new.env()
  ref <- quantmod::getSymbols("^GSPC",
                       from = from,
                       to = to,
                       auto.assign = FALSE)
  ref_perf <- (ref[[length(ref)]]/ref[[1]])-1
  rm(ref)

  quantmod::getSymbols(df$symbol,
                       from = from,
                       to = to)

  res <- lapply(setNames(ls(), ls()), function(i) {
    x <- get(i)
    if(xts::is.xts(x)) {
      ((x[[length(x)]]/x[[1]])-1)-ref_perf
    }
  })

  p <- do.call(rbind, res)

  p <- data.frame("symbol" = rownames(p), "rel_performance" = p)
  rownames(p) <- NULL
  # res <- lapply(setNames(ls(), ls()), function(i) {
  #   x <- get(i)
  #   if(xts::is.xts(x)) {
  #     quantmod::annualReturn(x)
  #   }
  # })

  # res = res[!sapply(res, is.null)]
  #
  # for (i in 2:length(res)) {
  #   df$rel.return[i] <- mean(res[[i]]$yearly.returns)-mean(res[[1]]$yearly.returns)
  # }
  # return(df)
}

#test <- get_relative_performance(df = sp)
