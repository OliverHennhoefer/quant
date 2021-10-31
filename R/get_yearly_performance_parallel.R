get_yearly_performance_parallel <- function(df) {
  check_sanity(df)

  # cnames <- colnames(df)
  # start_year <- min(as.numeric(gsub(".*?([0-9]+).*", "\\1", cnames)), na.rm = T)
  # if(identical(start_year, Inf)) start_year <- "2000"
  # print(start_year)
  #
  # start_year <- as.Date(paste0(start_year, "-01-01"))
  # print(start_year)

  #end_year <- max(as.numeric(gsub(".*?([0-9]+).*", "\\1", cnames)), na.rm = T)
  #years <- (start_year : end_year)
  # years <- (2015 : 2020)
  # year1 <- sapply(years, function(x) paste0(x, "-01-01"))
  # year2 <- sapply(years, function(x) paste0(x, "-12-31"))
  # y_seq <- as.Date(c(rbind(year1, year2), format = "%Y-%m-%d"))

  cl <- parallel::makeCluster(parallel::detectCores()-4)
  doParallel::registerDoParallel(cl)
  #clusterCall(cl, function() library(plyr))

  res <- foreach::foreach(i = seq_along(df$Symbol),
                          #.packages = c("quantmod", "plyr"),
                          .combine = rbind.fill,
                          .errorhandling = "pass") %dopar% {
                            ticker <- df$Symbol[i]
                            out <- tryCatch(quantmod::getSymbols(ticker,
                                                        from = as.Date("2019-01-01"),
                                                        to = as.Date(Sys.Date()-3),
                                                        auto.assign = FALSE),
                                            error=function(e) e)
                            if(inherits(out, "error")) {
                              return(as.data.frame(cbind(Symbol = NA)))
                            }

                            out1 <- quantmod::yearlyReturn(out)
                            out2 <- as.data.frame(cbind(Symbol = ticker, t(out1)))

                          }

  rownames(res) <- NULL
  #colnames(res)[2:ncol(res)] <- sapply(colnames(res)[2:ncol(res)], function(x) paste0("Return_", substr(x, 1, 4)))
  res <- merge(x = df, y = res)
  return(res)
}

# dtf <- read.csv2(file = "./dat/main_secs.csv")
# dtf <- read.csv2(file = "./dat/main_secs_price_country_volume_eps_fscore.csv")
# dtf[1:10, ] %>% get_yearly_performance_parallel() -> test
# dtf[1:10, ] %>% get_earnings() -> test
# dtf %>% get_interest_coverage() -> test
# dtf <- read.csv2(file = "./dat/main_secs_price_country_volume_eps_fscore_interest_coverage.csv")
