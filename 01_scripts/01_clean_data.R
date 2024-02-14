#### Preamble ####
# Purpose: Clean the merged data
# Author: Sindhu Priya Mallavarapu
# Date: 23 January 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)

#### Clean data ####

# read in the raw data
raw_data <- read_csv("03_replication/03_outputs/merged_data.csv")

# clean up the names in the raw data
cleaned_data <- clean_names(raw_data)
#check to make sure that the names are cleaned to our liking
names(cleaned_data)

# omit any data that is left blank
analysis_data <- na.omit(cleaned_data)

# one final check for our cleaned data
head(analysis_data)

#### Save data ####
write_csv(analysis_data, "02_outputs/data/analysis_data.csv")