# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 17:16:19 2020

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

misc_products = pd.read_excel (r'../pizzabodems.xlsx')

for row in misc_products.itertuples():
    # print(row[1]) #naam
    # print(row[2]) #diameter
    # print(row[3]) #omschrijving
    # print(row[4]) #toeslag
    print('Inserting: ' + str(row))

    params = (row[1], row[2], row[3], row[4])
    cursor.execute("{CALL InsertPizzaBottom (?,?,?,?)}", params)
    cnxn.commit()
    print('Finished inserting row: ' + str(row[0]))
