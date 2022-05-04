#!/usr/bin/python3

import requests
from bs4 import BeautifulSoup
import sys



try:
    url = 'https://crt.sh/?q='+sys.argv[1]
    r =requests.get(url).content
    soup = BeautifulSoup(r,'html.parser')
    bob = soup.find_all('td')
    for stuff in bob:
        print(stuff)
except KeyboardInterrupt:
    quit()
