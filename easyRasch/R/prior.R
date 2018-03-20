#' Finding prior
#'
#' Finds the height of the specified normal curve evaluated at thetaJ
#'
#' @param theta A numeric value, the proposed value of ThetaJ
#'
#' @return
#'  \item{output}{the height of the specified normal curve evaluated at thetaJ}
#' @author Gangyi Sun
#' @note This is a very simple function
#' @examples
#' prior(3)
#' @seealso \code{\link{print}}
#' @rdname prior
#' @aliases prior,ANY-method

# creates generic prior
#' @export
setGeneric(name="prior",
           def=function(theta, ...)
           {standardGeneric("prior")}
)

# creates method prior 
#' @export
setMethod(f="prior",
          definition=function(theta, ...){
            
            # use dnorm to calculate the hieght of the normal curve for proposed value of theta, returns that as output of function.  
            output<-dnorm(theta, mean=0, sd=3)
            return(output)
          }
)

