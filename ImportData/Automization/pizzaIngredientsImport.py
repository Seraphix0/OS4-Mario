# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 16:43:38 2020

@author: Lu
"""
import pyodbc 
import pandas as pd

#initialization

server = 'tcp:os4.database.windows.net'
database = 'Mario'
username = 'learningMachine'
password = 'Oopdevils123'
cnxn = pyodbc.connect('DRIVER={ODBC Driver 11 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

ingredient_products = pd.read_excel (r'../pizza_ingredienten.xlsx')

for row in ingredient_products.itertuples():
    print(row[1])   #categorie
    print(row[2])   #subcategorie
    print(row[3])   #productnaam
    print(row[4])   #productomschrijving
    print(row[5])   #prijs
    print(row[6])   #bezorgtoeslag
    print(row[7])   #spicy
    print(row[8])   #vegetarisch
    print(row[9])   #beschikbaar
    print(row[10])  #aantalkeer_ingredient
    print(row[11])  #ingredientnaam
    print(row[12])  #pizzasaus_standaard
    print("")
    params = (row[3], row[4], row[5], row[6], row[7], row[8], row[11], row[12])
    #cursor.execute("{CALL InsertPizzaIngredient (?,?,?,?,?,?,?,?)}", params)
