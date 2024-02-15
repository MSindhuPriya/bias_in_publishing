#Author: Jena Shah, Sindhu Priya Mallavarapu
#Date: February, 12, 2024
#Purpose: Generate the second element of the replication. 

library(dplyr)
library(ggplot2) 

# Create dataset for line 1: At least one female author (% papers)
tbl <- read.csv("03_replication/03_outputs/merged_data.csv")

y1 <- summarise(group_by(filter(tbl, Sex == "Female"), 
                         year = lubridate::year(PubDate)),
                articles_with_female = n_distinct(ArticleID))

# Create dataset for line 2: % female authors (per paper)
tem <- group_by(tbl, year = lubridate::year(PubDate))
y2 <- summarise(group_by(tem, ArticleID), perc_female = mean(sex == "Female", na.rm = TRUE))


# Create dataset for line 3: Majority female authored (% papers)
y3 <- c()

# Create dataset for line 4: 100% female authored (% papers)
y4 <- c()

# Create dataset for line 5: 100% female authored (% single-gender papers)
y5 <- c()

# Create the x-axis which is the date
x <- PubDate

# Create multiple-lined line graph for combined datasets
matplot(x, cbind(y1, y2, y3, y4, y5), type = "l", xlab ="", ylab = "",
        col = c("red", "green", "blue", "purple", "orange"))
legend("topleft", legend = c("At least one female author (% papers)",
                             "% female authors (per paper)",
                             "Majority female authored (% papers)",
                             "100% female authored (% papers)",
                             "100% female authored (% single-gender papers)"), 
       col = c("red", "green", "blue", "purple", "orange"), lty = 1,
       cex = 0.5)
