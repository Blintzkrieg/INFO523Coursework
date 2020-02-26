#Chapter 3 HW#2 by Angela Hughes and Hannah Andrews
#Page 121, Exercises 3.2, 3.3, 3.5, 3.6, 3.8, 3.11
#due midnight 2/19

library(dplyr)

#3.2
#missing values can be replaced with the median, especially if the data is skewed.
#Or they could be replaced by the mean if the data is symmetrical.
#You could fill in the missing value with a Baysian-predicted value.
#It's generally not recommended to fill missing values with −∞.
#missing values can also be replaced with "N/A", "Unknown", to distinguish semantics.
#but these labels may interfere with analysis that seeks to recognize trends.

#3.3
#(a)
ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30,
          33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
length(ages) #is 27

#bins of depth 3, where our 27 items are divided by 9 bins
ageBin1 <- c(13, 15, 16)
ageBin2 <- c(16, 19, 20)
ageBin3 <- c(20, 21, 22)
ageBin4 <- c(22, 25, 25)
ageBin5 <- c(25, 25, 30)
ageBin6 <- c(33, 33, 35)
ageBin7 <- c(35, 35, 35)
ageBin8 <- c(36, 40, 45)
ageBin9 <- c(46, 52, 70)

ageBins <- c(mean(ageBin1), mean(ageBin2), mean(ageBin3), mean(ageBin4), 
             mean(ageBin5), mean(ageBin6), mean(ageBin7), mean(ageBin8), mean(ageBin9)) 
ageBins <- round(ageBins)
print(ageBins) #there were too many sig figs
length(ageBins) #is 9

#comparing pre-smoothed and smoothed by bin means
fivenum(ages)
fivenum(ageBins)
boxplot(ages) #pre-smoothed treats highest value as an outlier
boxplot(ageBins)#smoothed has a higher median
mean(ages)
mean(ageBins) #mean is about the same, smoothed and pre-smoothed

#(b)
#outliers could be determined by cluster analysis, boxplots (such as above in 3.3(a)),
#and linear regression (by finding data outside of the line of best fit)

#(c)
#other methods of data smoothing include wavelet transform, clustering, 
#log linear models, and regression.


#3.5
#value ranges of the following normalization methods.

#(a)
#the value ranges of min-max normalization are the new min and the new max, as defined by
#the scientist. The values within that range are transformed in a linear way, where their
#relationships are preserved. After this normalization, 
#you can't introduce new values that fall outside of the original min-max.

#(b)
#the value ranges of z-score normalization are taken by subtracting the mean, and 
#dividing by the standard deviation, for each value.
#this can be used when the real min-max are unknown, and when there are outliers.

#(c)
#the value ranges of z-score normalization using mean absolute deviation are taken 
#by subtracting the mean, and dividing by the mean absolute deviation, for each value.
#this can diminish the powerful effect of outliers.
#mean absolute deviation: from each value, subtract the mean, sum the values after subtraction, 
#and divide by the total number of values.


#(d)
#the value ranges of normalization by decimal scaling normalization are such that that
#the absolute value of the maxium value is less than 1. We divide each value by
#ten to the power of whichever exponent achieves this. Basically, we're moving the decimal
#point over so that our largest value sits just to the right of the decimal. 

#3.6
#normalizing the following data
preNormed <- c(200, 300, 400, 600, 1000)

#(a) min-max normalization by setting min=0 and max=1
minMaxNormed <- (((preNormed[1])-200)/(1000-200))*(1-0)+0
minMaxNormed <- append(minMaxNormed,(((preNormed[2])-200)/(1000-200))*(1-0)+0, after=length(minMaxNormed))
minMaxNormed <- append(minMaxNormed,(((preNormed[3])-200)/(1000-200))*(1-0)+0, after=length(minMaxNormed))
minMaxNormed <- append(minMaxNormed,(((preNormed[4])-200)/(1000-200))*(1-0)+0, after=length(minMaxNormed))
minMaxNormed <- append(minMaxNormed,(((preNormed[5])-200)/(1000-200))*(1-0)+0, after=length(minMaxNormed))
print(minMaxNormed)

#(b) zscore norming
sd(preNormed)
mean(preNormed)
sdNormed <- ((preNormed[1])-mean(preNormed))/(sd(preNormed))
sdNormed <- append(sdNormed, ((preNormed[2])-mean(preNormed))/(sd(preNormed)), after=length(minMaxNormed))
sdNormed <- append(sdNormed, ((preNormed[3])-mean(preNormed))/(sd(preNormed)), after=length(minMaxNormed))
sdNormed <- append(sdNormed, ((preNormed[4])-mean(preNormed))/(sd(preNormed)), after=length(minMaxNormed))
sdNormed <- append(sdNormed, ((preNormed[5])-mean(preNormed))/(sd(preNormed)), after=length(minMaxNormed))
print(sdNormed)

#(c) z-score norming using mean absolute deviation

mAbsolute <- abs(preNormed[1] - mean(preNormed)) + abs(preNormed[2] - mean(preNormed)) + abs(preNormed[3] - mean(preNormed)) + abs(preNormed[4] - mean(preNormed)) + abs(preNormed[5] - mean(preNormed))
mAbsolute <- mAbsolute/length(preNormed)              

meanAbsNormed <- c()
meanAbsNormed <- ((preNormed[1])-mean(preNormed))/(mAbsolute)
meanAbsNormed <- append(meanAbsNormed, ((preNormed[2])-mean(preNormed))/(mAbsolute), after=length(meanAbsNormed))
meanAbsNormed <- append(meanAbsNormed, ((preNormed[3])-mean(preNormed))/(mAbsolute), after=length(meanAbsNormed))
meanAbsNormed <- append(meanAbsNormed, ((preNormed[4])-mean(preNormed))/(mAbsolute), after=length(meanAbsNormed))
meanAbsNormed <- append(meanAbsNormed, ((preNormed[5])-mean(preNormed))/(mAbsolute), after=length(meanAbsNormed))

              