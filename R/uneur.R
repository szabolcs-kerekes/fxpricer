#' Value stripped of € currency sign
#' @param eur € value
#' @export
#' @return integer
#' @examples
#' uneur(eur(10000))
#' uneur('€123,456.789')
#' uneur('-€123,456.789')
#' @seealso eur()

uneur <- function(eur){
  if(substring(eur, 0, 1) == '-'){
    -as.numeric(gsub(',','',substring(eur, 3)))
  } else {
    as.numeric(gsub(',','',substring(eur, 2)))
  }

}
