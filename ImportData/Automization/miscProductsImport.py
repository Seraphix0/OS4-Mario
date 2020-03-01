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
       
misc_products = pd.read_excel (r'../Overige producten.xlsx')

for row in misc_products.itertuples():
    # print(row[1]) #categorie
    # print(row[2]) #subcategorie
    # print(row[3]) #productnaam
    # print(row[4]) #productomschrijving
    # print(row[5]) #prijs
    # print(row[6]) #spicy
    # print(row[7]) #vegetarisch
    # print("")
    print('Inserting: ' + str(row))
    
    if isinstance(row[5], float) == False:
        print('1: Skipping row: ' + str(row[0]))
        continue
    elif isinstance(row[1], unicode) == False or isinstance(row[3], unicode) == False:
        print('2: Skipping row: ' + str(row[0]))
        continue

    description = 'Geen productomschrijving'
    if isinstance(row[4], unicode):
        description = row[4]

    if row[2] is None:
        categoryParams = (row[1], row[2], 0) 
        cursor.execute("{CALL InsertCategory(?,?,?)}", categoryParams)
        cursor.execute("SELECT Id FROM Category WHERE Category.Name = ?", row[1])
    elif isinstance(row[2], unicode):
        categoryParams = (row[1], row[2], 1) 
        cursor.execute("{CALL InsertCategory(?,?,?)}", categoryParams)
        cursor.execute("SELECT Id FROM Category WHERE Category.Name = ?", row[2])
    
    categoryRow = cursor.fetchone()


    isSpicy = None
    isVegetarian = None

    # Spicy en vegetarisch omzetten naar een bit
    if isinstance(row[6], unicode):
        if row[6] == 'Ja':
            isSpicy = 1
        elif row[6] == 'Nee':
            isSpicy = 0
    else:
        print('3: Skipping row: ' + str(row[0]))

    if isinstance(row[7], unicode):
        if row[7] == 'Ja':
            isVegetarian = 1
        elif row[7] == 'Nee':
            isVegetarian = 0
    else:
        print('4: Skipping row: ' + str(row[0]))

    if categoryRow:
        test = 'test'
        miscProductParams = (row[3], description, categoryRow.Id, row[5], isSpicy, isVegetarian)
        cursor.execute("{CALL InsertMiscProduct (?,?,?,?,?,?)}", miscProductParams)
        
        cnxn.commit()
        print('Finished inserting row: ' + str(row[0]))
    
    