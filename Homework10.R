counter <- 0
z <- rpois(10, 1)
print(z)
for(i in seq_along(z)) {
  if(z[i] == 0) {
    counter <- counter + 1
  }}
print(counter)

2. 
3.
4. set.seed(1210)

# lecture 19 randomization tests
# for p value for anova instead of coefficients
summary(stats)[[1]][["Pr(>F)"]][[1]]