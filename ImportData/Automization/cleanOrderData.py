# -*- coding: utf-8 -*-
"""
Created on Sun Mar  1 17:19:19 2020

@author: Lu
"""

           
def convertMonth(row):
    if (len(row) > 2):
          if (row[2] == 'januari'):
              row[2] = '1'
          elif (row[2] == 'februari'):
              row[2] = '2'
          elif (row[2] == 'maart'):
              row[2] = '3'   
          elif (row[2] == 'mei'):
              row[2] = '4'
          elif (row[2] == 'april'):
              row[2] = '5'
          elif (row[2] == 'juni'):
              row[2] = '6'
          elif (row[2] == 'juli'):
              row[2] = '7'
          elif (row[2] == 'augustus'):
              row[2] = '8'
          elif (row[2] == 'september'):
              row[2] = '9'
          elif (row[2] == 'oktober'):
              row[2] = '10'
          elif (row[2] == 'november'):
              row[2] = '11'
          elif (row[2] == 'december'):
              row[2] = '12'

    return row
        


import csv


filename = '../MarioOrderData_1000'
extension= '.csv'

with open(filename + extension, 'r', errors="ignore") as file:
    reader = csv.reader(file, delimiter=';')
    writer = csv.writer(open(filename + 'cleaned' + extension, 'w'))
    for row in reader:
        if (row[0] != ""):
            orderDate = row[6].split()
            orderDate = convertMonth(orderDate)                        
            orderDate.pop(0)
            orderDate = "-".join(orderDate)
            
            deliverDate = row[8].split()
            deliverDate = convertMonth(deliverDate)
            deliverDate.pop(0)
            deliverDate = "-".join(deliverDate)
            
            row[6] = orderDate
            row[8] = deliverDate
            
            print(row)

            
            
 