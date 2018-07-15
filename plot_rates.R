library(dplyr)
library(magrittr)
library(readr)
library(ggplot2)
library(reshape2)

birth.rates <- read_csv('./birth_rates.csv') %>%
  select(year=Year, state=State, county=County, rate='Birth Rate') %>%
  group_by(year) %>%
  summarise(avg=mean(rate))


smoking.rates <- read_csv('./grouped_cig.csv') %>%
  filter(response=='Ever') %>%
  select(-response)

combined.rates <- left_join(birth.rates, smoking.rates) %>% 
  rename('Teen Birth Rate'=avg, 'Teen Smoking Rate'=mean) %>%
  melt(id.vars='year', value.name='Rate', variable.name='LEGEND') # had to use a work around for the legend lable


cor. <- cor(smoking.rates$mean, birth.rates$avg)
title. <- paste('Teen Birth Rate with Tobacco Usage. Corr:', 
               format(round(.cor, 2), nsmall = 2))
ggplot() +
  geom_path(data=combined.rates, aes(x=year, y=Rate, colour=LEGEND), size=2, lineend='round') +
  labs(title=title., x='year', y='rate')



  