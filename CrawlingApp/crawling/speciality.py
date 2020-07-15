from util import util
import os.path
from bs4 import BeautifulSoup
from connection import connection
import logging
from googletrans import Translator

logger = logging.Logger('catch_all')
set = set()
translator=Translator()
def crawlingSpeciality(link, filepath):
    try:
        print("Start crawling speciality: " + link)
        abPath = os.path.realpath(filepath)
        print(abPath)
        if (os.path.isfile(abPath) == False):
            util.writeHtmlFile(link, abPath)
        html = util.readHtmlFile(abPath)

        soup = BeautifulSoup(html, "html.parser")
        for link in soup.find_all('a',{'class':'specialty-listing__content-anchor'}):
            name=link.string.strip().replace(',','')
            set.add(name)
        for x in set:
            trans = translator.translate(x, dest='vi').text
            connection.insertSpec(str(x),trans)
        print("Crawling Speciality Successfully")
    except:
        print("error at crawling Speciality")
        logger.error


