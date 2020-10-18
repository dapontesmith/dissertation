# -*- coding: utf-8 -*-
"""
Created on Sat Oct 17 22:25:37 2020

@author: dapon
"""

#file for cleaning eurostat gdp per capita - removing commas and decimals 

import pandas as pd

dat = pd.read_csv("C:/Users/dapon/Dropbox/Harvard/dissertation/data/eurostat/gdp_nuts3.csv")

holder = []
for i in range(0, len(dat)):
    holder.append(dat["Value"][i].split(".", 1)[0].replace(",",""))
dat["value"] = holder

dat.to_csv("C:/Users/dapon/Dropbox/Harvard/dissertation/data/eurostat/gdp_nuts3_clean.csv")