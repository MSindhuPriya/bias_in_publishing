#### Preamble ####
# Purpose: Simulates data
# Author: Sindhu Priya Mallavarapu, Jena Shah
# Date: 12 February 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
# setting seed to ensure reproducibility
set.seed(144)
# creating a data frame
simulated_data <-
  (tibble(
    # creating a variable for the native language of the publisher
    Language = sample(
      x = c("English", "Non-English"), 
      # sample 5050 events from the list
      size = 5050,
      # sample with replacement
      replace = TRUE
    ),
    # creating a variable for the sex of the publisher
    Sex = sample(
      x = c("Female", "Male"), 
      # sample 5050 events from the list
      size = 5050,
      # sample with replacement
      replace = TRUE
    ),
    
    # creating a variable for the flesch score
     flesch_score = 
      # getting 50 samples for each 
      rep(c(0: 100), 50)
  ))
# looking at the head of the simulated data
head(simulated_data)
