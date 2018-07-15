library(magrittr)
library(tibble)
library(ggplot2)
library(dplyr)

birth_rates <- readr::read_csv('./birth_rates.csv')
birth_rates <- birth_rates %>% select(Year, State, County, birth.rate='Birth Rate')


birth_rates <- birth_rates %>% group_by(Year, State)

birth_rates <- birth_rates %>% summarise(mean=mean(birth.rate)) %>% arrange(desc(mean), .by_group=TRUE)

top <- top_n(birth_rates, n=15)

write_csv(top, './top_15_pregnancy.csv')
