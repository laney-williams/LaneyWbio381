# ---------------------------------
# Advanced ggplot assignment
# 14 May 2021
# LW
# -----------------------------------
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(patchwork)
library(TeachingDemos)


c <- ChickWeight
## basic bar graph
b_graph1 <- ggplot(data=c,
                   mapping=aes(x=Diet, y=weight)) + 
geom_boxplot()

print(b_graph1)

## add color to bar graph
b_graph2 <- ggplot(data=c,
                     mapping=aes(x=Diet, y=weight,
                                 fill=Diet)) +
  geom_boxplot()
print(b_graph2)

## change background theme
theme_graph <- b_graph2 + theme_economist() 
print(theme_graph)

## change sizing of the legends
theme_graph <- b_graph2 + theme_economist(base_size = 8)
print(theme_graph)

## add labels
b_graph3 <- ggplot(data=c, 
                   mapping=aes(x=Diet,
                               y=weight,
                               fill=Diet)) + 
  geom_boxplot() + theme_economist(base_size=8) + labs(title = "Chicken Weights on Diff. Diets", x = "Diet Type", y = "Weight")
print(b_graph3)

## add more data to graph
b_graph4 <- ggplot(data=c, 
                   mapping=aes(x=Diet,
                               y=weight,
                               fill=Diet)) + 
  geom_boxplot() + theme_economist(base_size=8) + labs(title = "Chicken Weights on Diff. Diets", x = "Diet Type", y = "Weight") + geom_point()
print(b_graph4)

## Make a second graph
o <- Orange

t_graph1 <- ggplot(data=o, 
              mapping=aes(x=age, y=circumference)) +
  geom_col(data=o)
print(t_graph1)

## change graph colors
t_graph1 <- ggplot(data=o,
                   mapping=aes(x = age, y = circumference, fill = age)) +
  geom_col(data = o)
print(t_graph1)

## change the theme of the graph
theme_graph2 <- t_graph1 + theme_economist(base_size = 8)
print(theme_graph2)

## add labels
t_graph2 <- ggplot(data=o,
                   mapping=aes(x = age, y = circumference, fill = age)) +
  geom_col(data = o) + theme_economist(base_size=6) + labs(title = "Circumference of trees", x = "age", y = "circumference")
print(t_graph2)
