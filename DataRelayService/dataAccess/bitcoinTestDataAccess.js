'use strict';
var MongoClient = require('mongodb').MongoClient;

// TODO: Investigate using environment variables to store credentials
var url = "mongodb://OverlordMason:kingOfTheCastle@ec2-54-82-229-89.compute-1.amazonaws.com:27017/bitcoin_test";

module.exports = {
    getTop100Coins: (count) => {
        return MongoClient.connect(url)
            .then((db) => {
                return db.collection('top100coins')
                    .find()
                    .sort({ time: -1 })
                    .limit(count)
                    .toArray();
            });
    },
    getSymbolInfo: (symbol, count) => {
        return MongoClient.connect(url)
            .then((db) => {
                return db.collection('top100coins')
                    .aggregate([
                        { $unwind: '$coins' },
                        { $sort: { time: -1 } },
                        { $match: { 'coins.abbrev': symbol.toUpperCase() } },
                        { $limit: count }
                    ])
                    .toArray();
            });
    }
}
