# Ch. 3 Data Preprocessing exercises 
# Hannah Andrews and Angela Hughes 
# Info 523 
# Spring 2020 

load(file = 'C:/Users/hanna/Documents/git/INFO523 Coursework/INFO523Coursework/MIDUS2.rda')

library(readr)
library(dplyr)
library(tidyr)
library(Hmisc)

# Find rows containing an NA 
missing.values.rows <- filter(MIDUS2, !complete.cases(MIDUS2))
missing.values.rows
dim(missing.values.rows) 
# All observations missing in at least one column
View(missing.values.rows)

# How many NAs in each row? 
apply(MIDUS2, 1, function(x) sum(is.na(x)))
# How many NAs in each variable/column?
sort(apply(MIDUS2, 2, function(x) sum(is.na(x))))



## Required exercises 
# 1.	What attributes are there in your data set?


# 2.	Do you have highly correlated attributes? How did you find out about the correlations or lack of correlations?
# 3.	Do you have numerical attributes that you might want to discretize? Try at least two methods and compare the differences.
# 4.	If you have categorical attributes, use the concept hierarchy generation heuristics (based on attribute value counts) suggested in the textbook to produce some concept hierarchies. How well is this approach work for your attributes?   
  