#' Finding probability
#'
#' Finds the probability of getting a question right 
#'
#' @param raschObj An objet of class Rasch
#' @param theta A numeric value, the proposed value of ThetaJ
#'
#' @return A list containing:
#'  \item{Pij}{a vector containing values of Pij for each question}
#'  \item{PQ}{a vector containing Pij if person j answer question i correctly, and Qij if she answered the question wrongly}
#' @author Gangyi Sun
#' @note This is a very simple function
#' @examples
#' qDiff<-c(1,2,3,4,5)
#' qAns<-c(1,1,0,1,0)
#' testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
#' probability(testRasch,3)
#' @seealso \code{\link{print}}
#' @rdname probability
#' @aliases probability,ANY-method

# creates generic probability
#' @export
setGeneric(name="probability",
           def=function(raschObj, theta, ...)
           {standardGeneric("probability")}
)

# creates method probability 
#' @export
setMethod(f="probability",
          definition=function(raschObj, theta, ...){
            a<-raschObj@a
            y<-raschObj@y
            n<-length(a)
            
            # function to calculate a singular value of Pij given a value of theta and a single value of a. 
            probCalc<-function(aSingle){
              x<-exp(theta-aSingle)
              p<-x/(1+x)
              return(p)
            }
            # use sapply to calculate all values of Pij given a vector of question-item parameters a. 
            Pij<-sapply(a,probCalc)
            
            # creates vector PQ 
            PQ<-c()
            for (i in 1:n){
              if (y[i]==1){         # PQij=Pij if yij=1
                PQij<-Pij[i]
                PQ<-c(PQ,PQij)
              }
              if (y[i]==0){         # PQij=1-Pij if yij=0
                PQij<-1-Pij[i]
                PQ<-c(PQ,PQij)
              }
            }
            
            # Returns Pij and PQ as the outputs of this function 
            output<-list(Pij,PQ)
            names(output)<-c("Pij","PQ")
            return(output)
          }
)

