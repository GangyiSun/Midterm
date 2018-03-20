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

# Validation methods
setValidity("Rasch", function(object){
  # throws an error if size of vector a and vector y are not the same
  test1<-(length(object@a)==length(object@y))
  if(test1!=TRUE){return("Size of vector a and vector y are not the same.")}
  
  # throws an error if vector a contains missing values
  test2<-any(is.na(object@a))
  if(test2==TRUE){return("Vector a contains missing values, which is not allowed.")}
  
  # throws an error if vector y contains missing values
  test3<-any(is.na(object@y))
  if(test3==TRUE){return("Vector y contains missing values, which is not allowed.")}
}
)