# Scraping Company Data and other Business Indicators

This project is under development and currently offers very limited functionality 🔌

The project heavily depends on data provided by [gurufocus.com](https://www.gurufocus.com/new_index/) 📊

```r
df <- data.frame("Symbol" = c("AAPL", "MSFT", "BABA"))

df %>%
  get_earnings()

>   Symbol EPS_2016 EPS_2017 EPS_2018  EPS_2019  EPS_2020  EPS_2021  EPS_TTM
  1 AAPL   2.08     2.30    2.98       2.97      3.28      NA        5.11
  2 BABA   NA       2.46    3.88       4.97      7.97      8.40      8.20
  3 MSFT   NA       3.25    2.13       5.06      5.76      8.05      8.05
  
df %>%
  get_sector %>%
  get_interest_coverage
  
>   Symbol Sector             Subsector         Interest_Coverage_2016  Interest_Coverage_2017 ... Interest_Coverage_2021  Interest_Coverage_TTM  
  1 AAPL   Technology         Hardware          41.23                   26.41                  ... NA                      36.28
  2 BABA   Consumer Cyclical  Retail - Cyclical NA                      18.16                  ... 20.04                   24.35                                    
  3 MSFT   Technology         Software          NA                      13.20                  ... 29.80                   37.55                              
```

This webscraping toolset provides functionalities for easily gathering stock data for the last five fiscal years.
This projects gives access to complete financial data of at least 5000-7000 stocks, depending on the indicator and the corresponding listing itself.

📚 Extensive data for 6.000+ unique listings. <br>
📅 Records from the last five company's fiscal years. <br>
♻️ Convenient merging-abilities to update past scraping results. <br>

_________________________________________________________
Current state and capabilities of the presented project:
- [x] Complete Stock List
- [x] Trading Volume (Month)
- [x] Sector and Subsector
- [x] Earnings per Share (Diluted)
- [x] Piotroski F-Score
- [x] Interest Coverage
