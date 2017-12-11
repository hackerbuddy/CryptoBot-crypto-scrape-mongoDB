import bs4
import urllib.request #used for scraping
import time
import datetime
import pymongo
import ast
from bs4 import BeautifulSoup #used for title parsing
from pymongo import MongoClient
from newScrapeYearly import monthYearlyScrape,cleanThatBoy,findYearlyData
import urllib.parse

#time stuff
date_in_seconds = time.time()
prettyDate= datetime.datetime.fromtimestamp(date_in_seconds).strftime('%m-%d-%Y %H:%M:%S')

print(prettyDate)
print(date_in_seconds)

#attempt connection with Mongo
#client = MongoClient()
#client = MongoClient('localhost', 27017)
username = urllib.parse.quote_plus('OverlordMason')
password = urllib.parse.quote_plus('kingOfTheCastle')
client= MongoClient('mongodb://%s:%s@127.0.0.1/bitcoin_test' % (username, password))



db = client.bitcoin_test #!!!!!!!!! IMPORTANT!!!! This is the database that the script is selecting!

#thank you coin market cap for your contribution. scrape away!
link= "https://coinmarketcap.com/coins/views/all/"

print("Connecting...")
req = urllib.request.Request(link, headers={'User-Agent' : "Magic Browser"})
response= urllib.request.urlopen(req)
html= response.read()		

print("Parsing data...")
soup = BeautifulSoup(html, "html.parser")
rows= soup.find_all('td')
numberOfRows= len(rows)

cleanerRow= ['0'] * numberOfRows

monthYearlyScrape() ##----------Scrape for montly, yearly data!!!!! imported




i=0

#Columns:
#
#0. Rank- 1
rank='0'
#1. Name- Bitcoin
currentCurrency= "empty"
#2. Abbreviation (BTC)
abbreviation= "empty"
#3. Market Cap, total worth
marketCap= '0'
#4. Price in USD
priceUSD= '0'
#5. Supply
supply= '0'
#5.1 Minable (determined by the * on Supply)
#6. Volume--cash movement
volume= '0'
#7. 1 hour change
hourlyChange= 0
#8. 24 hour change
dailyChange = 0
#9. 7 day change
weeklyChange= 0
#0. ......
hourlyRising= 0
dailyRising= 0
weeklyRising= 0
outerJSON= '';
jsonString= ['000'] * 1000
steadyGrowth= ['0'] * 1000
stats= [0] * 5000
h= 0
g= 0
j=0
z=0
lastChar= "0"
minable= True
stringForMongo= ''
currentJSON=''
fatalError=0
importedYearlyStringJSON= ''
appendedJSONS=0

#---------------------Start of outer JSON, which has 1 time and date------------------------------------
#outerJSON= str("{'time':") #string for Mongo should be empty at this point....starting the list

#outerJSON= outerJSON + str(date_in_seconds) #first entry is time...then...

#append date to outerJSON
#outerJSON= outerJSON + str(",'date':'")
#outerJSON= outerJSON + str(prettyDate)  


outerJSON= ("{'coins':") #all the coins, first thing in every json!

#outerJSON= outerJSON + str("','coins':") #all the coins
		
#------------------Start the nested JSON's...-----------------------------------------------------------

