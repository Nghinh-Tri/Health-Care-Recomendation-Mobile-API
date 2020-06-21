from util import util
import os.path
from bs4 import BeautifulSoup
from connection import connection
import logging

logger = logging.Logger('catch_all')

if __name__ == '__main__':
    try:
        link = 'http://www.medinet.gov.vn/DSDonvi.aspx?codekhoi=BVTP'
        file = 'E:\\Python\\CrawlingApp\\SoYTe.html'

        if(os.path.isfile(file) == False):
            util.writeHtmlFile(link,file)
        html = util.readHtmlFile(file)

        soup = BeautifulSoup(html,"html.parser")
        for link in soup.find_all('a', attrs={'class': 'tendonviwebngoai'}):
            name = str(link.string)
            
            key = "AIzaSyAEHOJH4Oi0FWuB9rlQOBlf4eQ2kgXLFo4"
            lat = util.getLocation(key,name,"lat")
            lgn = util.getLocation(key,name,"lng")

            if lat and lgn:

                google_detail_html = util.getHtml('https://www.google.com/search?q=' + name)
                detail_soup = BeautifulSoup(google_detail_html,"html.parser")

                address = detail_soup.find('span', attrs={'class': 'LrzXr'})
                if address:
                    phone = str(detail_soup.find('span', attrs={'class': 'LrzXr zdqRlf kno-fv'}).string)
                    if phone:
                        address = str(address.string)
                        lat = float(str(lat))
                        lgn = float(str(lgn))
                        connection.insert(name,address,lat,lgn,phone)
    except: print("error")