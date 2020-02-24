# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 16:43:38 2020

@author: Lu
"""
       
import pandas as pd

misc_products = pd.read_excel (r'../Overige producten.xlsx')


for row in misc_products.itertuples():
    print(row)