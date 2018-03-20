## Applied Statistical Programing 
## Midterm Exam
## Gangyi Sun (441748)


## Load libraries
library(devtools)
library(roxygen2)
library(testthat)


## Set working directory
setwd("~/Documents/GitHub/Midterm")


## Creates package skeleton
# Only run this the first time to create the skeleton 
# devtools::create("easyRasch")


## Updates the package based on R scripts written, man and NAMESPACE automatically updates. 
current.code <- as.package("easyRasch")
load_all(current.code)
document(current.code)
check(current.code)


## Begin writing functions 
# Define S4 class Rasch
# initialization function
# Probability function 

# Likelihood function
setGeneric(name="likelihood",
           def=function(raschObj, theta, ...)
           {standardGeneric("likelihood")}
)

setMethod(f="likelihood",
          definition=function(raschObj, theta, ...){
            prob<-probability(raschObj, theta)
            PQ<-prob$PQ
            like<-prod(PQ)
            return(like)
          }
)
            

# Prior function
setGeneric(name="prior",
           def=function(theta, ...)
           {standardGeneric("prior")}
)

setMethod(f="prior",
          definition=function(theta, ...){
            output<-dnorm(theta, mean=0, sd=3)
            return(output)
          }
)


# EAP function
setGeneric(name="eap",
           def=function(raschObj, lower=-6, upper=6, ...)
           {standardGeneric("eap")}
)

setMethod(f="eap",
          definition=function(raschObj, lower=-6, upper=6, ...){
            gTheta<-function(theta){
              g<-theta*likelihood(raschObj,theta)*prior(theta)
              return(g)
            }
            numList<-integrate(gTheta,lower=lower,upper=upper)
            num<-numList$value
            
            fTheta<-function(theta){
              f<-likelihood(raschObj,theta)*prior(theta)
              return(f)
            }
            denomList<-integrate(fTheta,lower=lower,upper=upper)
            denom<-denomList$value
            
            ans<-num/denom
            return(ans)
          }
)


# print function 
setMethod("print", "Rasch",
          function(x, ...){
            eapResult<-eap(x)
            name<-x@testTakerName
            output<-list(name,eapResult)
            names(output)<-c("Name","EAP Result")
            return(output)
          }
)


# Sample code to test that methods work 
qDiff<-c(1,2,3,4,5)
qAns<-c(1,1,0,1,0)
testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
probTestRasch<-probability(testRasch,3)
probTestRasch
likeTestRasch<-likelihood(testRasch,3)
likeTestRasch
testPrior<-prior(3)
testPrior
eapTestRasch<-eap(testRasch, lower=-3, upper=3)   # ans=0 if lower = -upper 
eapTestRasch
print(testRasch)

