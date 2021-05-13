library(ggplot2)


make_data <- function(x=NULL) {
  
  if(is.null(x)) {
    Poll_VisitsA <- rnorm(n=82,mean=1,sd=0.5)
    Poll_VisitsB <- rnorm(n=76,mean=2.5,sd=0.5)
    Poll_VisitsC <- rnorm(n=90,mean=6,sd=0.5)
  }
  data.set <- c(Poll_VisitsA, Poll_VisitsB, Poll_VisitsC)
 
  return(data.set) 
  

  
  
}
# end of make_data
#-----------------------

make_data()
z <- make_data()
print(z)

# ---------------------------------
# FUNCTION organize_data
# description: Use data from previous function and order it to make sense of it.
# inputs: list of numbers
# outputs: data frame
###################################
organize_data <- function(Bee = c(Poll_VisitsA = rnorm(82), Poll_VisitsB = rnorm(76), Poll_VisitsC = rnorm(90))) {
  
Poll_VisitsA <- Bee[1:82]
Poll_VisitsB <- Bee[83:158]
Poll_VisitsC <- Bee[159:248]

Total_Pollination = data.frame(ID = 1:248, c(Poll_VisitsA, Poll_VisitsB, Poll_VisitsC)) 
                               Treatment = c(rep('trt A pollinator visits', 82), rep('trt B pollinator visits', 76), rep('trt C pollinator visits', 90))

colnames(Total_Pollination)[2] <- ('Pollination')

return(Total_Pollination)

  
}
# end of organize_data
#---------------------------------------------
organize_data()

# ---------------------------------
# FUNCTION data_analysis
# description: receive summary stats from the data
# inputs: data frame
# outputs: summary statistics
###################################
data_analysis <- function(x) {
  
summary_data <- summary(x)
print(summary_data)

stats <- aov(Pollination ~ Treatment, data = x)
stats_summary <- summary(stats)

return(stats_summary)
      
  
} 
data_analysis()

# end of data_analysis
#---------------------------------------------

# ---------------------------------
# FUNCTION create_boxplot
# description: makes a boxplot of the data analyzed
# inputs: statistics from AOV of data
# outputs: box plot
###################################
create_boxplot <- function(orged_data) {
  
ano_plot <- ggplot(orged_data) + aes(x = Treatment, y = Pollination) + geom_boxplot()

return(ano_plot)

  
} # end of create_boxplot
#---------------------------------------------

# ---------------------------------
# FUNCTION compile_data
# description: uses other functions to input data, analyze it, and then output a graph of the data.
# inputs: data file
# outputs: summary statistics and a box plot
###################################
compile_data <- function(x=NULL) {
  if(is.null(x)) {
    x <- make_data()
  }
  organizeData <- organize_data()
  statistics <- data_analysis(organizeData)
  graph <- create_boxplot(organizeData)

  print(statistics)
  print(graph)
  return()
  


  
} # end of compile_data
#---------------------------------------------

compile_data()
