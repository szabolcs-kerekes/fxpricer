#' The price of x USD in EUR
#' @param x number of USD
#' @param decimals number of decimals for the exchange rate
#' @export
#' @return integer
#' @examples
#' convert_usd_to_eur(10)
#' convert_usd_to_eur(100, 2)

convert_usd_to_eur <- function(usd, decimals = 4){
  fx_rate <- eurusd(decimals)
  fx_rate * usd
}
