import pandas as pd
import numpy as np


top_preg = pd.read_csv(open('./top_pregnancy.csv', 'r'), sep=',')
top_smoke = pd.read_csv(open('./top_smokers.csv', 'r'), sep=',')

intersections = list()

for year in range(2003, 2016):
    preg_sub = top_preg[top_preg.Year == year]['State']
    smoke_sub = top_smoke[top_smoke.year == year]['state']

    if len(smoke_sub) > 5: # since we don't know how many states in the smoking data we have, let's clip it
        smoke_sub = smoke_sub[:5]

    inter = set(preg_sub).intersection(smoke_sub)
    print(inter)

    intersections.append(inter)

with open('./intersection.txt', 'w') as file:
    for year in range(2003, 2016):
        file.write(str(year) + '\n')
        for item in intersections[year - 2003]:
            file.write(item + '\n')

        file.write('\n')