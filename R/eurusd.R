#' The price of 1 USD in EUR
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @examples
#' eurusd()
#' eurusd(2)

eurusd <- function(decimals = 4){
  response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
  exchange_rates <- content(response)
  round(exchange_rates$rates$EUR, decimals)
}
