#' A Rasch object
#'
#' Object of class \code{Rasch} is created by the Rasch class' initialization function
#'
#' An object of the class `Rasch' has the following slots:
#' \itemize{
#' \item \code{testTakerName} a character of the test taker's name
#' \item \code{a} a vector of question-item difficulty parameters 
#' \item \code{y} a vector of answers for the respondent
#' }
#'
#' @author Gangyi Sun: \email{gangyi.sun@@wustl.edu}
#' @aliases Rasch-class initialize,Rasch-method

# Creates class Rasch
#' @rdname Rasch
#' @export
setClass(Class="Rasch",
         representation = representation(
           testTakerName = "character",
           a = "numeric",
           y = "numeric"
         ),
         prototype = prototype(
           testTakerName = c(),
           a = c(),
           y = c()
         )
)

# Initialization method for class Rasch
#' @export
setMethod("initialize", "Rasch",
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
)

