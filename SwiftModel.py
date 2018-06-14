class SwiftProperty:
    name = ''
    type = ''
    required = False
    description = ''

    def __init__(self, name, type, required, description):
        self.name = name
        self.type = type
        self.required = required
        self.description = description

class SwiftModel:
    name = ''
    description = ''
    properties = []

    def __init__(self, name, description, properties):
        self.name = name
        self.description = description
        self.properties = properties
