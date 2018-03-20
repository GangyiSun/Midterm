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
#' qDiff<-c(1,2,3,4,5)
#' qAns<-c(1,1,0,1,0)
#' testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
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
            
            # use probability function to obtain vector PQ 
            prob<-probability(raschObj, theta)
            PQ<-prob$PQ
            
            # calculates product of all elements of vector PQ, returns the product as the output of the function. 
            like<-prod(PQ)
            return(like)
          }
)

