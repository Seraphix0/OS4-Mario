# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 17:44:29 2020

@author: Lu
"""



# Winkelnaam	
#Klantnaam	#
#TelefoonNr	
#Email	
#Adres	
#Woonplaats	
#Besteldatum	
#AfleverType	
#AfleverDatum	
#AfleverMoment	
##Product
#PizzaBodem
#PizzaSaus	
#Prijs	
#Aantal	
#Extra 
#IngrediÃ«nten	
#Prijs 
#Extra 
#IngrediÃ«nten
#Regelprijs	
#Totaalprijs	
#Gebruikte Coupon	
#Coupon Korting	
#Te Betalen





import csv
with open('../MarioOrderData_1000.csv', 'r', encoding = 'cp850') as file:
    reader = csv.reader(file)
    obj = []
    for row in reader:
        if row == [';;;;;;;;;;;;;;;;;;;;;']:
            #>> make procedure call
            print(obj)
            print("")
            obj = []
        else:
            obj.append(row)
            