print("Preparing the report...")
while i< numberOfRows-1:
	#clean up input. There is a bunch of spaces, dollar signs and weird characters.
	cleanerRow[i]= rows[i].get_text().replace('\n','')
	cleanerRow[i]= cleanerRow[i].replace(' ','')
	cleanerRow[i]= cleanerRow[i].replace('$','')    #get rid of dolla sign
	cleanerRow[i]= cleanerRow[i].replace(',','')
	cleanerRow[i]= cleanerRow[i].replace('%','')    #get rid of percent sign
	cleanerRow[i]= cleanerRow[i].replace('?','-11111')  #-11111 as an error flag, if data is bad
	
	#------------------Start a nested JSON entry --------------------
	#if(j == 0):
		#do nothing...rank is useless, we want to start with name. this is a useless value, we are just skipping this line. wait a second..
	
	#	stringForMongo= stringForMongo + str("{'rank':'") d
	
	if(j == 1):

		cleanerRow[i]= rows[i].find_all("a")[1].get_text()  #clean up name
		
		currentCurrency= cleanerRow[i]
	#-----------------------------------------------------------------------------------------
		if (i == 1): #on the first coin, start a JSON coin array! coins: [{}{}{}.... ]
			stringForMongo= stringForMongo + str("[{'name':'") + str(currentCurrency) #on first coin, open array
			currentJSON= str("{'name':'") + str(currentCurrency)
		else: 
			stringForMongo= stringForMongo + str(",{'name':'") + str(currentCurrency) #on rest of coins, put commas
			currentJSON= str("{'name':'") + str(currentCurrency)
		print(currentCurrency)
	elif(j== 2):	
		stringForMongo= stringForMongo + str("','time':") #time
		stringForMongo= stringForMongo + str(date_in_seconds)
		currentJSON= currentJSON + str("','time':") + str(date_in_seconds)
		
		stringForMongo= stringForMongo + str(",'date':'") #date
		stringForMongo= stringForMongo + str(prettyDate)
		currentJSON= currentJSON + str(",'date':'") + str(prettyDate)
		
		stringForMongo= stringForMongo + str("','abbrev':'") #abbreviation
		currentJSON= currentJSON + str("','abbrev':'")
	elif(j== 3):	
		stringForMongo= stringForMongo + str("','marketCap':")
		currentJSON= currentJSON + str("','marketCap':")
	elif(j== 4):	
		stringForMongo= stringForMongo + str(",'price':")
		currentJSON= currentJSON + str(",'price':")
	elif(j== 5):	
		stringForMongo= stringForMongo + str(",'supply':")
		currentJSON= currentJSON + str(",'supply':")
		lastChar= cleanerRow[i] [len(cleanerRow[i])-1:len(cleanerRow[i])] #checking the last character of a string (length-1 to length)
		if (lastChar == "*"):
			minable = False
			cleanerRow[i]= cleanerRow[i].replace('*','') #get rid of asterix
		else:
			minable = True
			cleanerRow[i]= cleanerRow[i].replace('*','') #get rid of asterix
		
	elif(j== 6):	
		
		stringForMongo= stringForMongo + str(",'volume':")
		currentJSON= currentJSON + str(",'volume':")
	elif(j == 7):
		
		stringForMongo= stringForMongo + str(",'hourlyPriceChange':")
		currentJSON= currentJSON + str(",'hourlyPriceChange':")
	elif(j == 8):
		stringForMongo= stringForMongo + str(",'dailyPriceChange':")
		currentJSON= currentJSON + str(",'dailyPriceChange':")
	elif (j == 9): 
		stringForMongo= stringForMongo + str(",'weeklyPriceChange':")
		currentJSON= currentJSON + str(",'weeklyPriceChange':")
	#-----------------------------------------------------------------------------------------------------------------------
	if(j!=0 and j!= 1): #skip j == 0 and j==1
		stringForMongo= stringForMongo + str(cleanerRow[i]) #!!!!!!!!!!!!!!!!!!!!!!!!! DATA IS APPENDED HERE!!!!
		currentJSON= currentJSON + str(cleanerRow[i])
	#----------------------------------------------------------------------------------------------------------------------------
	
	if (j ==5): #checking if a currency is minable, ---if it has an asterix, it isn't minable...append this data
		
		lastChar= cleanerRow[i] [len(cleanerRow[i])-1:len(cleanerRow[i])] #checking the last character of a string (length-1 to length)
		if (minable == False):
			stringForMongo= stringForMongo + str(",'minable': False")
			currentJSON= currentJSON + str(",'minable': False")
		else:
			stringForMongo= stringForMongo + str(",'minable': True")
			currentJSON= currentJSON + str(",'minable': True")
			
	
	#print(j)
		
	i+=1
	j+=1
	if (j ==  10): #we are done with this currency------------------------------------------
			
			g+=1
			stats[h]= rank
			j=0	#reset j counter	
			hourlyRising=0  #reset price change trackers
			dailyRising=0
			weeklyRising=0
			
			
			#-------------import that beotch, check if it has data for us---
			
			importedYearlyStringJSON= findYearlyData(currentCurrency)
			
			if (importedYearlyStringJSON != 'nothing'):
				stringForMongo= stringForMongo + importedYearlyStringJSON #--------close the JSON entry
				currentJSON= currentJSON + importedYearlyStringJSON
				print('Success!!!' + currentCurrency + 'was found and ' + importedYearlyStringJSON + 'was appended!!!!!' )
				appendedJSONS+=1
			
			stringForMongo= stringForMongo + str("}\n") #--------close the JSON entry
			currentJSON= currentJSON + str("}\n")
