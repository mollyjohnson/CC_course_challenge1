################################################################################
# Coding Club Stats From Scratch Course Challenge 1:
# Red Squirrel Data Challenge
# Description: Clean the dataset, determine if there is a temporal trend
# in the number of observations for red and grey squirrels between
# 2008 and 2017, determine if red and grey squirrels prefer different habitats,
# and re-classify forest cover
# Author: Molly Johnson, Oregon State University/Bradley University
# Date: 8-14-2020
################################################################################

# libraries ----
library(lme4)
library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)
library(gridExtra)

# functions ----


# set working directory ----


# import data from .csv
squirrels <- read.csv("data/squirrels.csv", header = TRUE)
head(squirrels$Start.date.year)
head(squirrels)
str(squirrels)

# filter to only include those w start dates between 2008 and 2017
squirrels <- filter(squirrels, Start.date.year >= 2008 & Start.date.year <= 2017)
str(squirrels)
head(squirrels$Start.date.year)

# rename Start.date.year col to just year
squirrels <- rename(squirrels, year = Start.date.year)
str(squirrels)
head(squirrels$year)

# remove entries where we don't know what the species is (red vs grey)
squirrels <- filter(squirrels, Taxon.Rank == "species")
print(squirrels$Common.name)
print(squirrels$Taxon.Rank)

# create species column w Red and Grey as factor levels
