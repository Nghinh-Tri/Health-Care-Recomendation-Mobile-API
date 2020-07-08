from util import util
import os.path
from bs4 import BeautifulSoup
from connection import connection
import logging

logger = logging.Logger('catch_all')

def get_specialty(symptom_url):
    text = util.getHtml(symptom_url)
    soup = BeautifulSoup(text, 'html.parser')
    specialty = soup.select_one('.infobox tbody tr td a[title]')
    if specialty is None:
        return 'None'
    return specialty.string

set = set()
try:
    url='https://en.wikipedia.org/wiki/List_of_medical_symptoms'
    text=util.getHtml(url)
    soup=BeautifulSoup(text,'html.parser')
    for link in soup.select('html body div div div div div ul li > a'):
        href='https://en.wikipedia.org'+link.get('href')
        title=link.get('title')
        print(title)
        set.add(title)
    for x in set:
        connection.insertSymp(x)

except:
    print("error")
    logger.error()



