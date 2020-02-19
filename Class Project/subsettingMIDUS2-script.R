# Subsetting MIDUS2 Data 
# Hannah Andrews
# 2020-02-11

setwd("C:/Users/hanna/git/AHL")
library(tidyverse)
library(foreign)
library(readstata13)
library(Hmisc)
library(magrittr)
library(dplyr)

MIDUS2 <- read.dta13('C:/Users/hanna/git/AHL/data-cleaning/MIDUS2.dta')

# Select vars from MIDUS 2 
## Received error when running select command below for these variables: "B1PAGE_M2", "B2DB2", "B2DB3", "B1STINC1", "B1PB1". Investigate later 

infoproject <- MIDUS2 %>%
  select("M2ID", "M2FAMNUM", "SAMPLMAJ", "B1STATUS",  "B1PRSEX", 
                           "B1PWGHT1", "B1PWGHT2", "B1PWGHT3", "B1PWGHT4", "B1PWGHT5", 
                           "B1PWGHT6", "B1PWGHT7", "B1PWGHT8", "B1PWGHT9", "B1PA1", "B1PA2",
                           "B1PA38A", "B1PA37", "B4HSYMX", "B4HSYMN", "B4PBMI", "B4P1GS", 
                           "B4P1GD", "B4BLDL", "B4BCHOL", "B4BHDL", "B4BTRIGL", "B4BDHEA",
                           "B4BDHEAS", "B4BCRP", "B4BIL6", "B4BMSDIL6", "B4BSIL6R", 
                           "B4BHA1C", "B4BGLUC", "B4BINSLN", "B4BIGF1", "B4BCORTL", 
                           "B4BNECL", "B4BCLCRE", "B4BSCL3A", "B4BSCL42", "B4BEPIN", 
                           "B4BEPI12", "B4BEPCRE", "B4BNECL", "B4BNOREP", "B4BNE12", 
                           "B4BNOCRE", "B4BDOPA", "B4BDOCRE", "B4BDOP12", "B1PANHED", 
                           "B1PDEPAF", "B1PDEPRE", "B1PANXIE", "B1PPANIC", "B1PF7A", 
                           "B1PF7B", "B1PF7C", "B1PF7D", "B1PF8B", "B1PF3", "B1PF2A", 
                           "B1PF2B", "B1PF2C", "B1SSPIRI", "B1SRELID", "B1SRELPR", 
                           "B1SRELSU", "B1SRELCA", "B1SRELCB", "B1SMNDFU", "B1SSPRTE", 
                           "B1SHLOCS", "B1SHLOCO", "B1SC1", "B1SC3A", "B1SC3B", "B1SC3C", 
                           "B1SC3D", "B1SC3E", "B1SC3F", "B1SC3G", "B1SC3H", "B1SA52", 
                           "B1SUSEMD", "B1SA54A", "B1SA54B", "B1SA54C", "B1SA56A", "B1SA56B",
                           "B1SA56C", "B1SA56D", "B1SA56F", "B1SA56G", "B1SA56H", "B1SA56I",
                           "B1SA56J", "B1SA56K", "B1SA56L", "B1SA56M", "B1SA56N", "B1SA56Q",
                           "B1SA56R", "B1SA56S", "B1SA30A", "B1SA30B", 
                           "B1SA30C", "B1SA30D", "B1SA30E", "B1SA30F", "B1SA31A", "B1SA31B", 
                           "B1SA31C", "B1SA31D", "B1SA31E", "B1SA31F", "B1SA32A", "B1SA32B", 
                           "B1SA32C", "B1SA32D", "B1SA32E", "B1SA32F", "B1SA57A", "B1SA57B", 
                           "B1SA58A", "B1SA58B", "B1SA61A", "B1SA61B", "B1SA61C", "B1SA61D", 
                           "B4QCESD", "B4QPS_PS","B1SEARN1", "B1SPNSN1",  
                           "B1SSEC1", "B1SG7","B1SG23", "B1SG24A", "B1POCC",
                           "B1POCMAJ")
save(infoproject, file = "C:/Users/hanna/Documents/git/INFO523 Coursework/infoproject")




















#write.table(read.dta
#           (file.choose("C:/Users/hanna/Documents/git/INFO523 Coursework/infoproject")), 
#           file="C:/Users/hanna/Documents/git/INFO523 Coursework/infoproject.csv", 
#           quote = FALSE, sep = ",")

save(infoproject, file = "C:/Users/hanna/Documents/git/INFO523 Coursework/infoproject")

# Project 4: current diet and exercise practices https://midus.colectica.org/Item/int.example/be8e20c9-edcf-432c-a358-d12b13f545e4/2

# MIDUS1 <- read.dta13('C:/Users/hanna/git/AHL/data-cleaning/MIDUS1.dta')

# To be merged from MIDUS 1 
#myvars2 <- c("A1POCDMJ", "A1PINDMJ", "A1PTSEID", "A1PC2", "A1PC8", "A1POCMMJ",
#            "A1PINMMJ", "A1PTSEIM")
