# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import pyodbc 
import os

#initialization

server = 'tcp:os4.database.windows.net'
database = 'Mario'
username = 'learningMachine'
password = 'Oopdevils123'
cnxn = pyodbc.connect('DRIVER={ODBC Driver 11 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

class Address:
  def __init__(self, description, street, number, city, countryCode, postalCode, phone):
    self.description = description
    self.street = street
    self.city = city
    self.countryCode = countryCode
    self.postalCode = postalCode
    self.number = number
    self.phone = phone

#todo change to access importData/Winkels Mario.txt
#os.chdir("/Winkels Mario.txt")

file1 = open('Winkels Mario.txt', 'r') 
Lines = file1.readlines() 

###########################
    
#@Description
#@Street
#@Number
#@City
#@CountryCode
#@PostalCode
#@PhoneNumber




for x in range(0, len(Lines), 8):
    obj = Address(Lines[x], Lines[x+1], Lines[x+2], Lines[x+3], Lines[x+4],
                  Lines[x+5], Lines[x+6])
    
    params = (obj.description, obj.street, obj.number, obj.city, obj.countryCode, obj.postalCode, obj.phone)
    cursor.execute("{CALL CreateRestaurant (?,?,?,?,?,?,?)}", params)
    
    
    
    
#########


cursor.execute("SELECT * FROM Restaurant")
row = cursor.fetchone()
while row:
    print(row)
    row = cursor.fetchone()
    
    



    
    
    
    
    
  
  