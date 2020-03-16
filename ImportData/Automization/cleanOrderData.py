# Coding scheme: UTF-8
import pyodbc
import csv

# Database connection parameters
server = 'tcp:os4.database.windows.net'
database = 'Mario'
username = 'learningMachine'
password = 'Oopdevils123'

# Database connection initialization and cursor allocation
cnxn = pyodbc.connect('DRIVER={ODBC Driver 11 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

# Declarations
# -----------------------------------------------------------
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
        self.totalPrice = totalPrice[4: len(totalPrice)]
        self.couponName = couponName
        self.discount = discount[4: len(discount)]

class OrderItem:
    def __init__(self, productName, doughName, pizzaSauce, price: str, quantity):
        self.productName = productName
        self.doughName = doughName
        self.pizzaSauce = pizzaSauce
        self.price = price[4: len(price)]
        self.quantity = quantity
  
def convertMonth(row):
    if (len(row) > 2):
          if (row[2] == 'januari'):
              row[2] = '1'
          elif (row[2] == 'februari'):
              row[2] = '2'
          elif (row[2] == 'maart'):
              row[2] = '3'   
          elif (row[2] == 'april'):
              row[2] = '4'
          elif (row[2] == 'mei'):
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
    date = convertMonth(date)
    date.pop(0)
    return "-".join(date)

def insertOrder(Order):
    params = (Order.storeName, Order.customerName, Order.customerPhone, Order.customerMail, Order.city, Order.address, Order.placementDate, Order.deliveryDate, Order.deliveryTime, Order.totalPrice, Order.discount, Order.couponName)
    cursor.execute("{CALL InsertOrder (?,?,?,?,?,?,?,?,?,?,?,?)}", params)
    
def insertOrderItem(OrderItem):
    cursor.execute("SELECT IDENT_CURRENT('Order') as Id")
    order = cursor.fetchone()
    params = (order.Id, OrderItem.productName, OrderItem.pizzaSauce, OrderItem.doughName, OrderItem.price, OrderItem.quantity)
    cursor.execute("{CALL InsertOrderItemToOrder (?,?,?,?,?,?)}", params)

def insertIngredientToOrderItem(ingredientName):
    cursor.execute("SELECT IDENT_CURRENT('OrderItem') as Id")
    orderItem = cursor.fetchone()
    params = (orderItem.Id, ingredientName)
    cursor.execute("{CALL InsertIngredientToOrderItem (?,?)}", params)
# -----------------------------------------------------------

# Thread execution
# -----------------------------------------------------------
filename = 'ImportData/MarioOrderDataTest_1000.csv'
with open(filename, 'r', errors="ignore") as file:
    reader = csv.reader(file, delimiter=';')

    iterable = False
    for row in reader:
        if (row == []):
            continue
        # Locate column header row to determine index origin
        if iterable != True:
            print("iterable")
            if row[0] == "Winkelnaam":
                print("winkelnaam")
                iterable = True
            continue

        # Check if column 'Product' is not empty
        if row[10] != "":
            # Check if column 'Winkelnaam' is not empty
            if row[0] != "":            
                insertOrder(Order(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[8],row[9],row[19],row[20],row[21]))
            insertOrderItem(OrderItem(row[10], row[11], row[12], row[13], row[15]))
            # Check if column 'Extra Ingredienten' is not empty
            if row[16] != "":
                extraIngredients = row[16].split(",")
                for ingredientName in extraIngredients:
                    insertIngredientToOrderItem(ingredientName)

        cnxn.commit()

cnxn.close()
# -----------------------------------------------------------