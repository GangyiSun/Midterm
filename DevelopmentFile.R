## Applied Statistical Programing 
## Midterm Exam
## Gangyi Sun (441748)


## Load libraries
library(devtools)
library(roxygen2)
library(testthat)


## Set working directory
setwd("~/Documents/GitHub/Midterm")


## Begin writing functions 
# Define S4 class Rasch
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


# initialization function
setMethod("initialize", "Rasch",
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
)


# Probability function 
setGeneric(name="probability",
           def=function(raschObj, theta, ...)
           {standardGeneric("probability")}
)

setMethod(f="probability",
          definition=function(raschObj, theta, ...){
            a<-raschObj@a
            y<-raschObj@y
            n<-length(a)
            
            Pij<-c()
            for (i in 1:n){
              x<-exp(theta-a[i])
              p<-x/(1+x)
              Pij<-c(Pij,p)
            }
            
            PQ<-c()
            for (i in 1:n){
              if (y[i]==1){
                PQij<-Pij[i]
                PQ<-c(PQ,PQij)
              }
              if (y[i]==0){
                PQij<-1-Pij[i]
                PQ<-c(PQ,PQij)
              }
            }
            
            output<-list(Pij,PQ)
            names(output)<-c("Pij","PQ")
            return(output)
          }
)


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
            

# Sample code to test that methods work 
qDiff<-c(1,2,3,4,5)
qAns<-c(1,1,0,1,0)
testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
probTestRasch<-probability(testRasch,3)
probTestRasch
likeTestRasch<-likelihood(testRasch,3)
likeTestRasch


