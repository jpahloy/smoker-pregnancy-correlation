smoking <- read_csv('./cleaned_smoking.csv')

cig <- smoking %>% filter(topic=='Cigarette Use (Youth)') %>% select(-topic)
smkless <- smoking %>% filter(topic=='Smokeless Tobacco Use (Youth)') %>% select(-topic)

# we want to get the average response for each year for the entire america
group_cig <- cig %>% group_by(year, response) %>% summarise(mean=mean(value))
ggplot(group_cig, aes(x=year, y=mean, group=response, colour=response)) + geom_line()


group_smkless <- smkless %>% group_by(year, response) %>% summarise(mean=mean(value))
ggplot(group_smkless, aes(x=year, y=mean, group=response, colour=response)) + geom_line()

write_csv(group_cig, './grouped_cig.csv')
