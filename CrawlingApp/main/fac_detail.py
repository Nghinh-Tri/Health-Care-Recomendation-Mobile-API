from main import symptom_main as Symptom
from connection import connection
from bs4 import BeautifulSoup
import requests
from util import util
import string


def get_specialty(symptom):
    html = "https://en.wikipedia.org/wiki/" + symptom
    html = html.replace(" ", "_")
    text = util.getHtml("https://en.wikipedia.org/wiki/" + symptom)
    soup = BeautifulSoup(text, 'html.parser')
    specialty = soup.select('.infobox tbody tr td a[title]')
    for i in specialty:
        if connection.checkDuplicateSpec(str(i.string)):
            # print("Spec: " + i.get('title'))
            return connection.getSpecialitiesByName(i.get('title'))



if __name__ == '__main__':
    symptoms = connection.getAllSymptom()
    # specialities = connection.getAllSpecialities()

    for symp in symptoms:
        id = symp[0]
        symptom = symp[1]
        translate = symp[2]
        # print("symptom: " + symptom)
        spec = get_specialty(symptom)
        if (spec != None and len(spec) > 0):
            # print(spec[0][0])
            print(spec)

