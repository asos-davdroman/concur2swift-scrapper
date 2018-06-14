import requests
from bs4 import BeautifulSoup as scrapper

page = requests.get('https://media.fitanalytics.com/resources/api/reference-20180420.html#type-style')
soup = scrapper(page.content, 'html.parser')
raw_models = soup.find_all('div', class_='set-description')

for raw_model in raw_models:
    raw_model_name = raw_model.find('h2')

    # Only allow actual models
    if 'id="type-' not in str(raw_model_name):
        continue

    print(raw_model)
