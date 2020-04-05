# Coding scheme: UTF-8
import datetime

import pyodbc
import csv
from datetime import datetime

# Database connection parameters
server = 'mssql.fhict.local'
database = 'dbi392341_deeltijds4'
username = 'dbi392341_deeltijds4'
password = 'DeeltijdS4'

# Database connection initialization and cursor allocation
cnxn = pyodbc.connect(
    'DRIVER={ODBC Driver 11 for SQL Server};SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)
cursor = cnxn.cursor()
iterableTest = False


# Declarations
# -----------------------------------------------------------
class Order:
    def __init__(self, storeName, customerName, customerPhone, customerMail, address, city, placementDate, deliveryDate,
                 deliveryTime, totalPrice, couponName, discount):
        self.storeName = storeName
        self.customerName = customerName
        self.customerPhone = customerPhone.replace("-", "")
        self.customerMail = customerMail
        self.address = address
        self.city = city
        self.placementDate = formatDate(placementDate)
        self.deliveryDate = formatDate(deliveryDate)
        self.deliveryTime = deliveryTime if deliveryTime != 'As soon as possible.' else None
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
    if len(row) > 2:
        if row[2] == 'januari':
            row[2] = '01'
        elif row[2] == 'februari':
            row[2] = '02'
        elif row[2] == 'maart':
            row[2] = '03'
        elif row[2] == 'april':
            row[2] = '04'
        elif row[2] == 'mei':
            row[2] = '05'
        elif row[2] == 'juni':
            row[2] = '06'
        elif row[2] == 'juli':
            row[2] = '07'
        elif row[2] == 'augustus':
            row[2] = '08'
        elif row[2] == 'september':
            row[2] = '09'
        elif row[2] == 'oktober':
            row[2] = '10'
        elif row[2] == 'november':
            row[2] = '11'
        elif row[2] == 'december':
            row[2] = '12'
    return row


def formatDate(dateRow: str):
    date = dateRow.split()
    date = convertMonth(date)
    date.pop(0)
    return "-".join(date)


def insertOrder(Order):
    params = (Order.storeName, Order.customerName, Order.customerPhone, Order.customerMail, Order.city, Order.address,
              Order.placementDate, Order.deliveryDate, Order.deliveryTime, Order.totalPrice.replace(",", "."),
              Order.discount.replace(",", "."), Order.couponName)
    # print('order params: ' + str(params))
    cursor.execute("{CALL InsertOrder (?,?,?,?,?,?,?,?,?,?,?,?)}", params)


def insertOrderItem(OrderItem):
    cursor.execute("SELECT IDENT_CURRENT('Order') as Id")
    order = cursor.fetchone()
    params = (
        int(order[0]), OrderItem.productName, OrderItem.pizzaSauce, OrderItem.doughName,
        OrderItem.price.replace(",", "."),
        OrderItem.quantity)

    # result = cursor.execute("SELECT * FROM [Order] WHERE [Order].Id = " + str(int(order[0]))).fetchone()
    # print('orderitem params: ' + str(params))
    cursor.execute("{CALL InsertOrderItemToOrder (?,?,?,?,?,?)}", params)


def insertIngredientToOrderItem(ingredientName):
    cursor.execute("SELECT IDENT_CURRENT('OrderItem') as Id")
    orderItem = cursor.fetchone()
    params = (int(orderItem[0]), ingredientName)
    # print('ingredient params: ' + str(params))
    cursor.execute("{CALL InsertIngredientToOrderItem (?,?)}", params)


def processRow(row):
    # print('current row: ' + str(row))
    # Check if column 'Product' is not empty

    if row[10] != "":
        # Check if column 'Winkelnaam' is not empty
        if row[0] != "":
            try:
                insertOrder(
                    Order(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[8], row[9], row[19], row[20],
                          row[21]))
            except Exception as exception:
                raise exception

        insertOrderItem(OrderItem(row[10], row[11], row[12], row[13], row[15]))
        # Check if column 'Extra Ingredienten' is not empty
        if row[16] != "":
            extraIngredients = row[16].split(",")
            for ingredientName in extraIngredients:
                insertIngredientToOrderItem(ingredientName)
    cnxn.commit()


errorFileName = 'errors.txt'


def writeError(row, currentFile, lineNumber, errorString):
    with open(errorFileName, 'a', errors="ignore") as file:
        now = datetime.now()

        file.write(
            '\n{}|{}|{}|{}|{}|\n'.format(now.strftime("%H:%M:%S") , str(currentFile), str(lineNumber), str(row),
                                         str(errorString)))


# -----------------------------------------------------------

# Thread execution
# -----------------------------------------------------------
filename = '../MarioOrderData02_10000.csv'
startTime = time.time()
rowsProcessed = 0
failedRows = 0
with open(filename, 'r', errors="ignore") as file:
    reader = csv.reader(file, delimiter=';')
    for row in reader:
        if not row:
            continue
        # Locate column header row to determine index origin
        if not iterableTest:
            if row[0] == "Winkelnaam":
                iterableTest = True
                continue
            elif row[0] != '':
                iterableTest = True
                try:
                    rowsProcessed += 1
                    processRow(row)
                except Exception as e:
                    writeError(row, filename, reader.line_num, e)
                    cnxn.rollback()
                    print(str(e))
                    print("skipped row: " + str(row))
                    failedRows += 1
                    iterableTest = False
        else:
            try:
                rowsProcessed += 1
                processRow(row)
            except Exception as e:
                writeError(row, filename, reader.line_num, e)
                cnxn.rollback()
                print(str(e))
                print("skipped row: " + str(row))

                failedRows += 1
                iterableTest = False

endTime = time.time()
diffTime = endTime - startTime

print("Amount of rows processed: " + str(rowsProcessed))
print("Amount of rows failed to process: " + str(failedRows))
print("Script time: " + str(diffTime) + " seconds")

cnxn.close()
# -----------------------------------------------------------
