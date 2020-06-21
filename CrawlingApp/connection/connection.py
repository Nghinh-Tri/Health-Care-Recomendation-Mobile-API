import mysql.connector

def connect():
    return mysql.connector.connect(host='localhost',
                                         database='healthcaredb',
                                         user='root',
                                         password='12345')

def insert(name, address,latitude,longtitude, phone):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDupplicate(name):
                sql = "INSERT INTO facilities (name, address,latitude,longtitude, phone, status,image) value (%s,%s,%s,%s,%s,%s,%s)"
                val = (name, address,latitude,longtitude, phone, 0, "")
                mycursor.execute(sql, val)
                connection.commit()
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def checkDupplicate(name):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select name from facilities where name = %s"
            mycursor.execute(sql,(name,))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()