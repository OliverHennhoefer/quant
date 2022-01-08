# Scraping Company Data and other Business Indicators

This project is under development and currently offers very limited functionality 🔌

The project heavily depends on data provided by [gurufocus.com](https://www.gurufocus.com/new_index/) 📊

```r
df <- data.frame("Symbol" = c("AAPL", "MSFT", "BABA"))

df %>%
  get_earnings()

>   Symbol EPS_2017 EPS_2018  EPS_2019  EPS_2020  EPS_2021  EPS_TTM
  1 AAPL   2.30    2.98       2.97      3.28      5.61      5.62
  2 BABA   2.46    3.88       4.97      7.97      8.40      6.97
  3 MSFT   3.25    2.13       5.06      5.76      8.05      8.94
  
df %>%
  get_sectors() %>%
  get_interest_coverage()
  
>   Symbol Sector             Subsector         Interest_Coverage_2017 ... Interest_Coverage_2021  Interest_Coverage_TTM  
  1 AAPL   Technology         Hardware          26.41                  ... 41.19                   35.40
  2 BABA   Consumer Cyclical  Retail - Cyclical 18.16                  ... 20.04                   1.18                                    
  3 MSFT   Technology         Software          13.20                  ... 29.80                   37.55                              
```

This webscraping toolset provides functionalities for easily gathering stock data for the last five fiscal years.
This projects gives access to complete financial data of at least 5000-7000 stocks, depending on the indicator and the corresponding listing itself.

📚 Extensive data for 6.000+ unique listings. <br>
📅 Records from the last five company's fiscal years. <br>
♻️ Convenient merging-abilities to update past scraping results. <br>

_________________________________________________________
Current state and capabilities of the project:
- [x] Complete Stock List (gurufocus.com)
- [x] Index Stock Lists (SP500, NASDAQ100)
- [x] Trading Volume (Monthly)
- [x] Country/Sector/Subsector/MCap
- [x] Earnings per Share (Diluted)
- [x] Revenue
- [x] Price-to-Free-Cashflow
- [x] ROIC & WACC
- [X] Price-Earnings-Ratio
- [x] Piotroski F-Score
- [x] Interest Coverage
- [X] Buyback-Ratio
- [x] Payout-Ratio
- [x] Goodwill to Asset
- [x] Altman z-Score 
- [x] Book Value Per Share
- [x] Cash Per Share
- [x] Dividends Per Share
