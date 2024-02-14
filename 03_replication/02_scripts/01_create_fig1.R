# Authors: Sindhu Priya Mallvarapu
# Date: February 11, 2024
# Purpose: Replicate one element from the chosen paper. 

# Add in appropriate libraries
library(dplyr)
library(ggplot2) 

#read in data
stat_data <- read.csv("03_replication/03_outputs/merged_data.csv")
#filter in the right data
scores <- dplyr::filter(stat_data, Sex == "Female")
#plot the data
ggplot(mapping = aes(scores$StatValue, scores$Sex)) + geom_boxplot() + theme_classic()

