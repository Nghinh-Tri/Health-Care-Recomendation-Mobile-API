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
translator = Translator()

def crawlingSymptom(link):
    try:
        print("Start crawling symptom: " + link)
        text=util.getHtml(link)
        soup=BeautifulSoup(text,'html.parser')
        for symptomLink in soup.select('html body div div div div div ul li > a'):
            href='https://en.wikipedia.org'+symptomLink.get('href')
            title=symptomLink.get('title')
            set.add(title)
        for x in set:
            trans = translator.translate(x, dest='vi').text
            connection.insertSymp(x,trans)
        print("Crawling Symptom Successfully")
    except:
        print("error at crawling Symptom")
        logger.error()





