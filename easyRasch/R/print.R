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
#' qDiff<-c(1,2,3,4,5)
#' qAns<-c(1,1,0,1,0)
#' testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
#' print(testRasch)
#' @seealso \code{\link{eap}}
#' @rdname print
#' @aliases print,ANY-method

# creates method print 
#' @export
setMethod("print", "Rasch",
          function(x, ...){
            
            eapResult<-eap(x)               # calculates EAP using default upper and lower values 
            name<-x@testTakerName           # obtains name of test taker
            
            # returns name and eapResult as the output of this function.
            output<-list(name,eapResult)    
            names(output)<-c("Name","EAP Result")
            return(output)
          }
)