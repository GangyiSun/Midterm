#' Finding EAP
#'
#' Finds the expected a posteriori value for thetaJ using equation (3)
#'
#' @param raschObj An objet of class Rasch
#' @param lower A numeric value, the lower limits of integration (defaulted to -6)
#' @param upper A numeric value, the upper limits of integration (defaulted to 6)
#'
#' @return
#'  \item{ans}{The expected a posteriori value for thetaJ calculated using equation (3)}
#' @author Gangyi Sun
#' @note This is a very simple function
#' @examples
#' qDiff<-c(1,2,3,4,5)
#' qAns<-c(1,1,0,1,0)
#' testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
#' eap(testRasch,-5,5)
#' @seealso \code{\link{print}}
#' @rdname eap
#' @aliases eap,ANY-method

# creates generic eap
#' @export
setGeneric(name="eap",
           def=function(raschObj, lower=-6, upper=6, ...)
           {standardGeneric("eap")}
)

# creates method eap 
#' @export
setMethod(f="eap",
          definition=function(raschObj, lower=-6, upper=6, ...){
            
            # expresses the numerator of equation (3) as a function gTheta 
            gTheta<-function(theta){
              g<-theta*likelihood(raschObj,theta)*prior(theta)
              return(g)
            }
            
            # integrate the numerator (gTheta), obtain the numerical value of the definite integral. 
            numList<-integrate(gTheta,lower=lower,upper=upper)
            num<-numList$value
            
            # expresses the denominator of equation (3) as a function fTheta 
            fTheta<-function(theta){
              f<-likelihood(raschObj,theta)*prior(theta)
              return(f)
            }
            
            # integrate the denominator (fTheta), obtain the numerical value of the definite integral. 
            denomList<-integrate(fTheta,lower=lower,upper=upper)
            denom<-denomList$value
            
            # the result we want to obtain is equal to num/denom, return that result as the output of this function. 
            ans<-num/denom
            return(ans)
          }
)

