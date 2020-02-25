#Chapter 3 HW#2 by Angela Hughes and Hannah Andrews
#Page 121, Exercises 3.2, 3.3, 3.5, 3.6, 3.8, 3.11
#due midnight 2/19

library(dplyr)

#3.2
#missing values can be replaced with the median, especially if the data is skewed.
#Or they could be replaced by the mean if the data is symmetrical.
#You could fill in the missing value with a Baysian-predicted value.
#It's generally not recommended to fill missing values with −∞.


#3.3
#clustering can be used for outlier detection.
#(a)
ages <- c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30,
          33, 33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
#(b)

#(c)