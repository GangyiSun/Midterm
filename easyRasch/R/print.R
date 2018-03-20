#' Print
#'
#' Prints name of test taker the expected a posteriori value for thetaJ using equation (3)
#'
#' @param raschObj An objet of class Rasch
#'
#' @return A list containing:
#'  \item{name}{The name of the test taker}
#'  \item{eapResult}{The EAP results of raschObj}
#' @author Gangyi Sun
#' @note This is a very simple function
#' @examples
#' print(testRasch)
#' @seealso \code{\link{eap}}
#' @rdname print
#' @aliases print,ANY-method

# creates method print 
#' @export
setMethod("print", "Rasch",
          function(x, ...){
            eapResult<-eap(x)
            name<-x@testTakerName
            output<-list(name,eapResult)
            names(output)<-c("Name","EAP Result")
            return(output)
          }
)