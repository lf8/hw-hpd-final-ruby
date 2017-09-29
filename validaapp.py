#!/usr/bin/env python
import requests
import sys
def testesite():
    try:
        resposta = requests.get('http://localhost:4567')
        print resposta.status_code
    except requests.ConnectionError as e:
        print('App esta down', e)
        sys.exit(1)
    except Exception as e:
        print('Apresentou um erro', e)
        sys.exit(1)

testesite()
