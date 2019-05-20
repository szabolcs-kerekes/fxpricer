#' Historical prices of 1 USD in EUR
#' @param date_from starting date of the period, back-filled for missing dates
#' @param date_to ending date of the period, back-filled for missing dates
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom data.table data.table
#' @importFrom data.table setkey
#' @importFrom lubridate ymd
#' @importFrom logger log_info
#' @examples
#' eurusds('2018-01-01', '2018-01-10')
#' eurusds('2018-01-01', '2018-01-10', 2)

eurusds <- function(date_from, date_to, decimals = 4){
  date_from <- ymd(date_from)
  date_to <- ymd(date_to)
  dates_good <- date_from < date_to

  if(dates_good == FALSE){
    log_info('From date was higher than to data ... exiting function')
    stop()
  }

  if(date_to > Sys.Date()){
    log_info('To date was higher than the date today ... resetting to today')
    date_to <- Sys.Date()
  }

  response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = date_from - 30,
      end_at   = date_to,
      base     = 'USD',
      symbols  = 'EUR'
    ))
  exchange_rates <- content(response)
  exchange_rates <- exchange_rates$rates

  output <- data.table(
    date = as.Date(names(exchange_rates)),
    eurusd = round(as.numeric(unlist(exchange_rates)), decimals))

  dates <- data.table(date = as.Date(seq(date_from - 30, date_to, 'day')))
  output <- output[order(date)]

  setkey(dates, date)
  setkey(output, date)
  output <- output[dates, roll = TRUE]

  output <- output[date >= date_from & date <= date_to]

  return(output)

}
