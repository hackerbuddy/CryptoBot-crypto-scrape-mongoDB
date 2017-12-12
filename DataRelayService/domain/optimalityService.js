'use strict';
var debug = require('debug')('DataRelayService');
var bitcoinTest = require('../dataAccess/bitcoinTestDataAccess');

var getApiOptimality = (dbOptimality) => {
    switch (dbOptimality) {
        case "buy":
            return "good";
        case "don\'t buy":
            return "bad";
        default:
            return "error";
    }
}

module.exports = {
    getLatestOptimalities: () => {
        var btcOptimality =
            bitcoinTest.getLatestBtcOptimality()
                .then((result) => {
                    return result[0];
                }).catch((err) => {
                    console.log(err);
                    debug(err);
                });
        var ltcOptimality =
            bitcoinTest.getLatestLtcOptimality()
                .then((result) => {
                    return result[0];
                }).catch((err) => {
                    console.log(err);
                    debug(err);
                });
        var ethOptimality =
            bitcoinTest.getLatestEthOptimality()
                .then((result) => {
                    return result[0];
                }).catch((err) => {
                    console.log(err);
                    debug(err);
                });
        return Promise.all([btcOptimality, ltcOptimality, ethOptimality])
            .then((results) => {
                var btcOptimality = results[0] ? getApiOptimality(results[0].optimality) : "error";
                var ltcOptimality = results[1] ? getApiOptimality(results[1].optimality) : "error";
                var ethOptimality = results[2] ? getApiOptimality(results[2].optimality) : "error";

                return [
                    { symbol: "BTC", name: "Bitcoin", optimality: btcOptimality },
                    { symbol: "LTC", name: "Litecoin", optimality: ltcOptimality },
                    { symbol: "ETH", name: "Ethereum", optimality: ethOptimality }
                ];
            });
    }
}
