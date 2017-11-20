import tweepy
from pymongo import MongoClient

consumer_key = '72KlX9CDcvTloPARiRv1dnbVG';
consumer_secret = 'RehVj6pYwJfTYD9uvzTMmUK0TALfL0c9c70uqJDm98kvL0M9ej';

auth = tweepy.OAuthHandler(consumer_key, consumer_secret);
api = tweepy.API(auth);

#q = the query to be searched on twitter
#count = the number of tweets to be pulled (0-100)
results = api.search(q="bitcoin", count='100');

server_loc = "ENTER LOCATION OF MONGO SERVER";

client = MongoClient(server_loc)

#define the database to be used
db = client.tweetDB

for tweet in results:
    #define the table to be used within the database
    db.tweets.insert(tweet)