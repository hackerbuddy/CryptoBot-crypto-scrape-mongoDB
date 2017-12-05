'use strict';
var MongoClient = require('mongodb').MongoClient;

var url = "mongodb://OverlordMason:kingOfTheCastle@ec2-54-82-229-89.compute-1.amazonaws.com:27017/bitcoin_test";

module.exports = {
    getTop100Coins: () => {
        return MongoClient.connect(url)
            .then((db) => {
                var cursor = db.collection('top100coins').find().limit(1);
                return cursor.toArray();
            });
    }
}
