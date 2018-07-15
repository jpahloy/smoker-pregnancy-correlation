# What is the correlation between teen smokers and teen pregnancies?

### First, the data:
The data comes from data.gov:
* Tobacco survey: https://catalog.data.gov/dataset/youth-tobacco-survey-yts-data-88e11
* Pregnacy: https://catalog.data.gov/dataset/teen-birth-rates-for-age-group-15-19-in-the-united-states-by-county

### Then, the code:
All the data stuff was done in R. The only part done in Python is finding the intersection between high smoking states and high teen pregnancy states.

### Results:
If we plot the average birth rate with time we see a downward trend since the recession:
![alt text](https://github.com/jpahloy/smoker-pregnancy-correlation/blob/master/pregancy%20plot.png "Pregnancy plot")

If we plot the average tobacco usage (excluding smokeless tobacco, so just cigarettes), we see a similar trend with smokers:
![alt text](https://github.com/jpahloy/smoker-pregnancy-correlation/blob/master/smoking_plot.png "Smoker plot")

Looking at just those who have ever smoked as a teen combined with the pregnancies, we see a correlation of 0.93:
![alt text](https://github.com/jpahloy/smoker-pregnancy-correlation/blob/master/birth%20rate%20and%20tobacco%20usage.png "Corr plot")


### Thoughts?
Well this correlation could be for many reasons:

The simplest one would be that teens delinquent or curious enough to smoke would also be likely to have the same attitude to unprotected sex and therefore more pregnancies. 

Without knowing the population statistics (intresting future project), it's hard to say whether this correlation is from population issues. Lower birthrate would mean less people smoking. But who knows

The recession could have a role in it: less money, less desire for kids, less wasteful spending like on cigs. 

Maybe it's one big ol' coincidence.
