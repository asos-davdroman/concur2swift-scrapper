from SwiftModel import *

def generate_comment(description, indentation):
    indentation_string = '\t' * indentation
    output = ''
    if '\n' in description:
        for paragraph in description.split('\n'):
            output += indentation_string + '/// ' + paragraph + '\n'
    elif description:
        output += indentation_string + '/// ' + description + '\n'
    return output

def generate(model):
    output = generate_comment(model.description, 0)
    output += 'struct ' + model.name + ' {\n'

    for property in model.properties:
        output += generate_comment(property.description, 1)
        optionality = ''
        if not property.required:
            optionality = '?'
        variable = 'var ' + property.name + ': ' + property.type + optionality
        output += '\t' + variable + '\n'

    output += '}'
    return output
