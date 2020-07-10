from util import util
import os.path
from bs4 import BeautifulSoup
from connection import connection
import logging
from googletrans import Translator

logger = logging.Logger('catch_all')

if __name__ == '__main__':
    try:
        set = set()
        translator=Translator()
        link = 'https://www.aamc.org/cim/explore-options/specialty-profiles'
        file = 'C:\\Users\\SE130511\\git\\Health-Care-Recomendation-Mobile-API\\CrawlingApp\\MD.html'

        if (os.path.isfile(file) == False):
            util.writeHtmlFile(link, file)
        html = util.readHtmlFile(file)

        soup = BeautifulSoup(html, "html.parser")
        for link in soup.find_all('a',{'class':'specialty-listing__content-anchor'}):
            name=link.string.strip().replace(',','')
            set.add(name)
        for x in set:
            print(x)
            trans = translator.translate(x, dest='vi').text
            print(trans)
            connection.insertSpec(str(x),trans)
    except:
        print("error")
        logger.error()

