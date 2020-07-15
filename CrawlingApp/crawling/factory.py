from util import util
import os.path
from bs4 import BeautifulSoup
from connection import connection
from selenium import webdriver
import logging

logger = logging.Logger('catch_all')

def crawlingFactory(link, filepath):
    try:
        print("Start crawling factory: " + link)
        abPath = os.path.realpath(filepath)
        if(os.path.isfile(abPath) == False):
            util.writeHtmlFile(link,abPath)
        html = util.readHtmlFile(abPath)

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
                        image = getImage(name)
                        if image:
                            connection.insert(name,address,lat,lgn,phone,image)
        print("Crawling Factory Successfully")
    except: print("error at crawling Facility")

def getImage(factory):
    abPath = os.path.realpath('chromedriver.exe')
    browser = webdriver.Chrome(abPath)
    browser.get('http://www.google.com/images?q==' + factory + "-logo")
    data = BeautifulSoup(browser.page_source,"html.parser")
    image = data.find('img',{'class':'rg_i Q4LuWd'})
    browser.close()
    return image['src']
