# Create random data set to test hypothesis
# Laney W

library(tidyverse)


#------------------
# Create data set: I chose to simulate results of a pollinator visitation hypothesis. Means were chosen based on how many pollinators will land on flowers in these three treatments of plants over the course of an hour. 
# Standard deviation is the same between treatments.
# number of observations is the total amount of observations over the entire summer for each treatment.

# number of treatments
nGroup <- 3

# names of treatment groups
nName <- c("Poll_VisitsA", "Poll_VisitsB", "Poll_VisitsC")

# number of observations in each group
nSize <- c(82,76,90)

# mean in each group
nMean <- c(1, 2.5, 6)

# standard dev. in each group
nSD <- c(0.5,0.5,0.5)
```


ID <- 1:(sum(nSize))

resVar <- c(rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
            rnorm(n=nSize[2],mean=nMean[2],sd=nSD[2]),
            rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]))

Poll_Group <- rep(nName,nSize)
ANOdata <- data.frame(ID,Poll_Group,resVar)
str(ANOdata)

# run an ANOVA
ANOmodel <- aov(resVar~Poll_Group,data=ANOdata)
print(ANOmodel)
print(summary(ANOmodel))

z <- summary(ANOmodel)
str(z)
aggregate(resVar~Poll_Group,data=ANOdata,FUN=mean)
unlist(z)

# ggplot of data
ANOplot <- ggplot(data=ANOdata,aes(x=Poll_Group,y=resVar,fill=TGroup)) + geom_boxplot()
print(ANOplot)
