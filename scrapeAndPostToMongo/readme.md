#Some notes About Scraping, Mongo and Python

##"AllCoinsOneDump" Structure

"AllCoinsOneDump.py" is the main, original scraping file, that I wrote, while teaching myself Python. This program follows this process:

1. Use "urlib.request" to ,ake a GET request, through a "Magic" fake browser, to go to a pretty site with rows of Data, to grab the raw HTML.
1.5. Use "pymongo" library to make a connection to the Mongo Database, which is actually local @127.0.0.1/bitcoin_test 
2. Use the "Beautiful Soup" library to make the <html> look pretty and make the <html> easier to parse.
3. Use a massive nested while loop, to go through every row...
   a. Inside of the while loop, parse to get rid of extra characters we don't want, like '%,_,$' or spaces
   b. Inside the while loop, start building a JSON...manually. Later I learned that python supports a MUCH EASIER WAY to make jsons. Oh well. 
   c. At the end of each nested iteration, append data to the JSON string
     c1.use a imported "module", really a method, from my newScrapeYearly.py file, to add additional data, such as monthly, yearly price change
        to the data
   d. After the 10th row is complete, close the JSON
   e. Check if the currency's name, like 'Bitcoin', is one of the coins that we are following
        e1. if it is one of the special coins, insert this JSON into the special individual database
   f. Add the little currency JSON to the BIG "allCoins" jSOn string
   
4. Once we have made our big JSON string, use ast.literal to convert the string into a real JSON, with real types like float, string, etc
    4a. If the data is bad--aka--the scraping failed, or the site changed, this process will fail
5. Dump the very large JSON as an entry

##Notes about Scraping and learning Python, and some weird python quirks

###Mistakes
When I first started writing this python script, I was new to python and was a little intimidated by the odd syntax, even the syntax of 
for loops in python. Even the methods and functions looked pretty weird. So I avoided them == MISTAKE

I kept on adding to the python script, and I'm not gonna lie, the nested while loop is a NIGHTMARE to follow. I did a few things to clean it up, but really, what it needs is modules. 

Python does not directly support case statements--- that is why there are 500 "elifs". You can use python "dictionaries" to emulate a case
statement. I think I would try this next time. 

###Python Dictionaries and JSON
Python's dictionaries are very powerful. They are basically json lists, which you can put anything inside. I didn't realize I could just make a bunch of python dictionaries when I started this project, so I PAINFULLY hand crafted a bunch of hardcoded strings. Ugly, but it 
worked. It would have been much quicker and more readable to use Python Dictionaries.

###My Code Improved
I did eventually clean up my code, by using the newYearlyScrape python file that I wrote recently. I had practiced a lot more python by this point, so I created a few helper functions, and used the real python FOR-LOOP, which is actually, very powerful.

###The Future of Python in this project?
Frankly, I only used Python to scrape because I couldn't find an API that had the data that I wanted. Scraping is a weird skill, that, while it is fun and rewarding, it really has no place in this project. This project badly needs a real data source, through a web service, that we can store stuff into our database. 

The moment I find a data source that I can use, even pay for, to get historical prices and data, we will move in that direction. Until that point, we can't call this a commercial venture.




