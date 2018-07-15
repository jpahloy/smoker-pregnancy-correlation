library(tidyverse)
library(magrittr)
library(tibble)
birth_rates <- readr::read_csv('birth_rates.csv')

head(birth_rates)


birth_rates <- birth_rates %>% dplyr::select(Year, State, dplyr::starts_with('Birth Rate'))
birth_rates <- birth_rates %>% dplyr::rename(year=Year, state=State)

colnames(birth_rates)[3] = 'birth.rate'

birth_rates <- birth_rates %>% dplyr::arrange()

grouped_rates <- birth_rates %>% dplyr::group_by(state, year)

grouped_rates

sorted <- grouped_rates %>% dplyr::arrange(state, year, .by_group=TRUE)
sorted

avg_sorted <- sorted %>% dplyr::summarise(mean=mean(birth.rate))

# library(ggplot2)
# alabama <- avg_sorted %>% dplyr::filter(state=='Alabama') 
# alabama <- dplyr::ungroup(alabama) %>% dplyr::select(year, mean)
# 
# qplot(x=year, y=mean, data=alabama, geom='line')

cleaned <- avg_sorted %>% tidyr::spread(key=state, value=mean)

readr::write_csv(cleaned, './cleaned_birth_rates.csv')
