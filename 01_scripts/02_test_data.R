#### Preamble ####
# Authors: Sindhu Priya Mallavarapu
# Date: February 15, 2024
# Purpose: Test data

#Read in data
test_data <- read.csv("02_outputs/data/analysis_data.csv")

# make sure that all stat_value are within range
# we don't test min because some flesch scores can be in the negatives
test_data$stat_value |> max() <= 100

# test to make sure we only record the flesch_score stat
unique(test_data$stat_name) == 'flesch_score'

# verify that variables are of appropriate class
test_data$stat_value |> class() == 'numeric'
test_data$author_id |> class() == 'integer'
test_data$article_id |> class() == 'integer'
test_data$author_name |> class() == 'character'
test_data$sex |> class() == 'character'
test_data$jel |> class() == 'character'

# check to make sure that we only have two unique values for gender
length(unique(test_data$sex)) == 2

class(test_data$article_id)
