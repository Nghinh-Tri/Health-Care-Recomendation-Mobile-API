from connection import connection
from bs4 import BeautifulSoup
from util import util
import logging
from googletrans import Translator
import validators
import mysql.connector

logger = logging.Logger('catch_all')
translator = Translator()

def get_specialty(symptom):
    html = "https://en.wikipedia.org/wiki/" + symptom
    html = html.replace(" ", "_")
    text = util.getHtml("https://en.wikipedia.org/wiki/" + symptom)
    soup = BeautifulSoup(text, 'html.parser')
    specialty = soup.select('.infobox tbody tr td a[title]')
    for i in specialty:
        if connection.checkDuplicateSpec(str(i.string)):
            return connection.getSpecialitiesByName(i.get('title'))

def findAllFacilities(url):
    list = set()
    try:
        text=util.getHtml(url)
        soup=BeautifulSoup(text,'html.parser')
        for link in soup.select("h3 > a"):
            string=link.get('title')
            list.add(string)
        # for x in list:
        #     print(x)
        return list
    except:
        print("error")
        logger.error()


def getFacilitiesBySpec(speciality):
    list=set()
    try:
        url='https://timbenhvien.vn/'
        text=util.getHtml(url)
        soup=BeautifulSoup(text,'html.parser')
        for link in soup.find_all('a'):
            title=link.string
            href=link.get('href')
            if title != None:
                trans=translator.translate(title, dest='en').text
                if speciality in trans:
                    print("spec: " +trans)
                    print(href)
                    if validators.url(href):
                        for x in findAllFacilities(href):
                            if connection.getID(x):
                                id=connection.getID(x)[0][0]
                                list.add(id)
        return list
    except:
        print("error")
        logger.error()

if __name__ == '__main__':
    symptoms = connection.getAllSymptom()
    # specialities = connection.getSpecialitiesByName()

    for symp in symptoms:
        id = symp[0]
        symptom = symp[1]
        translate = symp[2]
        print("symptom: " + symptom)

        spec = get_specialty(symptom)
        if (spec != None and len(spec) > 0):
            specId = spec[0][0]
            speciality = spec[0][1]
        else:
            specId = '229'
            speciality = 'General Surgery'
        for x in getFacilitiesBySpec(speciality):
            connection.insertFacDetail(id,specId,x)
