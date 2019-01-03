import os

name = os.environ.get('NAME')

def hello_handler(event, context): 
    return f"Hello {name}"
