# -*- coding: utf-8 -*-

class Order:
    def __init__(self, storeName, customerName, customerPhone, customerMail, address, city, placementDate, deliveryDate, deliveryTime, totalPrice, couponName, discount):
        self.storeName = storeName
        self.customerName = customerName
        self.customerPhone = customerPhone.replace("-","")
        self.customerMail = customerMail
        self.address = address
        self.city = city
        self.placementDate = formatDate(placementDate)
        self.deliveryDate = formatDate(deliveryDate)
        self.deliveryTime = deliveryTime
        self.totalPrice = totalPrice[4,len(totalPrice)]
        self.couponName = couponName
        self.discount = discount[4,len(discount)]

class OrderItem:
    def __init__(self, productName, doughName, pizzaSauce, price: str, quantity):
        self.productName = productName
        self.doughName = doughName
        self.pizzaSauce = pizzaSauce
        self.price = price[4,len(price)]
        self.quantity = quantity
  
def convertMonth(row) -> list:
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

def formatDate(dateRow: str): 
    date = dateRow.split()
    date = convertMonth(dateRow)                        
    date.pop(0)
    return "-".join(date)

def insertOrder(Order):
    return NotImplementedError

def insertOrderItem(OrderItem):
    return NotImplementedError

import csv
filename = '../MarioOrderData_1000'
extension= '.csv'

with open(filename + extension, 'r', errors="ignore") as file:
    reader = csv.reader(file, delimiter=';')
    writer = csv.writer(open(filename + 'cleaned' + extension, 'w'))

    iterable = False
    for row in reader:
        # Locate column header row to determine index origin
        if row[0 != "Winkelnaam"] and iterable != True:
            continue
        else:
            iterable = True
            continue

        if row[10] != "":
            if row[0] != "":            
                insertOrder(Order(row[0],row[1],row[2],row[3],row[4],row[5],row[5],row[6],row[7],row[18],row[19],row[20]))

            insertOrderItem(OrderItem(row[7], row[8], row[9], row[10], row[11]))
