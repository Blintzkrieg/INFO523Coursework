#Chapter 2 HW by Angela Hughes and Hannah Andrews
#Page 80, Exercises 2.2, 2.3, 2.4, 2.8

library(dplyr)

#2.2(a) mean is 29.96296
ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30,
          33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
mean(ages)

#2.2(b) mode is 25. It occurs 4 times.
install.packages("modes")
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

#2.3  Approximate median value.
#using formula (2.3) on page 46 of the textbook.
#where 21 is the lower boundary of the median interval, 
#3194 is number of values in the entire dataset, 
#950 is the sum of the frequencies of all the intervals that are lower than the median interval (200+450+300), 
#and 29 is the median's bin width.
#the midpoint is 55.5, which would fall in bin "51-80", but we know the median is going to be in the bin with highest frequency, "21-50".
approxMed <- 21 + (((3194/2) - 950)/1500)*29
print(approxMed)


#2.4(a) mean, median, and standard deviation for ages and %fat
age <- c(23,23,27,27,39,41,47,49,50,52,54,54,56,57,58,58,60,61)
percentfat <- c(9.5,26.5,7.8,17.8,31.4,25.9,27.4,27.2,31.2,34.6,
                42.5,28.8,33.4,30.2,34.1,32.9,41.2,35.7)

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

#2.8(a) 
install.packages("philentropy")
library(philentropy)

#the 2-D data set before adding the new data point
dataSetA = cbind(c(1.5,2,1.6,1.2,1.5), c(1.7,1.9,1.8,1.5,1.0))
rownames(dataSetA) <- c('x1', 'x2', 'x3', 'x4', 'x5')
colnames(dataSetA) <- c('A1', 'A2')
print(dataSetA)
plot(dataSetA)

#the 2-D data set after adding the new data point x=(1.4, 1.6)
dataSetB = cbind(c(1.5,2,1.6,1.2,1.5, 1.4), c(1.7,1.9,1.8,1.5,1.0, 1.6))
rownames(dataSetB) <- c('x1', 'x2', 'x3', 'x4', 'x5', 'x')
colnames(dataSetB) <- c('A1', 'A2')
print(dataSetB)
plot(dataSetB)

#newDataPoint = rbind(c(1.4,1.6))

#Euclidean distance
dist(dataSetB, method="euclidean")
#Database points in order of similarity with x (most to least similar): 
#x2, x5, x3, x4, x1

#Manhattan distance
dist(dataSetB, method="manhattan")

#supremum distance
dist(dataSetB, method="maximum")


#cosine similarity
#according to R documentation, cosine(x, y) where x and y are vectors (a1 and a2) produces a similarity matrix. 
#cosine_dist(a1, a2, testNA=FALSE)

#2.8(b)
#normalized


#ranked using Euclidean distance




