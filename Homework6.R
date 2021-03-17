# Homework 6
# 10 March 2021
# Laney W

1. 
n_dims <- sample(3:10, 1)
print(n_dims)

seq(1, n_dims^2, by=1)
n_dimsx <- seq(1, n_dims^2, by=1)
print(n_dimsx)
sample(n_dimsx)
n_dimsm <- matrix(data=n_dimsx,nrow=5,ncol=5)
print(n_dimsm)

# transpose matrix
n_dimsmt <- t(n_dimsm)
print(n_dimsmt)

# calculate sum and mean of first row
sum(n_dimsmt[1,])
mean(n_dimsmt[1,])

# calculate sum and mean of first row
sum(n_dimsmt[5,])
mean(n_dimsmt[5,])

# finding eigenvalues and eigenvectors
e <- eigen(n_dimsmt)
e$values
e$vectors

typeof(e$values)
typeof(e$vectors)
# eigen values and vectors are complex numbers

2. 
# create my_matrix
my_matrix <- matrix(runif(16),nrow=4,ncol=4)
print(my_matrix)

# create my_logical
my_vector <- rpois(n = 100, lambda = 10)
print(my_vector)
my_vector > 5
my_logical <- my_vector > 5
print(my_logical)

# create my_letters
my_letters <- sample(letters[1:26])
print(my_letters)

# create myList
myList <- my_matrix
myList <- my_logical
myList <- my_letters
myList <- list(my_matrix[2,2], my_logical[2], my_letters[2])
print(myList)

# find types in list
typeof(myList[[1]])
typeof(myList[[2]])
typeof(myList[[3]])

# combine elements in a single atomic vector
myList2 <- c(myList[[1]], myList[[2]], myList[[3]])
print(myList2)
typeof(myList2)
# myList2 is a character vector

3. 
# create my_unis
my_unis <- runif(26, 0, 10)
print(my_unis)

# create my_letters
my_letters <- sample(LETTERS [1:26])
print(my_letters)

d_frame <- data.frame(my_unis, my_letters)
print(d_frame)
# replace 4 random rows of my_unis with NA
d_frame[sample(nrow(d_frame), 4), ] <- NA
print(d_frame)

# identify which rows have missing values
which(!complete.cases(d_frame))

# sort my_letters in alphabetical order
sort(LETTERS, decreasing=FALSE)
# calculate column mean 
mean(my_unis[1])
