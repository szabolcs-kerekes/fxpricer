# 1) Create an R package with an open-source license and push to a public GitHub repo
rm()
# 2) Add a function called eurusd that looks up the most recent USD/EUR exchange rate
#    via an API call and returns the rate as a number
rm()
# 3) Add another function called eurusds that takes two arguments (date_from and date_to)
#    and returns a data.table object on the daily rates from date_from to the date_to dates
#    provided with 2 columns (date and exchange rate)
rm()
# 4) Add convert_usd_to_eur function that looks up the most recent USD/EUR exchange rate
#    and compute the provided USD amount in EUR (as a number)
rm()
# 5) Add eur function to the package, similar to scales::dollar, that formats a number to
#    a string using the Euro sign, rounding up to 2 digits and using the comma as the big.mark (every 3 decimals)
rm()
# 6) Write a function that reverses eur, eg call it uneur, so it takes a string (eg "-€0.10")
#    and transforms to a number (eg -0.10 in this case). Make sure it works with the "big mark" as well (eg for "$100,000")
rm()
# 7) Add a vignette to the package that demos the use of eur and eurusds by fetching
#    the daily volume of Bitcoins sold for "USDT" on Binance and reports the overall value of this asset
#    in EUR on a ggplot for the past 45 days
rm()
# 8) Use pkgdown to generate a website for your package and host it on GitHub using the gh-pages branch
