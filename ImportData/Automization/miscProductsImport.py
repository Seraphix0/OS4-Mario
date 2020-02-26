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
    print(row[1]) #categorie
    print(row[2]) #subcategorie
    print(row[3]) #productnaam
    print(row[4]) #productomschrijving
    print(row[5]) #prijs
    print(row[6]) #spicy
    print(row[7]) #vegetarisch
    print("")

    if row[2] is None:
        categoryParams = (row[1], row[2], 0) 
        cursor.execute("{CALL InsertCategory(?,?,?)", categoryParams)
        cursor.execute("SELECT Id FROM Category WHERE Category.Name = ?", row[1])
    else:
        categoryParams = (row[1], row[2], 1) 
        cursor.execute("{CALL InsertCategory(?,?,?)", categoryParams)
        cursor.execute("SELECT Id FROM Category WHERE Category.Name = ?", row[2])

    categoryRow = cursor.fetchone()

    if categoryRow:
        miscProductParams = (row[3], row[4], categoryRow.Id, row[5], row[6], row[7])
        cursor.execute("{CALL InsertMiscProduct (?,?,?,?,?,?,?)}", miscProductParams)

    cnxn.commit()
    
    