import requests
from bs4 import BeautifulSoup as scrapper
import SwiftModel

swift_models = []

page = requests.get('https://media.fitanalytics.com/resources/api/reference-20180420.html#type-style')
soup = scrapper(page.content, 'html.parser')
raw_models = soup.find_all('div', class_='set-description')

for raw_model in raw_models:
    # Only allow actual models
    raw_model_name = raw_model.find('h2')
    if 'id="type-' not in str(raw_model_name):
        continue

    # Only allow models with tables (properties)
    raw_model_tables = raw_model.find_all('table')
    if not raw_model_tables:
        continue

    # Extract model name and description
    model_name = raw_model.find('h2', recursive=False).get_text()
    try:
        model_descriptions = [x.get_text() for x in raw_model.find_all('p', recursive=False)]
        model_description = '\n'.join(model_descriptions)
    except Exception: model_description = ''

    # TODO: extract properties from table

    # TODO: create model object
