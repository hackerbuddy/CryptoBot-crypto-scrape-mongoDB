'use strict';
var MongoClient = require('mongodb').MongoClient;

// TODO: Investigate using environment variables to store credentials
var url = "mongodb://OverlordMason:kingOfTheCastle@ec2-54-82-229-89.compute-1.amazonaws.com:27017/bitcoin_test";

module.exports = {
    getTop100Coins: (count) => {
        return MongoClient.connect(url)
            .then((db) => {
                var results =
                    db.collection('top100coins')
                        .find()
                        .limit(count)
                        .sort({ time: -1 })
                        .toArray();
                db.close();
                return results;
            });
    },
    getSymbolInfo: (symbol, count) => {
        return MongoClient.connect(url)
            .then((db) => {
                var results =
                    db.collection('top100coins')
                        .aggregate([
                            { $unwind: '$coins' },
                            { $match: { 'coins.abbrev': symbol.toUpperCase() } },
                            { $sort: { time: -1 } },
                            { $limit: count }
                        ])
                        .toArray();
                db.close();
                return results;
            });
    },
    getLatestBtcOptimality: () => {
        return MongoClient.connect(url)
            .then((db) => {
                var results =
                    db.collection('bitcoin_buy')
                        .find()
                        .limit(1)
                        .sort({ $natural: -1 })
                        .toArray();
                db.close();
                return results;
            });
    },
    getLatestLtcOptimality: () => {
        return MongoClient.connect(url)
            .then((db) => {
                var results =
                    db.collection('litecoin_buy')
                        .find()
                        .limit(1)
                        .sort({ $natural: -1 })
                        .toArray();
                db.close();
                return results;
            });
    },
    getLatestEthOptimality: () => {
        return MongoClient.connect(url)
            .then((db) => {
                var results =
                    db.collection('ethereum_buy')
                        .find()
                        .limit(1)
                        .sort({ $natural: -1 })
                        .toArray();
                db.close();
                return results;
            });
    }
}
