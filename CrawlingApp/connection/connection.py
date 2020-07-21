import mysql.connector
# install package mysql python connector
def connect():
    conn = mysql.connector.connect(host='34.87.101.18',
                                    database='healthcaredb',
                                    user='tritnse130094',
                                    password='GNM2mCCCjcAHb6ui',
                                    use_unicode=True,
                                    charset="utf8")
    return conn;

def insert(name, address,latitude,longtitude, phone, image):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDupplicate(name):
                sql = "INSERT INTO facilities (name, address,latitude,longtitude, phone,image) value (%s,%s,%s,%s,%s,%s)"
                val = (name, address,latitude,longtitude, phone, image)
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

def insertSpec(speciality,translation):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDuplicateSpec(speciality):
                sql = "INSERT INTO specialities (speciality,translation) value (%s,%s)"
                val = (speciality,translation)
                mycursor.execute(sql, val)
                connection.commit()
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def insertSymp(symptom,translation):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDuplicateSymp(symptom):
                sql = "INSERT INTO symptoms (symptom,translation) value (%s,%s)"
                val = (symptom,translation)
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

def getAllSymptom():
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select * from symptoms"
            mycursor.execute(sql)
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def getSpecialitiesByName(name):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select * from specialities where speciality = %s"
            mycursor.execute(sql,(name,))
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

def getFacilityID(facility):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select id from facilities where name like %s"
            mycursor.execute(sql,(facility,))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def getSpecialityIDByName(speciality):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select id from specialities where speciality = %s"
            mycursor.execute(sql,(speciality,))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def checkDuplicateFacDetail(sympID,specID,facID):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            sql = "select facilitiesdetails_id from facilitiesdetails where (facility_id = %s and speciality_id = %s and symptom_id = %s)"
            mycursor.execute(sql,(facID,specID,sympID))
            result = mycursor.fetchall()
            return result
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()

def insertFacDetail(sympID,specID,facID):
    try:
        connection = connect()
        if connection.is_connected():
            mycursor = connection.cursor()
            if not checkDuplicateFacDetail(sympID,specID,facID):
                sql = "INSERT INTO facilitiesdetails (facility_id,speciality_id,symptom_id) value (%s,%s,%s)"
                val = (facID,specID,sympID)
                mycursor.execute(sql, val)
                connection.commit()
    finally:
        if connection.is_connected():
            mycursor.close()
            connection.close()