#--------------------End of nested Json entry--------------------------------------------------------------	
			#print("current JSON entry is " + currentJSON)
			
			if (currentCurrency == str("Bitcoin")): #if currency is bitcoin, add to the bitcoin document/table
				try:
					documents = db.Bitcoin#select data table ('collection')
					bitcoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitcoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
				
			elif (currentCurrency == str("Ethereum")): 
				try:	
					documents = db.Ethereum#select data table ('collection')
					ethereum_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(ethereum_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1	
			
			elif (currentCurrency == str("Bitcoin Cash")): 
				try:
					documents = db.Bitcoin_Cash#select data table ('collection')
					bitcoin_cash_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitcoin_cash_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1	
			elif (currentCurrency == str("IOTA")): 
				try:
					documents = db.IOTA#select data table ('collection')
					IOTA_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(IOTA_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
			elif (currentCurrency == str("Ripple")):
				try:
					documents = db.Ripple#select data table ('collection')
					ripple_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(ripple_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1	
			elif (currentCurrency == str("Dash")): 
				try:
					documents = db.Dash#select data table ('collection')
					dash_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(dash_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1	
			elif (currentCurrency == str("Litecoin")): 
				try:
					documents = db.Litecoin#select data table ('collection')
					litecoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(litecoin_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
			elif (currentCurrency == str("Bitcoin Gold")): 
				try:
					documents = db.Bitcoin_Gold#select data table ('collection')
					bitcoin_gold_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitcoin_gold_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
			elif (currentCurrency == str("Monero")): 
				try:
					documents = db.Monero#select data table ('collection')
					monero_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(monero_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Cardano")): 
				try:
					documents = db.Cardano#select data table ('collection')
					cardano_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(cardano_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
			elif (currentCurrency == str("Ethereum Classic")): 
				try:
					documents = db.Ethereum_Classic#select data table ('collection')
					ethereum_classic_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(ethereum_classic_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Stellar Lumens")): 
				try:
					documents = db.Stellar_Lumens#select data table ('collection')
					stellar_lumens_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(stellar_lumens_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("NEM")): 
				try:
					documents = db.NEM#select data table ('collection')
					NEM_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(NEM_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("NEO")):
				try:
					documents = db.NEO#select data table ('collection')
					NEO_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(NEO_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Bitconnect")): 
				try:
					documents = db.Bitconnect#select data table ('collection')
					bitconnect_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitconnect_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Lisk")): 
				try:
					documents = db.Lisk#select data table ('collection')
					lisk_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(lisk_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Zcash")):
				try:
					documents = db.Zcash#select data table ('collection')
					zcash_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(zcash_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Qtum")): 
				try:
					documents = db.Qtum#select data table ('collection')
					qtum_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(qtum_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("MonaCoin")): 
				try:
					documents = db.MonaCoin#select data table ('collection')
					monacoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(monacoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Waves")): 
				try:
					documents = db.Waves#select data table ('collection')
					waves_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(waves_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Stratis")): 
				try:
					documents = db.Stratis#select data table ('collection')
					stratis_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(stratis_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Hshare")): 
				try:
					documents = db.Hshare#select data table ('collection')
					hshare_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(hshare_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("BitShares")):
				try:
					documents = db.BitShares#select data table ('collection')
					bitshares_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitshares_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Nxt")): 
				try:
					documents = db.Nxt#select data table ('collection')
					nxt_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(nxt_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Ark")): 
				try:
					documents = db.Ark#select data table ('collection')
					ark_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(ark_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Bytecoin")): 
				try:
					documents = db.Bytecoin#select data table ('collection')
					bytecoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bytecoin_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Einsteinium")): 
				try:
					documents = db.Einsteinium#select data table ('collection')
					einsteinium_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(einsteinium_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Vertcoin")): 
				try:
					documents = db.Vertcoin#select data table ('collection')
					vertcoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(vertcoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Steem")): 
				try:
					documents = db.Steem#select data table ('collection')
					steem_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(steem_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Dogecoin")): 
				try:
					documents = db.Dogecoin#select data table ('collection')
					dogecoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(dogecoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
				
			elif (currentCurrency == str("BitcoinDark")):
				try:
					documents = db.BitcoinDark#select data table ('collection')
					bitcoinDark_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(bitcoinDark_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("GameCredits")): 
				try:
					documents = db.GameCredits#select data table ('collection')
					gameCredits_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(gameCredits_data)	#dump this big string in a data base		
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Komodo")): 
				try:
					documents = db.Komodo#select data table ('collection')
					komodo_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(komodo_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Einsteinium")): 
				try:
					documents = db.Einsteinium#select data table ('collection')
					einsteinium_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(einsteinium_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Zcoin")): 
				try:
					documents = db.Zcoin#select data table ('collection')
					zcoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(zcoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("Potcoin")): 
				try:
					documents = db.Potcoin#select data table ('collection')
					potcoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(potcoin_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("FeatherCoin")): 
				try:
					documents = db.FeatherCoin#select data table ('collection')
					featherCoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(featherCoin_data)	#dump this big string in a data base
				except:
					print("fatal error")
					fatalError= 1
					
			elif (currentCurrency == str("PutinCoin")): 
				try:
					documents = db.PutinCoin#select data table ('collection')
					putinCoin_data = ast.literal_eval(currentJSON) # convert outerJSON to a real json
					result = documents.insert_one(putinCoin_data)	#dump this big string in a data base	
				except:
					print("fatal error")
					fatalError= 1
					
			currentJSON = '' # clean out the old JSON coin
			jsonString[z]= stringForMongo
			z= z+1			
			#print (stringForMongo)
			stringForMongo=''

			
			
print ("There were " + str(g) + " currencies read")			
print("Done")


#------------------------------Close the main JSON entry-----------------------------------------
endArray= str("]\n")
endJSON= str("}\n") 


for z in range(0, 100):   #store top 100 currencies in database...
	#print ("slice of jsonString is" + jsonString[z])
	outerJSON = outerJSON + jsonString[z] #append nested jsons...

outerJSON = outerJSON + endArray + endJSON# close Coins array, and outerJSON
	
print("the final json is" + outerJSON)	
print("The number of JSONS appended was " + str(appendedJSONS))

posts = db.top100coins#select data table ('collection')
post_data = ast.literal_eval(outerJSON) # convert outerJSON to a real json
result = posts.insert_one(post_data)	#dump this big string in a data base

