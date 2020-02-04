#Chapter 2 HW by Angela Hughes and Hannah Andrews
#Page 80, Exercises 2.2, 2.3, 2.4, 2.8

library(dplyr)
library(ggplot2)

#2.2(a) mean is 29.96296
ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30,33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
mean(ages)

#2.2(b) mode is 25. It occurs 4 times.
installed.packages("modes")
library(modes)
modes(ages)


#2.2(c) midrange is 41.5
max <- max(ages)
min <- min(ages)
midrange <- (min + max) / 2

#2.2(d) The first quartile (Q1) is 13.0-20.5, and the third quartile (Q3) is 25.0-35.0
boxplot(ages)
boxplot.stats(ages)

#2.2(e) 5-number summary
fivnumbers <- fivenum(ages)

#2.2(f) Plotting the boxplot
boxplot(ages)

#2.2(g) quantile plots norm the data by plotting their percentage values, where 25%=Q1, 75%=Q3, etc.
#this prepares it to be compared to other data with different values and different mins & maxes.
#The percentage values are on the X axis, and the raw values are on the Y axis.
#quantile-quantile plots, however, map data to another comparable data series. They must have
#equal number of data points for this comparison. Then we can compare the value from each data
#set at qantile 1 (Q1), quantile 3 (Q3), etc.
#The data points correspond to percentages, and the raw values appear on both X and Y axes.
quantile(ages)
qqnorm(ages)

#2.3  need clarification

#2.4(a) mean, median, and standard deviation for ages and %fat
age <- c(23,23,27,27,39,41,47,49,50,52,54,54,56,57,58,58,60,61)
percentfat <- c(9.5,26.5,7.8,17.8,31.4,25.9,27.4,27.2,31.2,34.6,42.5,28.8,33.4,30.2,34.1,32.9,41.2,35.7)

mean(age)
sd(age)
median(age)

mean(percentfat)
sd(percentfat)
median(percent)


#2.4(b)boxplots
boxplot(age)
boxplot(percentfat)

#2.4(c)scatterplot and qqplot
plot.default(age, percentfat)
qqplot(age, percentfat)

#2.8 

