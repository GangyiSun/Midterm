#' Finding likelihood
#'
#' Finds the likelihood of a proposed value of thetaJ
#'
#' @param raschObj An objet of class Rasch
#' @param theta A numeric value, the proposed value of ThetaJ
#'
#' @return
#'  \item{like}{the calculated likelihood from equation(2)}
#' @author Gangyi Sun
#' @note This is a very simple function
#' @examples
#' likelihood(testRasch,3)
#' @seealso \code{\link{print}}
#' @rdname likelihood
#' @aliases likelihood,ANY-method

# creates generic likelihood
#' @export
setGeneric(name="likelihood",
           def=function(raschObj, theta, ...)
           {standardGeneric("likelihood")}
)

# creates method likelihood 
#' @export
setMethod(f="likelihood",
          definition=function(raschObj, theta, ...){
            prob<-probability(raschObj, theta)
            PQ<-prob$PQ
            like<-prod(PQ)
            return(like)
          }
)

