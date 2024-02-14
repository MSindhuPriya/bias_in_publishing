# Authors: Sindhu Priya Mallavarapu, Jena Shah
# Date: February 2, 2024
# Purpose: Take in the input data and produce a csv that can later be used to replicate the paper. 

# load the required libraries
library(dplyr)
library(readr)

# read the "ReadStat.csv" data into a data frame
readstat <- read.csv("03_replication/01_inputs/ReadStat.csv")

# filter in only the rows of the file that we need
readability <- dplyr::filter(readstat, StatName == "flesch_score")

# read the "AuthorCorr.csv" file into a dataframe
author_corr <- read.csv("03_replication/01_inputs/AuthorCorr.csv")

# merge the readstat and author_corr data together allowing for duplicate rows
# if you don't allow for duplicate rows, some columns will only have the value "NA"
data2 <- merge.data.frame(readability, author_corr, no.dups = FALSE)

# read in the "Author.csv" data into a dataframe
author <- read.csv("03_replication/01_inputs/Author.csv")

# merge the previously merged data with author allowing for duplicate rows
# if you don't allow doe duplicate rows, some columns will only have the value "NA"
# we also create new rows if there no corresponding row for author in data2 
# this is because some articles might not have a readability score. 
# when we later clean the data we will drop those rows, but for now we leave them in
# this is so that we don't have some columns entirely populated with "NA"
merged_csv <- merge.data.frame(data2, author, all.y = TRUE, no.dups = FALSE)

jel <- read.csv("03_replication/01_inputs/primary_jel.csv")

final_csv <- merge.data.frame(merged_csv, jel)

# we write out the merged data into a file. 
write.csv(final_csv, file = "03_replication/03_outputs/merged_data.csv")
