# Fetching Stock Data for Fundamental Analysis

The project relies on data provided by [gurufocus.com](https://www.gurufocus.com/new_index/) and [tipranks.com](https://www.tipranks.com/)<br>

This webscraping toolset provides functionalities for easily gathering stock data for up to the last five fiscal years. <br>

📚 Extensive data for 6.000+ unique listings. <br>
📅 Data for the company's last five fiscal years and current years TTM value. <br>
♻️ Convenient merging-abilities for updating past scraping results. <br>

## Installation
```r
# Github Download 'quant'-package (dev version)
devtools::install_github('OliverHennhoefer/quant')
```

## Application
```r
df <- data.frame("symbol" = c("AAPL", "MSFT", "BABA"))

# Diluted Earnings per Share
df %>%
  get_diluted_eps() 
  
>   Symbol EPS_2017 EPS_2018  EPS_2019  EPS_2020  EPS_2021  EPS_TTM
  1 AAPL   2.30    2.98       2.97      3.28      5.61      6.04
  2 BABA   2.46    3.88       4.97      7.97      8.40      3.74
  3 MSFT   3.25    2.13       5.06      5.76      8.05      9.39
```

Easily fetch several data for the most common financial measures or even more uncustomary ratios:
```r
df <- data.frame("symbol" = c("AAPL", "MSFT", "BABA"))

# GICS Sectors, Profitability Rank, Probability of Financial Distress 
df %>%
  get_sectors() %>%
  get_profitability %>%
  get_financial_distress
  
>   Symbol Sector             Subsector         Fin.Distress  Profitability  
  1 AAPL   Technology         Hardware          0.02          10
  2 BABA   Consumer Cyclical  Retail - Cyclical 0.29          9                                 
  3 MSFT   Technology         Software          0.03          10
```
