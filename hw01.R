ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30,33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
mean(ages)

library(dplyr)
installed.packages("modes")
library(modes)
modes(ages)
