# Ch. 3 Data Preprocessing exercises 
# Hannah Andrews and Angela Hughes 
# Info 523 
# Spring 2020 

load(file = 'C:/Users/hanna/Documents/git/INFO523 Coursework/INFO523Coursework/MIDUS2.rda')

# install.packages("prettyR")

library(readr)
library(dplyr)
library(tidyr)
library(Hmisc)
library(prettyR)
#install.packages("discretization")
library(discretization)
#install.packages("gmodels")
library(gmodels)
library(tidyverse)
library(corrplot)
# install.packages('arules')
library(arules)

# Variable Transformations ----
# Create dummy variable 1 = ever pray in the past year, 0 = never 
MIDUS2$B1SA56M = as.numeric(MIDUS2$B1SA56M)
MIDUS2$beverpray = ifelse(MIDUS2$B1SA56M %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56M == 5, 0,
                                ifelse(MIDUS2$B1SA56M == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table0 <- table(MIDUS2$B1SA56M, MIDUS2$beverpray)
print.table(table0)

# Inspect new var everpray
summary(MIDUS2$beverpray)
Hmisc::describe(MIDUS2$beverpray)

## Create dummy variable = 1 if ever meditate in the past year, 0 = never
summary(MIDUS2$B1SA56N)
Hmisc::describe(MIDUS2$B1SA56N)
class(MIDUS2$B1SA56N)
MIDUS2$B1SA56N = as.numeric(MIDUS2$B1SA56N) # convert factor to numeric
class(MIDUS2$B1SA56N)
MIDUS2$B1SA56M = as.numeric(MIDUS2$B1SA56M)
MIDUS2$bevermeditate = ifelse(MIDUS2$B1SA56N %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56N == 5, 0,
                                ifelse(MIDUS2$B1SA56N == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table1 <- table(MIDUS2$B1SA56N, MIDUS2$bevermeditate)
print.table(table1)

# Convert acupuncture to dummy (same coding as above)
summary(MIDUS2$B1SA56A)
Hmisc::describe(MIDUS2$B1SA56A)
class(MIDUS2$B1SA56A)
MIDUS2$B1SA56A = as.numeric(MIDUS2$B1SA56A) # convert factor to numeric
class(MIDUS2$B1SA56A)
MIDUS2$beveracupuncture = ifelse(MIDUS2$B1SA56A %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56A == 5, 0,
                                ifelse(MIDUS2$B1SA56A == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table2 <- table(MIDUS2$B1SA56A, MIDUS2$beveracupuncture)
print.table(table2)

# Convert biofeedback to dummy (same coding as above)
summary(MIDUS2$B1SA56B)
Hmisc::describe(MIDUS2$B1SA56B)
class(MIDUS2$B1SA56B)
MIDUS2$B1SA56B = as.numeric(MIDUS2$B1SA56B) # convert factor to numeric
class(MIDUS2$B1SA56B)
MIDUS2$beverbiofeedback = ifelse(MIDUS2$B1SA56B %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56B == 5, 0,
                                ifelse(MIDUS2$B1SA56B == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table3 <- table(MIDUS2$B1SA56B, MIDUS2$beverbiofeedback)
print.table(table3)

# Convert chiropractor to dummy (same coding as above)
summary(MIDUS2$B1SA56C)
Hmisc::describe(MIDUS2$B1SA56C)
class(MIDUS2$B1SA56C)
MIDUS2$B1SA56C = as.numeric(MIDUS2$B1SA56C) # convert factor to numeric
class(MIDUS2$B1SA56C)
MIDUS2$beverchiropractor = ifelse(MIDUS2$B1SA56C %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56C == 5, 0,
                                ifelse(MIDUS2$B1SA56C == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table3 <- table(MIDUS2$B1SA56C, MIDUS2$beverchiropractor)
print.table(table3)

# Convert energy healing to dummy (same coding as above)
summary(MIDUS2$B1SA56D)
Hmisc::describe(MIDUS2$B1SA56D)
class(MIDUS2$B1SA56D)
MIDUS2$B1SA56D = as.numeric(MIDUS2$B1SA56D) # convert factor to numeric
class(MIDUS2$B1SA56D)
MIDUS2$beverenergy = ifelse(MIDUS2$B1SA56D %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56D == 5, 0,
                                ifelse(MIDUS2$B1SA56D == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table4 <- table(MIDUS2$B1SA56D, MIDUS2$beverenergy)
print.table(table4)

# Convert exercise/movement therapy to dummy (same coding as above)
summary(MIDUS2$B1SA56F)
Hmisc::describe(MIDUS2$B1SA56F)
class(MIDUS2$B1SA56F)
MIDUS2$B1SA56F = as.numeric(MIDUS2$B1SA56F) # convert factor to numeric
class(MIDUS2$B1SA56F)
MIDUS2$bevermovetherapy = ifelse(MIDUS2$B1SA56F %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56F == 5, 0,
                                ifelse(MIDUS2$B1SA56F == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table5 <- table(MIDUS2$B1SA56F, MIDUS2$bevermovetherapy)
print.table(table5)

# Convert herable therapy to dummy (same coding as above)
summary(MIDUS2$B1SA56G)
Hmisc::describe(MIDUS2$B1SA56G)
class(MIDUS2$B1SA56G)
MIDUS2$B1SA56G = as.numeric(MIDUS2$B1SA56G) # convert factor to numeric
class(MIDUS2$B1SA56G)
MIDUS2$beverherbtherapy = ifelse(MIDUS2$B1SA56G %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56G == 5, 0,
                                ifelse(MIDUS2$B1SA56G == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table6 <- table(MIDUS2$B1SA56G, MIDUS2$beverherbtherapy)
print.table(table6)

# Convert high dose mega vitamins to dummy (same coding as above)
summary(MIDUS2$B1SA56H)
Hmisc::describe(MIDUS2$B1SA56H)
class(MIDUS2$B1SA56H)
MIDUS2$B1SA56H = as.numeric(MIDUS2$B1SA56H) # convert factor to numeric
class(MIDUS2$B1SA56H)
MIDUS2$bevermegavitamins = ifelse(MIDUS2$B1SA56H %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56H == 5, 0,
                                ifelse(MIDUS2$B1SA56H == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table7 <- table(MIDUS2$B1SA56H, MIDUS2$bevermegavitamins)
print.table(table7)

# Convert homeopathy to dummy (same coding as above)
summary(MIDUS2$B1SA56I)
Hmisc::describe(MIDUS2$B1SA56I)
class(MIDUS2$B1SA56I)
MIDUS2$B1SA56I = as.numeric(MIDUS2$B1SA56I) # convert factor to numeric
class(MIDUS2$B1SA56I)
MIDUS2$beverhomeopathy = ifelse(MIDUS2$B1SA56I %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56I == 5, 0,
                                ifelse(MIDUS2$B1SA56I == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table8 <- table(MIDUS2$B1SA56I, MIDUS2$beverhomeopathy)
print.table(table8)

# Convert hypnosis to dummy (same coding as above)
summary(MIDUS2$B1SA56J)
Hmisc::describe(MIDUS2$B1SA56J)
class(MIDUS2$B1SA56J)
MIDUS2$B1SA56J = as.numeric(MIDUS2$B1SA56J) # convert factor to numeric
class(MIDUS2$B1SA56J)
MIDUS2$beverhypnosis = ifelse(MIDUS2$B1SA56J %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56J == 5, 0,
                                ifelse(MIDUS2$B1SA56J == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table9 <- table(MIDUS2$B1SA56J, MIDUS2$beverhypnosis)
print.table(table9)

# Convert imagery techniques to dummy (same coding as above)
summary(MIDUS2$B1SA56K)
Hmisc::describe(MIDUS2$B1SA56K)
class(MIDUS2$B1SA56K)
MIDUS2$B1SA56K = as.numeric(MIDUS2$B1SA56K) # convert factor to numeric
class(MIDUS2$B1SA56K)
MIDUS2$beverimagetech = ifelse(MIDUS2$B1SA56K %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56K == 5, 0,
                                ifelse(MIDUS2$B1SA56K == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table10 <- table(MIDUS2$B1SA56K, MIDUS2$beverimagetech)
print.table(table10)


# Convert massage therapy to dummy (same coding as above)
summary(MIDUS2$B1SA56L)
Hmisc::describe(MIDUS2$B1SA56L)
class(MIDUS2$B1SA56L)
MIDUS2$B1SA56L = as.numeric(MIDUS2$B1SA56L) # convert factor to numeric
class(MIDUS2$B1SA56L)
MIDUS2$bevermassage = ifelse(MIDUS2$B1SA56L %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56L == 5, 0,
                                ifelse(MIDUS2$B1SA56L == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table11 <- table(MIDUS2$B1SA56L, MIDUS2$bevermassage)
print.table(table11)

# Convert special diet to dummy (same coding as above)
summary(MIDUS2$B1SA56Q)
Hmisc::describe(MIDUS2$B1SA56Q)
class(MIDUS2$B1SA56Q)
MIDUS2$B1SA56Q = as.numeric(MIDUS2$B1SA56Q) # convert factor to numeric
class(MIDUS2$B1SA56Q)
MIDUS2$beverspecialdiet = ifelse(MIDUS2$B1SA56Q %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56Q == 5, 0,
                                ifelse(MIDUS2$B1SA56Q == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table12 <- table(MIDUS2$B1SA56Q, MIDUS2$beverspecialdiet)
print.table(table12)

# Convert spiritual healing to dummy (same coding as above)
summary(MIDUS2$B1SA56R)
Hmisc::describe(MIDUS2$B1SA56R)
class(MIDUS2$B1SA56R)
MIDUS2$B1SA56R = as.numeric(MIDUS2$B1SA56R) # convert factor to numeric
class(MIDUS2$B1SA56R)
MIDUS2$beverspiritheal = ifelse(MIDUS2$B1SA56R %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56R == 5, 0,
                                ifelse(MIDUS2$B1SA56R == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table13 <- table(MIDUS2$B1SA56R, MIDUS2$beverspiritheal)
print.table(table13)

# Convert other non-traditional therapy to dummy (same coding as above)
summary(MIDUS2$B1SA56S)
Hmisc::describe(MIDUS2$B1SA56S)
class(MIDUS2$B1SA56S)
MIDUS2$B1SA56S = as.numeric(MIDUS2$B1SA56S) # convert factor to numeric
class(MIDUS2$B1SA56S)
MIDUS2$beverotherheal = ifelse(MIDUS2$B1SA56S %in% c(1, 2, 3, 4), 1,
                         ifelse(MIDUS2$B1SA56S == 5, 0,
                                ifelse(MIDUS2$B1SA56S == NA, NA)))
# Check that original vals 1, 2, 3, 4 = 1 and 5 = 0
table14 <- table(MIDUS2$B1SA56S, MIDUS2$beverotherheal)
print.table(table14)

# Create variable that is a sum of all complementary and alternative medicines 
# MIDUS2 %>% mutate(
#  bevercamsum = rowSums(select(., starts_with("bever"))))
# summary(MIDUS2$bevercamsum)

# Run Chi-Square
CrossTable(MIDUS2$beverpray, MIDUS2$bevermeditate,
           expected = TRUE)



## Required exercises 
# 1.	What attributes are there in your data set?----
dim(MIDUS2)
dimnames(MIDUS2)
# There are 145 attributes in our dataset. They include income, education, occupation, age, sex, race, use of complementary and alternative medicines, subjective phsyical and mental health measures, religiosity, spiritualty, mindfulness practices, biomarker data, and survey weights. 

# 2.	Do you have highly correlated attributes? How did you find out about the correlations or lack of correlations?----

## Subjective mental and physical health are highly correlated, as are the religious variables (private religious practices, religious support, and religious identification). Mindfulness and spirituality are highly correlated. Depression and perceived stress are also highly correlated. We found the correlations by creating a correlation matrix, then visualizing the matrix as a correlogram. See code below. 

# Rename variables 
MIDUS2 <- MIDUS2 %>% 
  rename(bSex = B1PRSEX,
    bSubjectivePhysicalHealth = B1PA1, 
    bSubjectiveMentalHealth = B1PA2,
    bEverSmokeRegularly = B1PA38A,
    bAgeFirstCig = B1PA37, 
    bDepression = B1PDEPRE, 
    bPanicAttack = B1PPANIC, 
    bSpirituality = B1SSPIRI, 
    bReligiousId = B1SRELID, 
    bPrivReligPractice = B1SRELPR, 
    bReligiousSupport =  B1SRELSU, 
    bMindfulness = B1SMNDFU, 
    bDailySpiritExp = B1SSPRTE, 
    bTotChronic = B4HSYMN, 
    bBmi = B4PBMI, 
    bCesDepression = B4QCESD, 
    bPerceivedStress = B4QPS_PS,
    bTotHHInc = B1STINC1
    )

# Create list of numeric variables to correlate
myvars <- c('bSubjectivePhysicalHealth', 'bSubjectiveMentalHealth', 'bAgeFirstCig',
            'bDepression', 'bPanicAttack','bSpirituality', 'bReligiousId', 
            'bPrivReligPractice', 'bReligiousSupport', 'bMindfulness', 'bDailySpiritExp',
            'bTotChronic', 'bBmi', 'bCesDepression', 'bPerceivedStress', 'bTotHHInc')

# Create dataframe of numeric variables for correlation matrix
df <- MIDUS2[myvars]
df <- sapply(df, as.numeric)
df
class(df)

# Run correlation matrix 
df.rcorr <- rcorr(df, type = c('pearson'))
df.rcorr
# Object of class type matrix are generated containing the correlation coefficients 
df.coeff = df.rcorr$r
# and p-values.
df.p = df.rcorr$P
# Print each 
df.coeff
df.p

# Visualize correlation coefficients 
corrplot(df.coeff)

# 3.	Do you have numerical attributes that you might want to discretize? Try at least two methods and compare the differences. ----

# We will discretize the income variable, bTotHHInc. 

# Method 1: Cut into bins of $10,000 
hist(MIDUS2$bTotHHInc, breaks = seq(0,300000, by =10000))

# Method 2: Smoothing by bin mean
completeincome <- na.omit(MIDUS2$bTotHHInc) 
(bins = matrix(completeincome, nrow = length(completeincome)/41, byrow = TRUE))
(bin_means = apply(bins, 1, FUN = mean))
for (i in 1:nrow(bins)) {
  bins[i,] = bin_means[i]
}
bins
hist(bins)

# 4.	If you have categorical attributes, use the concept hierarchy generation heuristics (based on attribute value counts) suggested in the textbook to produce some concept hierarchies. How well is this approach work for your attributes? ----
# There are no categorical attributes in our dataset that lend themselves to concept hierarchy generation. 




  