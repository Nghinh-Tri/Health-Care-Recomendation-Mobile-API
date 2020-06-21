import requests
import googlemaps

def writeHtmlFile(link,file):
    soup = getHtml(link)
    obj = open(file, "w", encoding="utf-8")
    obj.write(soup)
    obj.close()

def readHtmlFile(file):
    obj = open(file, "r", encoding="utf-8")
    soup = obj.read()
    obj.close()
    return soup

def getHtml(url):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0'}
    source_code = requests.get(url, headers=headers)
    return source_code.text

def getLocation(key, name, line):
    gmaps_key = googlemaps.Client(key=key)
    result = gmaps_key.geocode(name)
    return str(result[0]["geometry"]["location"][line])