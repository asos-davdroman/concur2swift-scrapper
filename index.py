import requests
from bs4 import BeautifulSoup as scrapper
from SwiftModel import *

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

    # Extract properties from table
    model_properties = []
    for raw_model_table in raw_model_tables:
        trs = raw_model_table.findAll('tr')
        for tr in trs:
            tds = tr.findAll('td')
            property_name = tds[0].get_text()

            property_type_raw = tds[1].get_text()
            property_type = ''
            if property_type_raw is 'string':
                property_type = 'String'
            elif property_type_raw is 'boolean':
                property_type = 'Bool'
            elif property_type_raw is 'number':
                property_type = 'Decimal'
            elif property_type_raw is 'integer':
                property_type = 'Int'
            elif property_type_raw is 'array':
                property_type = 'Array<FIXME>'
            else:
                property_type = property_type_raw

            property_required = tds[2].get_text() is 'true'
            property_description = tds[3].get_text()
            property = SwiftProperty(property_name, property_type, property_required, property_description)
            model_properties.append(property)

    # Create model object
    swift_models.append(SwiftModel(model_name, model_description, model_properties))
