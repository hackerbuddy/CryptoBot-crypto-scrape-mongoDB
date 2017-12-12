import bs4
import urllib.request #used for scraping
import time
import datetime
import pymongo
import ast
from bs4 import BeautifulSoup #used for title parsing
from pymongo import MongoClient
import urllib.parse
from pprint import pprint

def make_decision (coinInfo, db):
    db.drop()
    wi = coinInfo.get('weeklyPriceChange')
    di = coinInfo.get('dailyPriceChange')
    hi = coinInfo.get('hourlyPriceChange')
    if (wi <= 0):
        if (di <= 0):
            if (hi <= 0):
                db.insert_one({ "optimality" : "don't buy" })
            else:
                db.insert_one({ "optimality" : "don't buy" })
        else:
            if (hi <= 0):
                db.insert_one({ "optimality" : "don't buy" })
            else:
                db.insert_one({ "optimality" : "buy" })
    else:
        if (di <= 0):
            if (hi <= 0):
                db.insert_one({ "optimality" : "don't buy" })
            else:
                db.insert_one({ "optimality" : "buy" })
        else:
            if (hi <= 0):
                db.insert_one({ "optimality" : "buy" })
            else:
                db.insert_one({ "optimality" : "buy" })

username = urllib.parse.quote_plus('OverlordMason')
password = urllib.parse.quote_plus('kingOfTheCastle')
client = MongoClient('mongodb://%s:%s@127.0.0.1/bitcoin_test' % (username, password))

bitcoin = client.bitcoin_test.bitcoin_buy
ethereum = client.bitcoin_test.ethereum_buy
litecoin = client.bitcoin_test.litecoin_buy

bitcoinInfo = client.bitcoin_test.Bitcoin.find_one()
ethereumInfo = client.bitcoin_test.Ethereum.find_one()
litecoinInfo = client.bitcoin_test.Litecoin.find_one()

make_decision(bitcoinInfo, bitcoin)
make_decision(ethereumInfo, ethereum)
make_decision(litecoinInfo, litecoin)

print(bitcoin.find_one().get('optimality'))
print(ethereum.find_one().get('optimality'))
print(litecoin.find_one().get('optimality'))

client.close()