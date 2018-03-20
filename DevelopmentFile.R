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
# Manually update DESCRIPTION if need be 
current.code <- as.package("easyRasch")
load_all(current.code)
document(current.code)
check(current.code)


## Begin writing functions (all transferred to R folder)
# Define S4 class Rasch
# initialization function
# Probability function 
# Likelihood function
# Prior function
# EAP function
# print function 


## Sample code to test that methods work 
qDiff<-c(1,2,3,4,5)
qAns<-c(1,1,0,1,0)
testRasch<-new("Rasch", testTakerName="Jim", a=qDiff, y=qAns)
testRasch

probTestRasch<-probability(testRasch,3)
probTestRasch

likeTestRasch<-likelihood(testRasch,3)
likeTestRasch

testPrior<-prior(3)
testPrior

eapTestRasch<-eap(testRasch, lower=-1, upper=3)   # ans=0 if lower = -upper 
eapTestRasch
eapTestRasch2<-eap(testRasch, lower=-3, upper=3)   # ans=0 if lower = -upper 
eapTestRasch2

print(testRasch)


## Intentional mistakes to test validation method 
qDiff1<-c(1,2,3,4,5)
qAns1<-c(1,1,0,1)
testRasch1<-new("Rasch", testTakerName="Jim", a=qDiff1, y=qAns1)

qDiff2<-c(1,2,3,4,NA)
qAns2<-c(1,1,0,1,0)
testRasch2<-new("Rasch", testTakerName="Jim", a=qDiff2, y=qAns2)

qDiff3<-c(1,2,3,4,5)
qAns3<-c(1,1,0,1,NA)
testRasch3<-new("Rasch", testTakerName="Jim", a=qDiff3, y=qAns3)

