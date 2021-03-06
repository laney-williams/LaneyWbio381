1.
counter <- 0
z <- rpois(10, 1)
print(z)
for(i in seq_along(z)) {
  if(z[i] == 0) {
    counter <- counter + 1
  }}
print(counter)

2. ## Use the which function to figure out which numbers are zero and then how many.
length(which(z==0))

3. ## Input two integers representing the number of rows and columns in a matrix. Output a matrix where each element is a product of the row and column number.

my_matrix <- function(r=4,
                      c=5){
  m <- base::matrix(NA, nrow=r, ncol=c) # will matrix with NA
  for(i in 1:nrow(m)) {
    for(j in 1:ncol(m)) {
      m[i,j] <- i*j
    } # end column loop
  } # end row loop 
  return(m)
} # end of my_matrix
# ------------------------------
my_matrix()



4. ## Randomization test for my data

set.seed(1210)

## read in data
make_data <- function(x=NULL) {
  
  if(is.null(x)) {
    Poll_VisitsA <- rnorm(n=82,mean=1,sd=0.5)
    Poll_VisitsB <- rnorm(n=76,mean=2.5,sd=0.5)
    Poll_VisitsC <- rnorm(n=90,mean=6,sd=0.5)
  }
  data.set <- data.frame(Treatment=c(rep('A', 82), rep('B', 76), rep('C', 90)), Rate=c(Poll_VisitsA, Poll_VisitsB, Poll_VisitsC)) # set up data frame
  
  return(data.set) 
  
  
  
  
}
# end of make_data
#-----------------------
make_data()
z <- make_data()
print(z)

## calculate metric
data_analysis <- function(x=z) {
stats <- aov(Rate ~ Treatment, data = x)
stats_summary <- summary(stats)[[1]][["Pr(>F)"]][[1]]
return(stats_summary)
} 
data_analysis()

##################################################
# function: shuffleData
# randomize data for regression analysis
# input: 3-column data frame (ID,xVar,yVar)
# output: 3-column data frame (ID,xVar,yVar)
#------------------------------------------------- 
shuffleData <- function(x=z) {
       
  x[,2] <- sample(x[,2]) # use sample function with defaults to reshuffle column
  
  return(x)
}
shuffleData()

##################################################
# function: getPVal
# calculate p value from simulation
# input: list of observed metric, and vector of simulated metrics
# output: lower, upper tail probability values
#------------------------------------------------- 
getPVal <- function(z=NULL) {
  if(is.null(z)){
    z <- list(xObs=runif(1),xSim=runif(1000))}
  pLower <- mean(z[[2]]<=z[[1]])
  pUpper <- mean(z[[2]]>=z[[1]])
  return(c(pL=pLower,pU=pUpper))
}
getPVal()

##################################################
# function: plotRanTest
# create ggplot of histogram of simulated values
# input: list of observed metric and vector of simulated metrics
# output: saved ggplot graph
#------------------------------------------------- 
plotRanTest <- function(z=NULL) {
  if(is.null(z)){
    z <- list(rnorm(1),rnorm(1000)) }
  dF <- data.frame(ID=seq_along(z[[2]]),simX=z[[2]])
  p1 <- ggplot(data=dF,mapping=aes(x=simX))
  p1 + geom_histogram(mapping=aes(fill=I("goldenrod"),color=I("black"))) +
    geom_vline(aes(xintercept=z[[1]],col="blue")) 
  
}


nSim <- 1000
Xsim <- rep(NA,nSim) # vector of simulated slopes
dF <- make_data()
Xobs <- data_analysis(dF)

for (i in seq_len(nSim)) {
  Xsim[i] <- data_analysis(shuffleData(dF))
}

slopes <- list(Xobs,Xsim)
getPVal(slopes)
plotRanTest(slopes)

## The p-value that I got from my randomization test was very close to the one I got from the standard test. The randomization p-value was zero, and the standard p value was very very small, it was basically zero. 