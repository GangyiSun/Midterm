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

# Sample code to test that methods work 
qDiff<-c(1,2,3,4,5)
qAns<-c(1,1,0,1,0)
testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)



