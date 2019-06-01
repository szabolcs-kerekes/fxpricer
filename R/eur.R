#' Value in € format
#' @param amount amount to transform to €
#' @export
#' @return string
#' @examples
#' eur(10000)
#' eur(1234.5678)
#' @seealso uneur()

eur <- function(amount){
  input <- round(amount, 2)
  if(length(input) > 1){
    output <- c()
    for (i in input){
    #  is_positive <- i >= 0
      eur <- format(i, big.mark=",", scientific=FALSE)
        if(!is.na(i) & i < 0){
          eur <- paste0('-€', substring(as.character(eur),2))
        } else {
          eur <- paste0('€', as.character(eur))
        }
      output <- c(output, eur)
    }

  } else {
   # is_positive <- input >= 0
    eur <- format(input, big.mark=",", scientific=FALSE)
    if(!is.na(input) & input < 0){
      output <- paste0('-€', substring(as.character(eur),2))
    } else {
      output <- paste0('€', as.character(eur))
    }
  }

  return(output)
}
