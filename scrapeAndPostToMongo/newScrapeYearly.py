splicerDict= {}

def monthYearlyScrape():
	
	import bs4
	import urllib.request #used for scraping
	import time
	import datetime
	import pymongo
	import ast
	from bs4 import BeautifulSoup #used for title parsing
	from pymongo import MongoClient
	import urllib.parse
	
	link= "https://www.worldcoinindex.com/trending/overview"

	print("Connecting to monthlyYearlyScraper...")
	req = urllib.request.Request(link, headers={'User-Agent' : "Magic Browser"})
	response= urllib.request.urlopen(req)
	html= response.read()		

	splicerString= ''
	soup = BeautifulSoup(html, "html.parser")
	rows= soup.find_all('tr')

	#numberOfRows= len(rows)
	#cleanerRow= ['0'] * numberOfRows

	#print(rows)

	#make a for loop, this line below splits entries
	#i is currency, j is line number
	#i starts at 1
	matches= 0
	dataCounter= 0
	j= 0
	currency_array= ["Bitcoin","Ethereum","Bitcoin Cash","IOTA","Ripple","Dash","Litecoin","Bitcoin Gold","Monero","Cardano","Ethereum Classic","Stellar Lumens","NEM","NEO","Bitconnect","Lisk","Zcash","Qtum","MonaCoin","Waves","Stratis","Hshare","BitShares","Nxt","Ark","Bytecoin","Einsteinium","Vertcoin","Steem","Dogecoin","BitcoinDark","GameCredits","Komodo","Einsteinium","Zcoin","Potcoin","FeatherCoin","PutinCoin"]
	
	for element in range(0,len(currency_array)):
		#print(currency_array[j])
		#print ("ok, we want " + currency_array[j].lower())
		currency_array[j]= currency_array[j].lower()
		#print(currency_array[j])
		j+= 1
	
	print("there are " + str(len(currency_array)) + " currencies")
	
	#for element in currency_array:
	#	print ("hopefully this was changed " + element)
	
	#match= False
	
	for currency in range(1,501):
		
		tempCurrency= rows[currency]
		
		#print(tempCurrency)
		#print('/n')
		
		total_rows= len(tempCurrency)
		#print("number of toal rows is " + str(total_rows))
		
		i=7
		#print("the name is " + tempCurrency.find_all('td')[2].text) #the name
		
		currencyName= tempCurrency.find_all('td')[2].text
		
		if currencyName in currency_array: #if its in the array...
			matches+=1
		#	match= True
			print("hey we got a match with " + str(currencyName) + " !")
			
		
		dataCounter+= 1
		#if(match== True):
		for dataRow in range(7,11):
			currentData= tempCurrency.find_all('td')[i].text
			currentData= cleanThatBoy(currentData)
				
			if (dataRow == 7):
				splicerString= ", 'monthlyPriceChange':" + currentData + ", "
			elif (dataRow == 8):
				splicerString= splicerString + "'3monthlyPriceChange':" + currentData + ", "
			elif (dataRow == 9):
				splicerString= splicerString + "'6monthlyPriceChange':" +  currentData + ", "
			elif (dataRow == 10):
				splicerString= splicerString + "'yearlyPriceChange':" + currentData 
				
				
			dataCounter+=1		
			i += 1
		
		if (splicerString != ''):			
			#print (splicerString)
			splicerDict[currencyName] = splicerString
			splicerString= ''
		#match= False	
		
		
	print("total items parsed is " + str(dataCounter))	
	print("total matches was " + str(matches))
	#print (splicerDict)
	
	
	return	

	#cleanerRow[i]= cleanerRow[i].replace(',','')
	#cleanerRow[i]= cleanerRow[i].replace(' ','')
	#cleanerRow[i]= cleanerRow[i].replace('$','')    #get rid of dolla sign
	#cleanerRow[i]= cleanerRow[i].replace('%','') 
		
			
	#0= rank
	#1= some logo crap
	#2= CURRENCY NAME **************we want 2, to check and add to this currency
	
	#3= nickname
	#4= current price
	#5= daily price?
	#6= 7 days
	
	#7= 30 days **********we want 7,8,9,10
	#8= 90 days
	#9= 180 days
	#10= 365 days!
	
	
	
	#11= coins
	#12= market cap
	#13= market cap rank 

	#so technically speaking, we only care about 2(parsed), 7,8,9,10
	# will match "lower" string and grab these values, if valid!

def cleanThatBoy(stringy):
	#print("Imma make that boy shine!")
	stringy= stringy.replace(' ','')
	stringy= stringy.replace('$','')    #get rid of dolla sign
	stringy= stringy.replace(',','')
	stringy= stringy.replace('%','') 
	return stringy
	
def findYearlyData(stringy):
	print("stringy before fixing was " + stringy)
	stringy= stringy.lower()    #we dont care about case
	stringy= stringy.replace(' ','') #we dont care about spaces
	print("string is currently " + stringy + " after being replaced")
	if stringy in splicerDict:
		#print("wow!!! " + stringy + " has data, which is " + splicerDict[stringy])
		return splicerDict[stringy]
	else:
		print("awwww fuck mann couldn't find anything")
		return 'nothing'
		
#monthYearlyScrape()

