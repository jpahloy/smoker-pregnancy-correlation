library(readr)
library(dplyr)
library(magrittr)

cig.rates <- read_csv('./cleaned_smoking.csv')
length(unique(cig.rates$state))

cig.rates <- cig.rates %>% 
  filter(topic=='Cigarette Use (Youth)', response=='Ever') %>%
  select(year, state, value)

grouped.cig.rates <- cig.rates %>% group_by(year)
b <- grouped.cig.rates %>% arrange(desc(value), .by_group=TRUE)

write_csv(b, './top_smokers.csv')

