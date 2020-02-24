# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 17:16:19 2020

@author: Lu
"""

import pandas as pd

misc_products = pd.read_excel (r'../pizzabodems.xlsx')


for row in misc_products.itertuples():
    print(row)
