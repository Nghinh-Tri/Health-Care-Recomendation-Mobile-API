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

def insertSpec(speciality):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDuplicateSpec(speciality):
                sql = "INSERT INTO specialities (speciality,status,translation) value (%s,%s,%s)"
                val = (speciality,"0","")
                mycursor.execute(sql, val)
                connection.commit()
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def insertSymp(symptom):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDuplicateSymp(symptom):
                sql = "INSERT INTO symptoms (symptom,translation ) value (%s,%s)"
                val = (symptom,"")
                mycursor.execute(sql, val)
                connection.commit()
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def checkDuplicateSymp(symptom):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select symptom from symptoms where symptom = %s"
            mycursor.execute(sql,(symptom,))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def checkDuplicateSpec(speciality):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select speciality from specialities where speciality = %s"
            mycursor.execute(sql,(speciality,))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()
