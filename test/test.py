#-*- coding: UTF-8 -*-
import requests
def request(url):
    response = requests.get(url)
    print(response)

if __name__=='__main__':
    request("https://www.baidu.com")
