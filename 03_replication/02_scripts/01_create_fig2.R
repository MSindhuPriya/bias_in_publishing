#Author: Jena Shah, Sindhu Priya Mallavarapu
#Date: February, 12, 2024
#Purpose: Generate the second element of the replication. 

library(dplyr)
library(ggplot2) 
combined <- read.csv("03_replication/03_outputs/merged_data.csv")
combined <- group_by(combined, JEL)
perc_female <- summarize(combined, perc_female = mean(Sex == "Female") * 100)
ggplot(perc_female, aes(x = JEL, y = perc_female)) +
  geom_bar(stat = "identity", fill = "darkblue") +
  labs(x = "", y = "% of female authors (per paper)", title = "")