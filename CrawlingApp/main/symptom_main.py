from util import util
from bs4 import BeautifulSoup
from connection import connection
import logging
from googletrans import Translator

logger = logging.Logger('catch_all')

def get_specialty(symptom_url):
    text = util.getHtml(symptom_url)
    soup = BeautifulSoup(text, 'html.parser')
    specialty = soup.select_one('.infobox tbody tr td a[title]')
    if specialty is None:
        return 'None'
    return specialty.string

set = set()
translator=Translator()
try:
    url='https://en.wikipedia.org/wiki/List_of_medical_symptoms'
    text=util.getHtml(url)
    soup=BeautifulSoup(text,'html.parser')
    for link in soup.select('html body div div div div div ul li > a'):
        href='https://en.wikipedia.org'+link.get('href')
        title=link.get('title')
        set.add(title)
    for x in set:
        print(x)
        trans = translator.translate(x, dest='vi').text
        print(trans)
        connection.insertSymp(x,trans)

except:
    print("error")
    logger.error()



