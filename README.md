# CryptoBot

## Members:
- Abdul Elderrat: Front End, Scrum master 
- Braden Rucinski: Back End, Python Scrape + MongoDB, Product owner 
- Mason Flint: DataRelayService, Dev team
- Sonu Chavakula: Front End, Dev team
- Taylor McNeal: Python Google Trends, Dev team

## What is CryptoBot?
CryptoBot is the name of an initiative to provide a user-friendly and secure interface for users to utilize automated trading algorithms for various cryptocurrencies.  Our current data-flow utilizes several python programs to populate databases with trading information.  The DataRelayService is a layer of abstraction between our user-interfaces and our databases.  Its purpose is to simplify transfer of data between multiple user-interfaces by keeping our queries in one location.  This allows us to only make changes to the DataRelayService should our underlying database architecture change at any point instead of modifying each individual user-interface.  Our DataRelayService then provides information to our user-interfaces, so that our users can see pertinent information for our trading algorithms.

## Video presentation: 
- https://youtu.be/__Z5KL1aNDk

## How did we use Agile?
Our team used Scrum, through Axosoft, and met after nearly every class for our "daily" Scrum standup. Once every 2 weeks we met in order to plan our next sprint, as well as review our previous sprint and retrospect on how we can improve our future efforts. We broke up our project into 4 two-week sprints. 

| Sprints       | Focus                   | Accomplished |
| ------------- |:----------------------: |:------------:|
| Sprint 1      | Setup Servers, Website  |     Yes      |
| Sprint 2      | Web Service and Scrape  |     Yes      |
| Sprint 3      | Switch to Node, make DB |     Yes      |
| Sprint 4      | Bitcoin Price Algorithms|     Yes      |


You can see our Axosoft for more information on how we handled tasking.


## Accomplishments
### Web Service
Our team successfully used multiple servers to create a RESTful Web Service, which communicates to the Back-end server. This was not a required aspect of the project, but Mason had experience with Web Services, and worked with Abdul to use Node.js to enable the servers to communicate remotely and securely.
### Single Page App
Sonu made a sexy looking website with Bootstrap early on, while we struggled to get the rest of the components working together
### Automated Scraping and Data Storage
Braden managed to [scrape very useful data about Bitcoin and other Cryptocurrencies](https://github.com/hackerbuddy/CryptoBot/tree/master/scrapeAndPostToMongo) from multiple websites, which is then stored into [our remote Mongo Database](https://github.com/hackerbuddy/CryptoBot/tree/master/mongoDB%20info) every minute. This data was not available through an API, so he did things the hard way. 
## Challenges
### Busyness
Many of our team members had a very difficult, hectic school schedule and part-time jobs this semester,  which made it difficult to meet. At one point of the semester, progress nearly halted, because everyone was sick or had to go to work. Meeting regularly after class helped a great deal to keep things on track.
### Deadline
Taylor worked with 2 really cool API's through Python--- a GoogleTrends API to find how many searches are being processed with a certain keyword, and also a Twitter API. The plan was to use algorithms, including data from these additional sources, to predict cryptocurrency prices, with some degree of accuracy. Unfortunately, we ran out of time to do this. However, the data and front end is ready, which is our Minimum Viable Product! A basic prediction of whether to buy or not is currently running on the website, yet it does not involve the Twitter or Google Trends data.
## Next Steps
Some team members wish to continue working with CryptoBot, after the project is submitted. Some of the obvious next steps are to find a more reliable data source, and work on back-end algorithms for computing prices. We would like to incorporate Taylor's API's to do some cool data-crunching, as well as incorporate some machine learning with Python, if possible. We would also like to put the Web Service on its own server-- this was our original intention.
## Additional Info
Below are a few of our important DNS addresses. We have a front-end/web-service server, a mySQL database, and a backend scraping/MongoDB server

### ScrapeyServer: 
- Public address:  ec2-54-82-229-89.compute-1.amazonaws.com
- Database Repo: https://github.com/hackerbuddy/CryptoBot/tree/master/mongoDB%20info
- Scrape and Data input Repo: https://github.com/hackerbuddy/CryptoBot/tree/master/scrapeAndPostToMongo
### FrontEndService: 
- Public address: http://ec2-54-164-254-145.compute-1.amazonaws.com
- Repo: https://github.com/AbdulEldarrat/Front-End-CryptoCurrency-Bot-12-5-17-
### BackEndService (DataRelay included):
- Repo: https://github.com/hackerbuddy/CryptoBot
### DataRelayService: 
- Public address: http://ec2-54-164-254-145.compute-1.amazonaws.com/DataRelayService/
- Repo: https://github.com/hackerbuddy/CryptoBot/tree/DataRelayService
### AxoSoft Scrum Board:
- https://abdul.axosoft.com/
### MySql Server: 
- cryptodb.czf1h9vdv76q.us-east-1.rds.amazonaws.com 
