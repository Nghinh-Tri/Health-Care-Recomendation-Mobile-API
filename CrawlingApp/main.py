from crawling import factory as factory
from crawling import speciality as speciality
from crawling import symptom as symptom
from crawling import facility_detail as detail

if __name__ == '__main__':
    factory.crawlingFactory("http://www.medinet.gov.vn/DSDonvi.aspx?codekhoi=BVTP",
                    "E:\Health Care Recomendation Mobile API\CrawlingApp\html\BVTP.html")
    factory.crawlingFactory("http://www.medinet.gov.vn/DSDonvi.aspx?codekhoi=BVQH",
                            "E:\Health Care Recomendation Mobile API\CrawlingApp\html\BBVQH.html")
    speciality.crawlingSpeciality("https://www.aamc.org/cim/explore-options/specialty-profiles",
                       "E:\Health Care Recomendation Mobile API\CrawlingApp\html\specialty-profiles.html")
    symptom.crawlingSymptom("https://en.wikipedia.org/wiki/List_of_medical_symptoms")
    detail.setFacilityDetail()