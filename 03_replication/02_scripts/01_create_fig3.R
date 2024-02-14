#Author: Jena Shah, Sindhu Priya Mallavarapu
#Date: February, 12, 2024
#Purpose: Generate the second element of the replication. 

library(dplyr)
library(ggplot2) 
red_data <- read.csv("replication/01_outputs/merged_data.csv")

lang_data <- filter(red_data, NativeLanguage == "Non-English" | NativeLanguage == "English")

ggplot(mapping = aes(lang_data$StatValue, lang_data$NativeLanguage)) + geom_count() + theme_classic()

eng_data <- filter(red_data, NativeLanguage == "English")
noneng_data <- filter(red_data, NativeLanguage == "Non-English")

ef <- filter(eng_data, Sex == "Female")
em <- filter(eng_data, Sex == "Male")
nef <- filter(noneng_data, Sex == "Female")
nem <- filter(noneng_data, Sex == "Male")

mean(eng_data$StatValue)
sd(eng_data$StatValue)
median(eng_data$StatValue)
max(eng_data$StatValue)

mean(noneng_data$StatValue)
sd(noneng_data$StatValue)
median(noneng_data$StatValue)
max(noneng_data$StatValue)

mean(ef$StatValue)
sd(ef$StatValue)
median(ef$StatValue)
max(ef$StatValue)

mean(em$StatValue)
sd(em$StatValue)
median(em$StatValue)
max(em$StatValue)

mean(nef$StatValue)
sd(nef$StatValue)
median(nef$StatValue)
max(nef$StatValue)

mean(nem$StatValue)
sd(nem$StatValue)
median(nem$StatValue)
max(nem$StatValue)