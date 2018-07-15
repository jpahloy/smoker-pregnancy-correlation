library(readr)
library(magrittr)
library(tibble)
library(tidyr)
library(ggplot2)
library(dplyr)

smoking <- read_csv('./tobacco_rates.csv')
length(unique(smoking$LocationDesc))
head(smoking)

length(unique(smoking$LocationDesc)) # okay so this column in just states then
length(unique(smoking$TopicType)) # only one tyoe so its stupid
length(unique(smoking$Age)) # a lot of columns are redundant

smoking <- smoking %>% select(YEAR, LocationDesc, TopicDesc, Response, Data_Value, Gender, Education)
smoking <- smoking %>% rename(year=YEAR, state=LocationDesc, topic=TopicDesc, response=Response, value=Data_Value, gender=Gender, education=Education)
length(unique(smoking$state))
# only take the years between 2003 and 2015 as that's the data we have 
smoking <- smoking %>% filter(year >= 2003 & year <= 2015)
length(unique(smoking$state))
# since we are really only dealing with pregnancies between 15 and 19, the likelyhood of them being in middle
# school is pretty small, i think
smoking <- smoking %>% filter(education=='High School') %>% select(-education) 

# let's keep it simple by just using overall, further analysis can be done with genders but it seems like the overall
# class seems to show that though there is a difference between male and female, the numbers aren't that far off
smoking <- smoking %>% filter(gender=='Overall') %>% select(-gender) 
smoking <- na.omit(smoking)

write_csv(smoking, './cleaned_smoking.csv')
